package psf.service.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.entity.TBadword;

public class BadWordService extends PsfService {
	
	private static List<Map<String, Integer>> badWordMap = null;
	
	private void initBadwords() throws Exception{
		List<Map<String, Integer>> kwsNew = new ArrayList(9);
		for(int ii = 2; ii <= 10; ii ++){
			kwsNew.add(new HashMap());
		}
		
		try {
			List<TBadword> bwList = sqlmap.queryForList("badword.queryTBadwordsAll");
			for(TBadword badword : bwList){
				addInitBadwords(badword, kwsNew);
			}
			badWordMap = kwsNew;
			System.out.println("【badword】数据加载成功！");
		} catch (Exception e) {
			System.out.println("***【badword】数据加载失败***");
			throw e;
		}
	}

	private static void addInitBadwords(TBadword badword, List<Map<String, Integer>> map){
		int length = badword.getBadword().length();
		if(length > 10 || length < 2){
			//长度超过限制
		} else {
			map.get(length - 2).put(badword.getBadword(), badword.getWeight());
		}
	}
	
	public int getBadWordWeight(String text) throws Exception {
		
		if(badWordMap == null){
			initBadwords();
		}

		// String keyword = "";
		int weight = 0;

		text = text.replaceAll("[\\pP|~|$|^|<|>|\\||\\+|=]*", "");	//只允许中文、字母和数字
		
		char[] cs = text.toCharArray();
		
		//遍历起点
		for(int ii = 0; ii < cs.length - 1; ii++){
			//遍历长度：从2开始，但要注意结尾的长度。
			StringBuffer sb = new StringBuffer();
			sb.append(cs[ii]);
			for(int ll = 0; ll < 9 && ii + 1 + ll < cs.length; ll++){
				sb.append(cs[ii + 1 + ll]);
				Map<String, Integer> map = badWordMap.get(ll);
				Integer value = map.get(sb.toString());
				if(value != null && value > weight ){
					weight = value;
					// keyword = sb.toString();
					// System.out.println("***\t" + sb.toString());
				}
			}
		}
		return weight;
	}
}
