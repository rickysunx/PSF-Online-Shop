package psf.common.lucene;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import psf.Psf;
import psf.common.UbbUtils;

/**
 * 建立索引类，对数据库中指定的表建立索引。 0-全部，1-广播，2-秀场，3-体验，4-指南，5-圈子，6-活动，详细见Psf.java
 * 
 * @author 肖慧
 * 
 */
public class Indexer {
	public static String[] tables = { // 需要建立索引的表名
	"post", "event", "groups" };

	public String indexDir = Psf.Index_Dir; // 索引目录
	public Connection conn = null; // 数据库连接对象

	public Indexer() {
		try {
			DataSource ds = null; //(DataSource) BeanFactory.getBean("dataSource");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("数据源获取失败！");
			e.printStackTrace();
		}
		// conn = DBManager.getConnection();
	}

	public void createIndex() {
		try {
			Directory dir = FSDirectory.open(new File(indexDir));
			Analyzer analyzer = new IKAnalyzer(); // 默认为最细粒度分词
			IndexWriter writer = new IndexWriter(dir, analyzer, true,
					MaxFieldLength.LIMITED);
			writer.setUseCompoundFile(false);

			long stime = System.currentTimeMillis();
			for (String tablename : tables) {
				Statement stmt = conn.createStatement();
				String sql = "select * from " + tablename + " where delflag=0";
				ResultSet rs = stmt.executeQuery(sql);
				addIndex(writer, tablename, rs);
			}

			writer.optimize();
			writer.close();

			long time = (System.currentTimeMillis() - stime) / 1000;
			System.out.println("建立索引结束。耗时：" + time + "秒");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("索引建立失败！");
		}
	}

	public void addIndex(IndexWriter writer, String tablename, ResultSet rs) {
		try {
			while (rs.next()) {

				Document document = new Document();
				// 设置Document对象的字段，设置检索字段title和content的内容，开发者可以根据检索需求，扩充检索内容，即扩充content的值。
				String oid = null;
				String otype = null;
				String uid = null;
				String title = null;
				StringBuffer content = new StringBuffer();
				String addtime = null;
				if (tablename.equals("post")) {
					oid = String.valueOf(rs.getInt("postid"));
					otype = String.valueOf(rs.getInt("posttype"));
					title = rs.getString("title");
					content.append(rs.getString("content"));
				} else if (tablename.equals("groups")) {
					oid = String.valueOf(rs.getInt("groupid"));
					otype = "5";
					title = rs.getString("groupname");
					content.append(rs.getString("intro"));
				} else if (tablename.equals("event")) {
					oid = String.valueOf(rs.getInt("eventid"));
					otype = "6";
					title = rs.getString("title");
					content.append(rs.getString("intro")); // 活动内容是否需要更详细：如活动时间，活动地点等等。
				}
				uid = rs.getString("uid");
				addtime = String.valueOf(rs.getInt("addtime"));

				// 在内容字段中添加图片信息
				content = content.replace(0, content.length(),
						UbbUtils.ubb2Html(content.toString()));// 解码
				if (oid != null && otype != null) {
					// Connection conn = DBManager.getConnection();
					Statement stmt = conn.createStatement();
					String sql = "select * from pic where dr=0 and otype="
							+ otype + " and oid=" + oid;
					ResultSet pic_rs = stmt.executeQuery(sql);
					while (pic_rs.next()) {
						Integer picid = pic_rs.getInt("picid");
						String filetype = pic_rs.getString("filetype");
						content.append("<img height=60 border=0 src='http://upload.psf100.com/pic/"
								+ picid + "." + filetype + "'/>"); // 格式可以调整，最好前端设置
					}
				}

				Field fieldOid = new Field("oid", oid, Field.Store.YES,
						Field.Index.NO);
				document.add(fieldOid);
				Field fieldOtype = new Field("otype", otype, Field.Store.YES,
						Field.Index.ANALYZED); // 设置为检索字段,按类型检索
				document.add(fieldOtype);
				Field fieldUid = new Field("uid", uid, Field.Store.YES,
						Field.Index.NO);
				document.add(fieldUid);
				String t = title.trim();
				Field fieldTitle = new Field("title", t, Field.Store.YES,
						Field.Index.NO);
				document.add(fieldTitle);
				String c = content.toString().trim();
				Field fieldContent = new Field("content", c, Field.Store.YES,
						Field.Index.NO);
				document.add(fieldContent);
				Field fieldAddtime = new Field("addtime", addtime,
						Field.Store.YES, Field.Index.NO);
				document.add(fieldAddtime);
				String tc = title + content;
				Field fieldTC = new Field("tc", tc, Field.Store.YES,
						Field.Index.ANALYZED); // 将内容和标题整合，设置为检索字段
				document.add(fieldTC);
				writer.addDocument(document);

				System.out.println(tablename + "" + oid + "的索引添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("表" + tablename + "添加索引失败！");
		}
	}
}
