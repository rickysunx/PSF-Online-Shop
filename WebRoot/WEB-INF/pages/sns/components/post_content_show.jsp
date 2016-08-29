<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%><%@page import="psf.vo.sns.PostListItemVO"%><%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>


	<div class="post_content01">
		<p class="p">${postItem.listContent}</p>
	</div>	
	<div id="imglist_${postItem.postid}" class="imglist">
		<c:forEach items="${postItem.postpicList}" var="postpic">
			
			<script>
			$(document).ready(function(){
				var objArray = [
					<c:forEach items="${postItem.productList}" var="product" begin="0" end="3">
					{imgurl : "/pic/${product.pics[0].picid}.${product.pics[0].filetype}",
					title : "${product.pname}",
					imghref : "javascript:void(0)",
					price : "${product.price_market}",
					psfprice : "${product.price}",
					buyhref : "javascript:void(0)"},
					</c:forEach>{}
				];
				objArray.pop();
				new showobject("${postpic.picid}",objArray);
			});
			</script>
			
			<a id="${postpic.picid}" href="javascript:void(0)"><img src="/pic/${postpic.picid}-1.${postpic.fileType}" alt="" /></a>
			
		</c:forEach>
	</div>