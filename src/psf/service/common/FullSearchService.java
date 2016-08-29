package psf.service.common;

import java.io.File;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.MultiSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.IKSegmentation;
import org.wltea.analyzer.Lexeme;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKQueryParser;

/**
 * 全文检索类
 * 
 * @author 肖慧
 * 
 */
public class FullSearchService {
	private static Integer SEARCH_NUMBER = 4;	//检索器的数目 
	private static Integer MAX_RESULT = 10000;
	private static String indexDir = "E:\\Workspaces\\LuceneTest\\multi_index";	//索引父目录
	public IndexSearcher[] searchers = new IndexSearcher[SEARCH_NUMBER];
	public MultiSearcher multisearch = null;
	public Integer type = null; // 检索类型：0-全部，1-广播，2-秀场，3-体验，4-指南，5-品友，6-圈子，7-话题

	public FullSearchService() {
		this(0);
	}

	public FullSearchService(Integer type) {
		try {
			IndexSearcher post_searcher = new IndexSearcher(FSDirectory.open(new File(indexDir+"\\post_index")));
			IndexSearcher user_searcher = new IndexSearcher(FSDirectory.open(new File(indexDir+"\\user_index")));
			IndexSearcher group_searcher = new IndexSearcher(FSDirectory.open(new File(indexDir+"\\group_index")));
			IndexSearcher topic_searcher = new IndexSearcher(FSDirectory.open(new File(indexDir+"\\topic_index")));
			searchers[0] = post_searcher;
			searchers[1] = user_searcher;
			searchers[2] = group_searcher;
			searchers[3] = topic_searcher;
			multisearch = new MultiSearcher(searchers[0],searchers[1]);
			this.type = type;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("搜索对象建立失败！");
		}
	}

	/* 获取中文分词器 */
	public synchronized Analyzer getAnalyzer() {
		return new IKAnalyzer();
	}

	/**
	 * 返回符合记录的ID
	 * @param keyword 查询关键字
	 * @return
	 */
	public Integer[][] search(String keyword) {
		// String[] keywords = keyword.trim().split(" "); //按空格切分查询关键字
		return search(keyword, MAX_RESULT);
	}
	
