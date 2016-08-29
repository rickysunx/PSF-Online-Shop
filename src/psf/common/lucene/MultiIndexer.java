package psf.common.lucene;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import psf.common.PsfHtmlUtils;
import psf.framework.PsfSqlMapClient;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * 建立索引类，对数据库中指定的表建立索引，建立多目录的索引。
 * @author 肖慧
 *
 */
public class MultiIndexer {
	private static String[] tables =  {	//需要建立索引的表名
		"t_post", "t_user", "t_group", "t_topic"
	};
	
	private static String indexDir = "E:\\Workspaces\\LuceneTest\\multi_index";	//索引总目录，其下面根据不同的表有不同的分目录
	
	private static String sql_post = "select p.postid,p.posttype,p.title,p.content from t_post p where" +
	" p.delflag=0 and  (not exists (select null from t_group where p.posttype=5 and p.typeid=groupid and grouptype>2)" + 
	" or not exists (select null from t_post_topic pt,t_topic t,t_group g where p.postid=pt.postid and pt.topicid=t.topicid and t.groupid=g.groupid and g.grouptype>2))";
	private static String sql_user = "select uid,username from t_user where sealflag != 1";
	private static String sql_group = "select groupid,groupname,intro,grouptag from t_group where grouptype != 4 and delflag = 0";
	private static String sql_topic = "select topicid,topictitle from t_topic where delflag = 0";
	
	private static Map<String, Directory> index_dirs = new HashMap<String, Directory>();
	private static Map<String, String> index_sqls = new HashMap<String, String>();
	static{
		try{
			index_dirs.put("t_post", FSDirectory.open(new File(indexDir+"\\post_index")));
			index_dirs.put("t_user", FSDirectory.open(new File(indexDir+"\\user_index")));
			index_dirs.put("t_group", FSDirectory.open(new File(indexDir+"\\group_index")));
			index_dirs.put("t_topic", FSDirectory.open(new File(indexDir+"\\topic_index")));
			
			index_sqls.put("t_post", sql_post);
			index_sqls.put("t_user", sql_user);
			index_sqls.put("t_group", sql_group);
			index_sqls.put("t_topic", sql_topic);
		}catch(Exception e){
			System.out.println("建立数据表与索引目录映射失败!");
		}
	}
	
	private Connection conn = null;	//数据库连接对象
	
	public MultiIndexer() {
		try {
			SqlMapClient sqlmap = PsfSqlMapClient.getSqlMapInstance();
			conn = sqlmap.getCurrentConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("创建数据库连接失败!"+e.getMessage());
		}
	}
	
	public void createIndex(){
		try{
			Analyzer analyzer = new IKAnalyzer();
			long stime = System.currentTimeMillis();
			for(String tablename : tables){
				Directory dir = index_dirs.get(tablename);
				String sql = index_sqls.get(tablename);
				IndexWriter writer = new IndexWriter(dir, analyzer, true, MaxFieldLength.LIMITED);
				writer.setUseCompoundFile(true);
				
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				createIndex(writer, tablename, rs);
				
				writer.optimize();
				writer.close();
			}
			
			long time = (System.currentTimeMillis() - stime)/1000;
			System.out.println("建立索引结束。耗时："+time+"秒");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("索引建立失败！");
		}
	}
	
	private void createIndex(IndexWriter writer, String tablename, ResultSet rs){
		if(tablename.equals("t_post")){
			PostIndex(writer,rs);
		}else if(tablename.equals("t_user")){
			UserIndex(writer,rs);
		}else if(tablename.equals("t_group")){
			GroupIndex(writer,rs);
		}else if(tablename.equals("t_topic")){
			TopicIndex(writer,rs);
		}
	}
	
	private void PostIndex(IndexWriter writer, ResultSet rs){
		try{
			while(rs.next()){
				Document document = new Document();
				StringBuffer content = new StringBuffer();
				String postid = String.valueOf(rs.getInt("postid"));
				String posttype = String.valueOf(rs.getInt("posttype"));
				String posttitle = (rs.getString("title") == null) ? "" : rs.getString("title");
				String postcontent = (rs.getString("content") == null) ? "" : rs.getString("content");
				postcontent = PsfHtmlUtils.decodeText(postcontent);
				content.append(posttitle).append(postcontent);
				
				Field postidField = new Field("postid", postid, Field.Store.YES, Field.Index.NO);
				document.add(postidField);
				Field posttypeField = new Field("posttype", posttype, Field.Store.YES, Field.Index.ANALYZED);
				document.add(posttypeField);
				Field contentField = new Field("content", content.toString(), Field.Store.YES, Field.Index.ANALYZED);
				document.add(contentField);
				writer.addDocument(document);
				
				System.out.println("t_post记录"+postid+"的检索添加成功！");
			}
		}catch(Exception e){
			System.out.println("建立t_post索引失败!"+e.getMessage());
		}
	}
	
	private void UserIndex(IndexWriter writer, ResultSet rs) {
		try{
			while(rs.next()){
				Document document = new Document();
				String uid = String.valueOf(rs.getInt("uid"));
				String username = rs.getString("username") == null ? "" : rs.getString("username");
				
				Field uidField = new Field("uid", uid, Field.Store.YES, Field.Index.NO);
				document.add(uidField);
				Field contentField = new Field("content", username, Field.Store.YES, Field.Index.ANALYZED);
				document.add(contentField);
				writer.addDocument(document);
				
				System.out.println("t_user记录"+uid+"的检索添加成功！");
			}
		}catch(Exception e){
			System.out.println("建立t_user索引失败!"+e.getMessage());
		}
	}
	
	private void GroupIndex(IndexWriter writer, ResultSet rs) {
		try{
			while(rs.next()){
				Document document = new Document();
				StringBuffer content = new StringBuffer();
				String groupid = String.valueOf(rs.getInt("groupid"));
				String intro = rs.getString("intro") == null ? "" : rs.getString("intro");
				String grouptag = rs.getString("grouptag") == null ? "" : rs.getString("grouptag");
				content.append(intro).append(grouptag);
				
				Field groupidField = new Field("groupid", groupid, Field.Store.YES, Field.Index.NO);
				document.add(groupidField);
				Field contentField = new Field("content", content.toString(), Field.Store.YES, Field.Index.ANALYZED);
				document.add(contentField);
				writer.addDocument(document);
				
				System.out.println("t_group记录"+groupid+"的检索添加成功！");
			}
		}catch(Exception e){
			System.out.println("建立t_group索引失败!"+e.getMessage());
		}
	}

	private void TopicIndex(IndexWriter writer, ResultSet rs) {
		try{
			while(rs.next()){
				Document document = new Document();
				String topicid = String.valueOf(rs.getInt("topicid"));
				String topictitle = rs.getString("topictitle") == null ? "" : rs.getString("topictitle");
				
				Field topicidField = new Field("topicid", topicid, Field.Store.YES, Field.Index.NO);
				document.add(topicidField);
				Field contentField = new Field("content", topictitle, Field.Store.YES, Field.Index.ANALYZED);
				document.add(contentField);
				writer.addDocument(document);
				
				System.out.println("t_topic记录"+topicid+"的检索添加成功！");
			}
		}catch(Exception e){
			System.out.println("建立t_topic索引失败!"+e.getMessage());
		}
	}

}
