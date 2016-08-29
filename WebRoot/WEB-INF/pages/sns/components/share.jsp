<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div id="shareDialog" class="share" style="display:none;">
	<!-- <div class="share_title"><h3>分享到...</h3></div> -->
	<div class="layerTop"><a href="javascript:closeShareDialog()" class="close"></a></div>
	<ul class="share_item s_clear">
		<li><a target="_blank" class="share_ico share_qzone" _href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.psf100.com/post/#postid#.html&title=#title#&site=http://www.psf100.com/post/#postid#.html&summary=#title#" href="#">QQ空间</a></li>
		<li><a target="_blank" class="share_ico share_tsina" _href="http://v.t.sina.com.cn/share/share.php?url=http://www.psf100.com/post/#postid#.html&title=#title#" href="#">新浪微博</a></li>
		<li><a target="_blank" class="share_ico share_msn" _href="http://www.douban.com/recommend/?url=http://www.psf100.com/post/#postid#.html&title=#title#&v=1" href="#">豆瓣</a></li>
		<li><a target="_blank" class="share_ico share_tqq" _href="http://v.t.qq.com/share/share.php?url=http://www.psf100.com/post/#postid#.html&title=#title#" href="#">腾讯微博</a></li>
		<li><a target="_blank" class="share_ico share_renren" _href="http://share.renren.com/share/buttonshare.do?link=http://www.psf100.com/post/#postid#.html&title=#title#" href="#">人人网</a></li>
		<li><a target="_blank" class="share_ico share_kaixin001" _href="http://www.kaixin001.com/~repaste/repaste.php?rurl=http://www.psf100.com/post/#postid#.html&rtitle=#title#" href="#">开心网</a></li>
		<li><a target="_blank" class="share_ico share_t163" _href="http://t.163.com/article/user/checkLogin.do?link=http://www.psf100.com/post/#postid#.html&source=品上丰&info=#title#" href="#">网易微博</a></li>
		<li><a target="_blank" class="share_ico share_tsohu" _href="http://t.sohu.com/third/post.jsp?&url=http://www.psf100.com/post/#postid#.html&title=#title_gbk#" href="#">搜狐微博</a></li>
		<li><a target="_blank" class="share_ico share_xiaoyou" _href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http://www.psf100.com/post/#postid#.html&title=#title#&site=http://www.psf100.com/post/#postid#.html&summary=#title#" href="#">朋友网</a></li>
		<li><a target="_blank" class="share_ico share_tieba" _href="http://bai.sohu.com/share/blank/addbutton.do?from=cssbaby.com&link=http://www.psf100.com/post/#postid#.html&title=#title#" href="#">白社会</a></li>
		<li><a target="_blank" class="share_ico share_taobao" _href="http://share.jianghu.taobao.com/share/addShare.htm?url=http://www.psf100.com/post/#postid#.html&title=#title#" href="#">淘江湖</a></li>
		<li><a target="_blank" class="share_ico share_baidu" _href="http://cang.baidu.com/do/add?it=#title#&iu=http://www.psf100.com/post/#postid#.html&fr=ien#nw=1">百度搜藏</a></li>
	</ul>
</div>