	/**
	 * 返回符合记录的ID
	 * @param keyword 查询关键字
	 * @param top 前top条记录
	 * @return
	 */
	public Integer[][] search(String keyword, int top) {
		Integer[][] result = new Integer[5][];
		int type = getType();
		try {
			keyword = splitWord(keyword);
			if(keyword == null){
				return null;
			}
			if(type == 0){
				Integer[][] ids = searchAll(keyword, top);
				for(int i=0;i<ids.length;i++){
					result[i] = ids[i];
				}
			}else if(type>0 && type<5){
				result[0] = searchPost(keyword, type, top);
			}else if(type == 5){
				result[0] = searchUser(keyword, top);
			}else if(type == 6){
				result[0] = searchGroup(keyword, top);
			}else if(type == 7){
				result[0] = searchTopic(keyword, top);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry,检索失败！");
		}
		return result;
	}
	
	/**
	 * 全部搜索
	 * @param keyword
	 * @param top
	 * @return
	 */
	private Integer[][] searchAll(String keyword, int top) {
		Integer[][] result = new Integer[2][];
		String field = "content";
		Integer[] types = {1,5};
		try{
			Query query = IKQueryParser.parse(field, keyword);
			if (query == null)
				throw new Exception("创建查询失败！");
			else{
				for(int i=0;i<2;i++){
					TopDocs topdocs = searchers[i].search(query, top);
					ScoreDoc[] hits = topdocs.scoreDocs;
					result[i] = getIds(searchers[i],hits,types[i]);
				}
			}
			System.out.println("总共搜索到" + (result[0].length+result[1].length) + "个与【" + keyword+ "】相关的帖子和用户。");
		}catch(Exception e){
			System.out.println("全部搜索失败!"+e.getMessage());
		}
		return result;
	}
	
	/**
	 * 帖子搜索
	 * @param keyword
	 * @param type 1-广播，2-秀场，3-体验，4-指南
	 * @param top
	 * @return
	 */
	private Integer[] searchPost(String keyword, Integer type, int top){
		Integer[] result = null;
		String[] fields = {"posttype","content"};
		String[] keywords = {type.toString(), keyword};
		BooleanClause.Occur[] flags = { Occur.MUST, Occur.MUST };
		try{
			Query query = IKQueryParser.parseMultiField(fields, keywords, flags);
			TopDocs topdocs = searchers[0].search(query, top);
			ScoreDoc[] hits = topdocs.scoreDocs;
			result = getIds(searchers[0], hits, 1);
			System.out.println("总共搜索到" + hits.length + "个与【" + keyword+ "】相关的帖子。");
		}catch(Exception e){
			System.out.println("帖子/发言搜索失败!"+e.getMessage());
		}
		return result;
	}
	
	/**
	 * 用户搜索
	 * @param keyword
	 * @param top
	 * @return
	 */
	private Integer[] searchUser(String keyword, int top){
		Integer[] result = null;
		String field = "content";
		try{
			Query query = IKQueryParser.parse(field, keyword);
//			QueryParser parser = new QueryParser(Version.LUCENE_30, field, getAnalyzer());
//			Query query = parser.parse(keyword);
//			TermQuery query =  new TermQuery(new Term(field, keyword));
//			PrefixQuery query = new PrefixQuery(new Term(field, keyword));
			TopDocs topdocs = searchers[1].search(query, top);
			ScoreDoc[] hits = topdocs.scoreDocs;
			result = getIds(searchers[1], hits, 5);
			System.out.println("总共搜索到" + hits.length + "个与【" + keyword+ "】相关的用户。");
		}catch(Exception e){
			System.out.println("用户搜索失败!"+e.getMessage());
		}
		return result;
	}
	
	/**
	 * 圈子搜索
	 * @param keyword
	 * @param top
	 * @return
	 */
	private Integer[] searchGroup(String keyword, int top){
		Integer[] result = null;
		String field = "content";
		try{
			Query query = IKQueryParser.parse(field, keyword);
			TopDocs topdocs = searchers[2].search(query, top);
			ScoreDoc[] hits = topdocs.scoreDocs;
			result = getIds(searchers[2], hits, 6);
			System.out.println("总共搜索到" + hits.length + "个与【" + keyword+ "】相关的圈子。");
		}catch(Exception e){
			System.out.println("圈子搜索失败!"+e.getMessage());
		}
		return result;
	}
	
	/**
	 * 话题搜索
	 * @param keyword
	 * @param top
	 * @return
	 */
	private Integer[] searchTopic(String keyword, int top){
		Integer[] result = null;
		String field = "content";
		try{
			Query query = IKQueryParser.parse(field, keyword);
			TopDocs topdocs = searchers[3].search(query, top);
			ScoreDoc[] hits = topdocs.scoreDocs;
			result = getIds(searchers[3], hits, 7);
			System.out.println("总共搜索到" + hits.length + "个与【" + keyword+ "】相关的话题。");
		}catch(Exception e){
			System.out.println("话题搜索失败!"+e.getMessage());
		}
		return result;
	}
	
	/**
	 * 获取符合条件记录的ID
	 * @param searcher
	 * @param docs
	 * @param type 搜索类型：
	 * @return
	 */
	private Integer[] getIds(IndexSearcher searcher, ScoreDoc[] docs, Integer type){
		Integer[] result = new Integer[docs.length];
		try{
			int i = 0;
			for(ScoreDoc doc : docs){
				Document document = searcher.doc(doc.doc);
				Integer id = null;
				if(type < 5){
					id = Integer.parseInt(document.get("postid"));
				}else if(type.equals(5)){
					id = Integer.parseInt(document.get("uid")); 
				}else if(type.equals(6)){
					id = Integer.parseInt(document.get("groupid"));
				}else if(type.equals(7)){
					id = Integer.parseInt(document.get("topicid"));
				}
				if(id != null){
					result[i++] = id;
				}
			}
		}catch(Exception e){
			System.out.println("获取搜索文档ID失败!"+e.getMessage());
		}
		return result;
	}
	
	/* 切分关键词 */
	public String splitWord(String keyword) throws Exception {
		if(keyword == null || keyword.equals("")){
			return null;
		}
		String result = "";
		IKSegmentation ikSeg = new IKSegmentation(new StringReader(keyword),
				false);
		Lexeme l = null;
		System.err.println("------------BEGIN测试切词结果---------------");
		while ((l = ikSeg.next()) != null) {
			if (l.getLexemeType() == 0 || l.getLexemeType() == 20) {
				System.out.println(l.getLexemeText());
				result += l.getLexemeText() + " ";
			}
		}
		System.err.println("------------END测试切词结果---------------");
		return result.trim();
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public IndexSearcher[] getSearchers() {
		return searchers;
	}

	public void setSearchers(IndexSearcher[] searchers) {
		this.searchers = searchers;
	}

	public MultiSearcher getMultisearch() {
		return multisearch;
	}

	public void setMultisearch(MultiSearcher multisearch) {
		this.multisearch = multisearch;
	}
}
