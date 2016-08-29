<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
(function($){
	$.fn.extend({
		psfSmiley:function(option){
		$.each(this,function(i,n){
			var thisobj=n;
			$("#dialog_psfsmiley").hide();
			$(n).click(function(){
				$("#dialog_psfsmiley").psfDialogClose().find(".tab03 .layerClose .close").unbind("click");
				option["init"].call(n) || function(){};
				$("#dialog_psfsmiley .smiley_items li a").unbind("click").click(function(){
					option["target"].call($("#dialog_psfsmiley")[0],"["+this.title+"]",thisobj);//目标处理函数参数是返回
				});
				$("#dialog_psfsmiley .normal_smiley_items li a").unbind("click").click(function(){
					option["target"].call($("#dialog_psfsmiley")[0],"["+this.title+"]",thisobj);//目标处理函数参数是返回
				});
				$("#dialog_psfsmiley").psfDialog({
					top:$(n).getElCoordinate().top+n.offsetHeight,
					left:$(n).getElCoordinate().left,
					width:463,
					openAnimate:300,
					arrow:true,
					arrowauto:true,
					arrowdirection:"top",
					arrowstyle:"1",
					arrowpos:20
				});
				$("#dialog_psfsmiley .tab03 .layerClose .close").click(function(){
					$("#dialog_psfsmiley").psfDialogClose();
					$(this).unbind("click");
				});
			});
		})
			
		}
	});
})(jQuery);
$(document).ready(function(){
	$("#dialog_psfsmiley .tab03 li").psfTab($("#dialog_psfsmiley .smiley_items,#dialog_psfsmiley .normal_smiley_items"));
});
</script>
<div id="dialog_psfsmiley" class="dialog_smiley dialogtitle" style="display:none">
	<dl class="tab03">
		<dd>
			<ul>
				<li class="current"><a href="javascript:void(0)">常用表情</a></li>
				<li class=""><a href="javascript:void(0)">品上表情</a></li>
			</ul>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<ul class="smiley_items s_clear" style="" id="face">
		<li>
			<a title="浮云*" href="javascript:void(0)"><img src="/images/smiley_jpg/fuyun.jpg" /></a>
		</li>
		<li>
			<a title="水货*" href="javascript:void(0)"><img src="/images/smiley_jpg/shuihuo.jpg" /></a>
		</li>
		<li>
			<a title="草泥马*" href="javascript:void(0)"><img src="/images/smiley_jpg/caonima.jpg" /></a>
		</li>
		<li>
			<a title="扯淡*" href="javascript:void(0)"><img src="/images/smiley_jpg/chedan.jpg" /></a>
		</li>
		<li>
			<a title="伤不起*" href="javascript:void(0)"><img src="/images/smiley_jpg/shangbuqi.jpg" /></a>
		</li>
		<li>
			<a title="拜拜*" href="javascript:void(0)"><img src="/images/smiley_jpg/88.jpg" /></a>
		</li>
		<li>
			<a title="鄙视*" href="javascript:void(0)"><img src="/images/smiley_jpg/bishi.jpg"/></a>
		</li>
		<li>
			<a title="不理你*" href="javascript:void(0)"><img src="/images/smiley_jpg/bulini.jpg" /></a>
		</li>
		<li>
			<a title="诧异*" href="javascript:void(0)"><img src="/images/smiley_jpg/chayi.jpg" /></a>
		</li>
		<li>
			<a title="崇拜*" href="javascript:void(0)"><img src="/images/smiley_jpg/chongbai.jpg" /></a>
		</li>
		<li>
			<a title="酷*" href="javascript:void(0)"><img src="/images/smiley_jpg/cool.jpg" /></a>
		</li>
		<li>
			<a title="打酱油*" href="javascript:void(0)"><img src="/images/smiley_jpg/dajiangyou.jpg" /></a>
		</li>
		<li>
			<a title="顶*" href="javascript:void(0)"><img src="/images/smiley_jpg/ding.jpg" /></a>
		</li>
		<li>
			<a title="飞吻*" href="javascript:void(0)"><img src="/images/smiley_jpg/feiwen.jpg" /></a>
		</li>
		<li>
			<a title="愤怒*" href="javascript:void(0)"><img src="/images/smiley_jpg/fennu.jpg" /></a>
		</li>
		<li>
			<a title="敷衍一笑*" href="javascript:void(0)"><img src="/images/smiley_jpg/fuyanyixiao.jpg" /></a>
		</li>
		<li>
			<a title="鼓掌*" href="javascript:void(0)"><img src="/images/smiley_jpg/guzhang.jpg" /></a>
		</li>
		<li>
			<a title="哈哈*" href="javascript:void(0)"><img src="/images/smiley_jpg/haha.jpg" /></a>
		</li>
		<li>
			<a title="害羞*" href="javascript:void(0)"><img src="/images/smiley_jpg/haixiu.jpg" /></a>
		</li>
		<li>
			<a title="汗*" href="javascript:void(0)"><img src="/images/smiley_jpg/han.jpg" /></a>
		</li>
		<li>
			<a title="惊讶*" href="javascript:void(0)"><img src="/images/smiley_jpg/jingya.jpg" /></a>
		</li>
		<li>
			<a title="可怜*" href="javascript:void(0)"><img src="/images/smiley_jpg/kelian.jpg" /></a>
		</li>
		<li>
			<a title="口水*" href="javascript:void(0)"><img src="/images/smiley_jpg/koushui.jpg" /></a>
		</li>
		<li>
			<a title="哭*" href="javascript:void(0)"><img src="/images/smiley_jpg/ku.jpg" /></a>
		</li>
		<li>
			<a title="牛*" href="javascript:void(0)"><img src="/images/smiley_jpg/niu.jpg" /></a>
		</li>
		<li>
			<a title="不，不*" href="javascript:void(0)"><img src="/images/smiley_jpg/NONO.jpg" /></a>
		</li>
		<li>
			<a title="披头散发*" href="javascript:void(0)"><img src="/images/smiley_jpg/pitousanfa.jpg" /></a>
		</li>
		<li>
			<a title="潜水*" href="javascript:void(0)"><img src="/images/smiley_jpg/qianshui.jpg" /></a>
		</li>
		<li>
			<a title="亲亲*" href="javascript:void(0)"><img src="/images/smiley_jpg/qinqin.jpg" /></a>
		</li>
		<li>
			<a title="生病*" href="javascript:void(0)"><img src="/images/smiley_jpg/shengbing.jpg" /></a>
		</li>
		<li>
			<a title="睡着了*" href="javascript:void(0)"><img src="/images/smiley_jpg/shuizhao.jpg" /></a>
		</li>
		<li>
			<a title="叹气*" href="javascript:void(0)"><img src="/images/smiley_jpg/tanqi.jpg" /></a>
		</li>
		<li>
			<a title="偷笑*" href="javascript:void(0)"><img src="/images/smiley_jpg/touxiao.jpg" /></a>
		</li>
		<li>
			<a title="吐了*" href="javascript:void(0)"><img src="/images/smiley_jpg/tule.jpg" /></a>
		</li>
		<li>
			<a title="挖鼻屎*" href="javascript:void(0)"><img src="/images/smiley_jpg/wabishi.jpg" /></a>
		</li>
		<li>
			<a title="委屈*" href="javascript:void(0)"><img src="/images/smiley_jpg/weiqu.jpg" /></a>
		</li>
		<li>
			<a title="秀色可餐*" href="javascript:void(0)"><img src="/images/smiley_jpg/xiusekecan.jpg" /></a>
		</li>
		<li>
			<a title="嘻嘻*" href="javascript:void(0)"><img src="/images/smiley_jpg/xixi.jpg" /></a>
		</li>
		<li>
			<a title="嘘！*" href="javascript:void(0)"><img src="/images/smiley_jpg/xu.jpg" /></a>
		</li>
		<li>
			<a title="鸭梨大*" href="javascript:void(0)"><img src="/images/smiley_jpg/yalida.jpg" /></a>
		</li>
		<li>
			<a title="晕*" href="javascript:void(0)"><img src="/images/smiley_jpg/yun.jpg" /></a>
		</li>
		<li>
			<a title="抓狂*" href="javascript:void(0)"><img src="/images/smiley_jpg/zhuakuang.jpg" /></a>
		</li>
		<li>
			<a title="子*" href="javascript:void(0)"><img src="/images/smiley_jpg/zi.jpg" /></a>
		</li>
		<li>
			<a title="已阅*" href="javascript:void(0)"><img src="/images/smiley_jpg/yiyue.jpg" /></a>
		</li>
		<li>
			<a title="嘂*" href="javascript:void(0)"><img src="/images/smiley_jpg/jiao.jpg" /></a>
		</li>
		<li>
			<a title="不要*" href="javascript:void(0)"><img src="/images/smiley_jpg/buyao.jpg" /></a>
		</li>
		<li>
			<a title="圙*" href="javascript:void(0)"><img src="/images/smiley_jpg/lue.jpg" /></a>
		</li>
		<li>
			<a title="功夫*" href="javascript:void(0)"><img src="/images/smiley_jpg/gongfu.jpg" /></a>
		</li>
		<li>
			<a title="二心*" href="javascript:void(0)"><img src="/images/smiley_jpg/erxin.jpg" /></a>
		</li>
		<li>
			<a title="呆呆*" href="javascript:void(0)"><img src="/images/smiley_jpg/daidai.jpg" /></a>
		</li>
		<li>
			<a title="囧*" href="javascript:void(0)"><img src="/images/smiley_jpg/jiong.jpg" /></a>
		</li>
		<li>
			<a title="好心*" href="javascript:void(0)"><img src="/images/smiley_jpg/haoxin.jpg" /></a>
		</li>
		<li>
			<a title="HOLD住*" href="javascript:void(0)"><img src="/images/smiley_jpg/hold.jpg" /></a>
		</li>
		<li>
			<a title="开火*" href="javascript:void(0)"><img src="/images/smiley_jpg/kaihuo.jpg" /></a>
		</li>
		<li>
			<a title="圐*" href="javascript:void(0)"><img src="/images/smiley_jpg/lu.jpg" /></a>
		</li>
		<li>
			<a title="强力*" href="javascript:void(0)"><img src="/images/smiley_jpg/qiangli.jpg" /></a>
		</li>
		<li>
			<a title="石头*" href="javascript:void(0)"><img src="/images/smiley_jpg/shitou.jpg" /></a>
		</li>
		<li>
			<a title="水人*" href="javascript:void(0)"><img src="/images/smiley_jpg/shuiren.jpg" /></a>
		</li>
		<li>
			<a title="王八*" href="javascript:void(0)"><img src="/images/smiley_jpg/wangba.jpg" /></a>
		</li>
		<li>
			<a title="人工石*" href="javascript:void(0)"><img src="/images/smiley_jpg/yu.jpg" /></a>
		</li>
		<%for(int x=0;x<3;x++){ %>
		<li><a class="s_clear"></a></li>
		<%} %> 
	</ul>
	<ul class="smiley_items s_clear" style="display:none">
		<li>
			<a title="吃惊" href="javascript:void(0)"><img src="/images/smiley/chijing.png" /></a>
		</li>
		<li>
			<a title="屌" href="javascript:void(0)"><img src="/images/smiley/diao.png" /></a>
		</li>
		<li>
			<a title="尴尬" href="javascript:void(0)"><img src="/images/smiley/ganga.png" /></a>
		</li>
		<li>
			<a title="汗" href="javascript:void(0)"><img src="/images/smiley/han.png" /></a>
		</li>
		<li>
			<a title="怀疑" href="javascript:void(0)"><img src="/images/smiley/huaiyi.png" /></a>
		</li>
		<li>
			<a title="休息喝咖啡" href="javascript:void(0)"><img src="/images/smiley/kafei.png" /></a>
		</li>
		<li>
			<a title="可爱" href="javascript:void(0)"><img src="/images/smiley/keai.png" /></a>
		</li>
		<li>
			<a title="哭" href="javascript:void(0)"><img src="/images/smiley/ku.png" /></a>
		</li>
		<li>
			<a title="骂" href="javascript:void(0)"><img src="/images/smiley/ma.png" /></a>
		</li>
		<li>
			<a title="俏皮" href="javascript:void(0)"><img src="/images/smiley/qiaopi.png" /></a>
		</li>
		<li>
			<a title="傻笑" href="javascript:void(0)"><img src="/images/smiley/shaxiao.png" /></a>
		</li>
		<li>
			<a title="生气" href="javascript:void(0)"><img src="/images/smiley/shengqi.png" /></a>
		</li>
		<li>
			<a title="调皮" href="javascript:void(0)"><img src="/images/smiley/tiaopi.png" /></a>
		</li>
		<li>
			<a title="听歌" href="javascript:void(0)"><img src="/images/smiley/tingge.png" /></a>
		</li>
		<li>
			<a title="委屈" href="javascript:void(0)"><img src="/images/smiley/weiqu.png" /></a>
		</li>
		<li>
			<a title="嘘" href="javascript:void(0)"><img src="/images/smiley/xu.png" /></a>
		</li>
		<li>
			<a title="郁闷" href="javascript:void(0)"><img src="/images/smiley/yumen.png" /></a>
		</li>
		<li>
			<a title="眨眼" href="javascript:void(0)"><img src="/images/smiley/zhayan.png" /></a>
		</li>
		<li>
			<a title="吃惊" href="javascript:void(0)"><img src="/images/smiley/zhuanjia.png" /></a>
		</li>
		<li>
			<a title="草泥马" href="javascript:void(0)"><img src="/images/smiley/caonima.png" /></a>
		</li>
		<li>
			<a title="沙发" href="javascript:void(0)"><img src="/images/smiley/shafa.png" /></a>
		</li>
		<li>
			<a title="蛋糕" href="javascript:void(0)"><img src="/images/smiley/dangao.png" /></a>
		</li>
		<li>
			<a title="礼物" href="javascript:void(0)"><img src="/images/smiley/liwu.png" /></a>
		</li>
		<li>
			<a title="鸭梨" href="javascript:void(0)"><img src="/images/smiley/yali.png" /></a>
		</li>
		<li>
			<a title="猪头" href="javascript:void(0)"><img src="/images/smiley/zhutou.png" /></a>
		</li>
		
		<%for(int x=0;x<11;x++){ %>
		<li>
			<a></a>
		</li>
		<%} %>
	</ul>
	<!-- 表情动静切换 -->
	<script> 
		$(function(){
			$('ul#face a').bind('mouseenter', function(a) {
			$(this).find('img').attr("src",$(this).find('img').attr("src").replace("jpg","gif")); 
			}); 
			$('ul#face a').bind('mouseleave', function(a) { 
			$(this).find('img').attr("src",$(this).find('img').attr("src").replace("gif","jpg")); 
			}); 
		});
	</script> 
</div>


