<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%><%@page import="psf.vo.sns.PostListItemVO"%><%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
	$(document).ready(function(){
		$("#shopexp_img_${postItem.postid} a").click(function(){
			var obj=this;
			if(!$(obj).parent().data("isopen")){
				$(obj).siblings("a").andSelf().each(function(){
					var src = $(this).find("img").attr("src").replace("-1","-2");
					$(this).find("img").attr("src", src);
				});
				$(obj).parents(".postbox_shadow").attr("className","postbox_shadow postbox_shadow_big");
				$(obj).parent().data("isopen",true);
				
				setTimeout(function(){window.location.hash = obj.id},10);
			}else{
				$(obj).siblings("a").andSelf().each(function(){
					var src = $(this).find("img").attr("src").replace("-2","-1");
					$(this).find("img").attr("src", src);
				});
				$(obj).parents(".postbox_shadow").attr("className","postbox_shadow");	
				$(obj).parent().data("isopen",false);
				window.location.hash = "post_"+$(obj).parent().attr("id").split("_")[2];
			}
		})
	});
</script>
<psf:set key="product" value="${postItem.productList[0]}"></psf:set>
<div class="post_table">
	<div class="post_table_left">
		<div class="img"><a href="#"><img src="/pic/${product.pics[0].picid}.${product.pics[0].filetype}" alt="" /></a></div>
		<p>品上价：<b>￥${product.price }</b></p>
		<p>体验数：<b>${product.expCount }</b></p>
		<p class="post_combox">
			<span>用户点评：</span>
			<span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
		</p>
	</div>
	
	<div class="post_table_right">
		<div class="postbox_shadow">
			<div class="arrow"></div>
			<div class="b_m"><div class="b_l"><div class="b_r">
				<div class="m_r"><div class="t_r">
					<div class="postbox">
						${postItem.listContent}
						<div id="shopexp_img_${postItem.postid}" class="imglist">
							<c:forEach var="postpic" items="${postItem.postpicList}">
								<a id="${postpic.picid}" href="javascript:void(0)"><img src="/pic/${postpic.picid}-1.${postpic.fileType}" alt="" /></a>
							</c:forEach>
						</div>
					</div>
				</div></div>
			</div></div></div>
		</div>
	</div>

</div>

