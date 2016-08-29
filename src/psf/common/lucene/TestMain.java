package psf.common.lucene;

import psf.service.common.FullSearchService;

/**
 * 全文检索测试类
 * 
 * @author 肖慧
 * 
 */
public class TestMain {
	public static void main(String[] args) throws Exception {
		/* 创建索引 */
//		 MultiIndexer myindex = new MultiIndexer();
//		 myindex.createIndex();

		/* 开始查询 */
		searchTest();

	}

	public static void searchTest() throws Exception {
		String keyword = "whf";
		/*
		FullTextService search = new FullTextService();
		List<SearchResultVO> result = search.search(keyword, 0);
		System.out.println("OID OTYPE UID ADDTIME TITLE CONTENT");
		for (SearchResultVO r : result) {
			System.out.println(r);
		}*/
		FullSearchService searchService = new FullSearchService(5);
		Integer[][] result = searchService.search(keyword);
		
		System.out.println("-----------------SEARCH END!----------------");
	}
}
