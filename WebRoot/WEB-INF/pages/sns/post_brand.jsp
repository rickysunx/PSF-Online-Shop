<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- Post相关品牌 -->
<div id="brand_list" style="padding:10px;">
	<ul>
		<c:forEach items="${brandlist}" var="brand">
			<li style="width:132px;float:left;margin-right:10px;">
			
				<div class="imgsdborder01">
					<div class="img">
						<div>
							<img width="124px" height="84px" src="/pic/${brand.logoName}">
						</div>
					</div>
				</div>
				
				<p style="width:132px;text-align:center;margin-top:5px;">
					<a href="#">${brand.brandname}</a>
				</p>
				
			</li>
		</c:forEach>
		<!--
		<li style="width:132px;float:left;margin-right:10px;">
		
			<div class="imgsdborder01">
				<div class="img">
					<div>
						<img width="124px" height="84px" src="/pic/671.jpg">
					</div>
				</div>
			</div>
			
			<p style="width:132px;text-align:center;margin-top:5px;">
				<a href="#">三星</a>
			</p>
			
		</li>
		
		<li style="width:132px;float:left;margin-right:10px;">
		
			<div class="imgsdborder01">
				<div class="img">
					<div>
						<img width="124px" height="84px" src="/pic/695.jpg">
					</div>
				</div>
			</div>
			
			<p style="width:132px;text-align:center;margin-top:5px;">
				<a href="#">安踏</a>
			</p>
			
		</li>
		-->
	</ul>
	<c:if test="${pageCount > 1}">
		<div style="clear:both;padding:7px 10px;line-height:18px;text-align:right;">
			<c:if test="${page eq 1}">
				<a style="color:gray;">上一组</a><a href="javascript:getPostBrand('${divid}', ${postItem.postid},${page+1})">下一组</a>
			</c:if>
			<c:if test="${(page > 1) && (page < pageCount)}">
				<a href="javascript:getPostBrand('${divid}', ${postItem.postid},${page-1})">上一组</a><a href="javascript:getPostBrand('${divid}', ${postItem.postid},${page+1})">下一组</a>
			</c:if>
			<c:if test="${page eq pageCount}">
				<a href="javascript:getPostBrand('${divid}', ${postItem.postid},${page-1})">上一组</a><a style="color:gray;">下一组</a>
			</c:if>
		</div>
	</c:if>
</div>


