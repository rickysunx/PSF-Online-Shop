<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 相关品牌 --> 

<div class="brand_list_box">

	<ul>
		<c:if test="${empty brandlist}">
			<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
		</c:if>
    	<c:forEach items="${brandlist}" var="brand">
    	<li>
        	<div class="logo_card_info">
            	<h6><a href="#">${brand.brandname}<span>/品牌故事</span></a></h6>
                <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
               		<img src="/pic/${brand.logoName}"/>
                </div>
                <div class="bottom">
                	<a class="like" href="#"><em></em></a>
                	<p>好友推荐:<span>${brand.recommendCount}</span></p>
                    <p>相关指南:<span>${brand.guideCount}</span></p>
                    <p>喜欢:<span>${brand.likecount}</span></p>
                </div>
            </div>
        </li>
        </c:forEach>
        <!--
        <li>
        	<div class="logo_card_info">
            	<h6><a href="#">西门子<span>/品牌故事</span></a></h6>
                <div class="logo">
                    logo品牌最大尺寸是124 x 84
                </div>
                <div class="bottom">
                	<a class="click" href="#"></a>
                	<p>好友推荐:<span>20</span></p>
                    <p>相关指南:<span>300</span></p>
                    <p>喜欢:<span>5000</span></p>
                </div>
            </div>
        </li>
        -->   
    </ul>
</div>
<c:if test="${!empty brandlist}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadPostBrand(-1,-1,null,#page#);"></psf:page>
</c:if>