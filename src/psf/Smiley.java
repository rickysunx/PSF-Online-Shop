package psf;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Smiley {
	protected String name = null;
	protected String image = null;
	protected static List<Smiley> smileyList = null;
	protected static Map<String,String> smileyMap = null;
	
	public Smiley(String name,String image) {
		this.name = name;
		this.image = image;
	}
	
	public static String replaceSmiley(String text) {
		List<Smiley> smileyList = getSmileyList();
		String result = text;
		for (Smiley s:smileyList) {
			result = result.replaceAll("\\["+s.getName()+"\\]", "<img src='"+s.getImage()+"' border=0/>");
		}
		return result;
	}
	
	public static Map<String,String> getSmileyMap() {
		if(smileyMap==null) {
			smileyMap = new HashMap<String, String>();
			List<Smiley> smileylList = getSmileyList();
			for (Smiley s:smileylList) {
				smileyMap.put(s.getName(), s.getImage());
			}
		}
		return smileyMap;
	}
	
	public static List<Smiley> getSmileyList() {
		if(smileyList==null) {
			smileyList = new ArrayList<Smiley>();
			smileyList.add(new Smiley("吃惊", "/images/smiley/chijing.png"));
			smileyList.add(new Smiley("屌", "/images/smiley/diao.png"));
			smileyList.add(new Smiley("尴尬", "/images/smiley/ganga.png"));
			smileyList.add(new Smiley("汗", "/images/smiley/han.png"));
			smileyList.add(new Smiley("怀疑", "/images/smiley/huaiyi.png"));
			smileyList.add(new Smiley("休息喝咖啡", "/images/smiley/kafei.png"));
			smileyList.add(new Smiley("可爱", "/images/smiley/keai.png"));
			smileyList.add(new Smiley("哭", "/images/smiley/ku.png"));
			smileyList.add(new Smiley("骂", "/images/smiley/ma.png"));
			smileyList.add(new Smiley("俏皮", "/images/smiley/qiaopi.png"));
			smileyList.add(new Smiley("傻笑", "/images/smiley/shaxiao.png"));
			smileyList.add(new Smiley("生气", "/images/smiley/shengqi.png"));
			smileyList.add(new Smiley("调皮", "/images/smiley/tiaopi.png"));
			smileyList.add(new Smiley("听歌", "/images/smiley/tingge.png"));
			smileyList.add(new Smiley("委屈", "/images/smiley/weiqu.png"));
			smileyList.add(new Smiley("嘘", "/images/smiley/xu.png"));
			smileyList.add(new Smiley("郁闷", "/images/smiley/yumen.png"));
			smileyList.add(new Smiley("眨眼", "/images/smiley/zhayan.png"));
			smileyList.add(new Smiley("吃惊", "/images/smiley/zhuanjia.png"));
			smileyList.add(new Smiley("草泥马", "/images/smiley/caonima.png"));
			smileyList.add(new Smiley("沙发", "/images/smiley/shafa.png"));
			smileyList.add(new Smiley("蛋糕", "/images/smiley/dangao.png"));
			smileyList.add(new Smiley("礼物", "/images/smiley/liwu.png"));
			smileyList.add(new Smiley("鸭梨", "/images/smiley/yali.png"));
			smileyList.add(new Smiley("猪头", "/images/smiley/zhutou.png"));
			smileyList.add(new Smiley("拜拜\\*","/images/smiley_gif/88.gif"));
			smileyList.add(new Smiley("鄙视\\*","/images/smiley_gif/bishi.gif"));
			smileyList.add(new Smiley("圙\\*","/images/smiley_gif/lue.gif"));
			smileyList.add(new Smiley("不理你\\*","/images/smiley_gif/bulini.gif"));
			smileyList.add(new Smiley("不要\\*","/images/smiley_gif/buyao.gif"));
			smileyList.add(new Smiley("草泥马\\*","/images/smiley_gif/caonima.gif"));
			smileyList.add(new Smiley("诧异\\*","/images/smiley_gif/chayi.gif"));
			smileyList.add(new Smiley("扯淡\\*","/images/smiley_gif/chedan.gif"));
			smileyList.add(new Smiley("崇拜\\*","/images/smiley_gif/chongbai.gif"));
			smileyList.add(new Smiley("酷\\*","/images/smiley_gif/cool.gif"));
			smileyList.add(new Smiley("呆呆\\*","/images/smiley_gif/daidai.gif"));
			smileyList.add(new Smiley("打酱油\\*","/images/smiley_gif/dajiangyou.gif"));
			smileyList.add(new Smiley("顶\\*","/images/smiley_gif/ding.gif"));
			smileyList.add(new Smiley("二心\\*","/images/smiley_gif/erxin.gif"));
			smileyList.add(new Smiley("飞吻\\*","/images/smiley_gif/feiwen.gif"));
			smileyList.add(new Smiley("愤怒\\*","/images/smiley_gif/fennu.gif"));
			smileyList.add(new Smiley("敷衍一笑\\*","/images/smiley_gif/fuyanyixiao.gif"));
			smileyList.add(new Smiley("浮云\\*","/images/smiley_gif/fuyun.gif"));
			smileyList.add(new Smiley("功夫\\*","/images/smiley_gif/gongfu.gif"));
			smileyList.add(new Smiley("鼓掌\\*","/images/smiley_gif/guzhang.gif"));
			smileyList.add(new Smiley("哈哈\\*","/images/smiley_gif/haha.gif"));
			smileyList.add(new Smiley("害羞\\*","/images/smiley_gif/haixiu.gif"));
			smileyList.add(new Smiley("汗\\*","/images/smiley_gif/han.gif"));
			smileyList.add(new Smiley("好心\\*","/images/smiley_gif/haoxin.gif"));
			smileyList.add(new Smiley("HOLD住\\*","/images/smiley_gif/hold.gif"));
			smileyList.add(new Smiley("惊讶\\*","/images/smiley_gif/jingya.gif"));
			smileyList.add(new Smiley("囧\\*","/images/smiley_gif/jiong.gif"));
			smileyList.add(new Smiley("开火\\*","/images/smiley_gif/kaihuo.gif"));
			smileyList.add(new Smiley("可怜\\*","/images/smiley_gif/kelian.gif"));
			smileyList.add(new Smiley("口水\\*","/images/smiley_gif/koushui.gif"));
			smileyList.add(new Smiley("哭\\*","/images/smiley_gif/ku.gif"));
			smileyList.add(new Smiley("圐\\*","/images/smiley_gif/lu.gif"));
			smileyList.add(new Smiley("牛\\*","/images/smiley_gif/niu.gif"));
			smileyList.add(new Smiley("不，不\\*","/images/smiley_gif/NONO.gif"));
			smileyList.add(new Smiley("披头散发\\*","/images/smiley_gif/pitousanfa.gif"));
			smileyList.add(new Smiley("强力\\*","/images/smiley_gif/qiangli.gif"));
			smileyList.add(new Smiley("潜水\\*","/images/smiley_gif/qianshui.gif"));
			smileyList.add(new Smiley("亲亲\\*","/images/smiley_gif/qinqin.gif"));
			smileyList.add(new Smiley("伤不起\\*","/images/smiley_gif/shangbuqi.gif"));
			smileyList.add(new Smiley("生病\\*","/images/smiley_gif/shengbing.gif"));
			smileyList.add(new Smiley("石头\\*","/images/smiley_gif/shitou.gif"));
			smileyList.add(new Smiley("水货\\*","/images/smiley_gif/shuihuo.gif"));
			smileyList.add(new Smiley("水人\\*","/images/smiley_gif/shuiren.gif"));
			smileyList.add(new Smiley("睡着了\\*","/images/smiley_gif/shuizhao.gif"));
			smileyList.add(new Smiley("叹气\\*","/images/smiley_gif/tanqi.gif"));
			smileyList.add(new Smiley("偷笑\\*","/images/smiley_gif/touxiao.gif"));
			smileyList.add(new Smiley("吐了\\*","/images/smiley_gif/tule.gif"));
			smileyList.add(new Smiley("挖鼻屎\\*","/images/smiley_gif/wabishi.gif"));
			smileyList.add(new Smiley("王八\\*","/images/smiley_gif/wangba.gif"));
			smileyList.add(new Smiley("委屈\\*","/images/smiley_gif/weiqu.gif"));
			smileyList.add(new Smiley("秀色可餐\\*","/images/smiley_gif/xiusekecan.gif"));
			smileyList.add(new Smiley("嘻嘻\\*","/images/smiley_gif/xixi.gif"));
			smileyList.add(new Smiley("嘘！\\*","/images/smiley_gif/xu.gif"));
			smileyList.add(new Smiley("鸭梨大\\*","/images/smiley_gif/yalida.gif"));
			smileyList.add(new Smiley("人工石\\*","/images/smiley_gif/yu.gif"));
			smileyList.add(new Smiley("晕\\*","/images/smiley_gif/yun.gif"));
			smileyList.add(new Smiley("抓狂\\*","/images/smiley_gif/zhuakuang.gif"));
			smileyList.add(new Smiley("子\\*","/images/smiley_gif/zi.gif"));
		}
		return smileyList;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
