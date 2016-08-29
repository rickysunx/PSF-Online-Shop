package psf.service.common;

import java.io.File;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.IKSegmentation;
import org.wltea.analyzer.Lexeme;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKQueryParser;
import org.wltea.analyzer.lucene.IKSimilarity;

import psf.Psf;
import psf.PsfService;
import psf.vo.common.SearchResultVO;

/**
 * 全文检索
 * 
 * @author 肖慧
 * 
 */
public class FullTextService extends PsfService {

	/* 获取中文分词器 */
	private synchronized Analyzer getAnalyzer() {
		return new IKAnalyzer();
	}

	public List<SearchResultVO> search(String keyword, Integer type) throws Exception {
		return search(keyword, type, 1000);
	}

	/**
	 * 根据关键字在指定的对象类别中查找前top条信息
	 * 
	 * @param keyword
	 * @param type
	 *            检索类型：0-全部，1-广播，2-秀场，3-体验，4-指南，5-圈子，6-活动，详细见Psf.java
	 * @param top
	 * @return
	 */
	public List<SearchResultVO> search(String keyword, Integer type, int top) throws Exception {
		String indexDir = Psf.Index_Dir;
		IndexSearcher searcher = new IndexSearcher(FSDirectory.open(new File(
				indexDir)));
		SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter(
				"<b><font color='red'>", "</font></b>");
		List<SearchResultVO> result = new ArrayList<SearchResultVO>();
		try {
			keyword = splitWord(keyword);
			// 准备开始搜索……
			Query query = null;
			if (type.equals(0)) { // 如果type=0，则表示搜索全部，创建单字段查询对象
				String field = "tc";
				query = IKQueryParser.parse(field, keyword);
			} else if (type.equals(1) || type.equals(2) || type.equals(3)
					|| type.equals(4) || type.equals(5) || type.equals(6)) {
				String[] fields = { "otype", "tc" }; // 检索字段
				String[] keywords = { type.toString(), keyword }; // 检索关键词
				BooleanClause.Occur[] flags = { Occur.MUST, Occur.MUST };
				query = IKQueryParser.parseMultiField(fields, keywords, flags);
			}
			searcher.setSimilarity(new IKSimilarity());
			if (query == null)
				throw new Exception("创建查询失败！");
			else {
				Query queryLight = IKQueryParser.parse("tc", keyword);
				Highlighter highlighter = new Highlighter(simpleHTMLFormatter,
						new QueryScorer(queryLight)); // 定义高亮对象
				highlighter.setTextFragmenter(new SimpleFragmenter(
						Integer.MAX_VALUE));
				Analyzer analyzer = getAnalyzer();

				TopDocs topdocs = searcher.search(query, top);
				ScoreDoc[] hits = topdocs.scoreDocs;
				System.out.println("总共搜索到" + hits.length + "个与【" + keyword
						+ "】相关的结果。");
				for (ScoreDoc doc : hits) {
					SearchResultVO rs = new SearchResultVO();
					Document document = searcher.doc(doc.doc);

					Integer oid = Integer.parseInt(document.get("oid").trim());
					rs.setOid(oid);
					Integer otype = Integer.parseInt(document.get("otype")
							.trim());
					rs.setOtype(otype);
					Integer uid = Integer.parseInt(document.get("uid").trim());
					rs.setUid(uid);

					String title = document.get("title").trim();
					title = highlight(highlighter, analyzer, "title", title); // 加高亮
					rs.setTitle(title);

					String content = document.get("content").trim();
					content = highlight(highlighter, analyzer, "content",
							content); // 加高亮
					rs.setContent(content);

					Integer addtime = Integer.parseInt(document.get("addtime")
							.trim());
					rs.setAddtime(addtime);

					result.add(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry,检索失败！");
		}
		Collections.sort(result, new Comparator<SearchResultVO>() {

			public int compare(SearchResultVO o1, SearchResultVO o2) {
				return o2.getAddtime().compareTo(o1.getAddtime());
			}

		});
		return result;
	}

	/* 加高亮函数 */
	protected String highlight(Highlighter highlighter, Analyzer analyzer,String field, String value) {
		try {
			TokenStream ts = analyzer.tokenStream(field,
					new StringReader(value));
			String str = highlighter.getBestFragment(ts, value);
			if (str == null) {
				str = value;
			}
			return str;
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("加高亮失败！");
			return null;
		}
	}

	/* 切分关键词 */
	protected String splitWord(String keyword) throws Exception {
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
		return result;
	}
}
