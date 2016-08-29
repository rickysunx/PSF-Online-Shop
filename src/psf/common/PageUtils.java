package psf.common;

/**
 * @author 肖慧
 *
 */
public class PageUtils {

	/**
	 * 获取分页样式数据
	 * @param page 当前页面数
	 * @param pageCount	总页面数
	 * @return
	 * @throws Exception
	 */
	public static int[] getPages(int page, int pageCount) throws Exception {
		if (page < 1)
			page = 1;
		else if (page > pageCount)
			page = pageCount;

		if (pageCount > 0 && pageCount <= 5) { // 总页面数小于6，则不需省略显示
			int[] result = new int[pageCount];
			generate(result, 0, pageCount);
			return result;
		} else if (page <= 4) {
			int[] result = new int[(page+4 > pageCount) ? pageCount : (page+4)];	//page后2页+省略页+最后一页
			generate(result, 0, page+2);
			result[result.length-1] = pageCount;
			return result;
		} else if (page > 3 && page < (pageCount - 3)) {
			int[] result = new int[9];
			result[0] = 1;
			result[8] = pageCount;
			int gap = page - 4;
			for (int i = 2; i <= 6; i++) {
				result[i] = i + gap;
			}
			return result;
		} else if (page >= (pageCount - 3)) {
			int[] result = new int[pageCount-page+1+4];
			result[0] = 1;
			for (int i = 2; i < result.length; i++) {
				result[i] = i + pageCount - (result.length-1); //gap = result.length-1
			}
			return result;
		} else {
			return null;
		}
	}

	private static int[] generate(int[] result, int start, int end) {
		for (int i = start; i < end; i++) {
			result[i] = i + 1;
		}
		return result;
	}

	
	/*	测试
	public static void main(String[] agrs) throws Exception { 
		int[] result = getPages(5, 7); 
		for (int i : result) { 
			System.out.print(i + " ");
		}
	}*/
	 
}
