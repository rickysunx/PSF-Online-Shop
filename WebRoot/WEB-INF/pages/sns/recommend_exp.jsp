<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("*[psftype='psf_shopexp']").hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
		});
		initFloatPic(null,110);
	});	
</script>
    
<!--体验-->                    
<div class="media-list">
    <c:if test="${empty shopexps}">
   		<div style="text-align:center">${message}</div>
   	</c:if>                
     
    <c:forEach items="${shopexps.list}" var="shopexp">
        <div class="item s_clear" psftype="psf_shopexp">
        
        	<div class="right">
                <div class="popup">
                    <span class="popupbox"><span>${shopexp.commentcount}</span></span>
                </div>
               
                <div class="love">
                    <div class="lovebox">
                        <a class="love_minibtn" href="#"></a>
                    </div>
                    <p>${shopexp.likecount}</p>
                    <p>喜欢</p>
                    <c:if test="${!empty shopexp.pics}">
	                    <div class="imgbox">
	                        <a href="/post/${shopexp.postid}" target="_blank"><span psftype="pic" postid="${shopexp.postid}"></span></a>
	                    </div>
                    </c:if>
                </div>
                
                <c:if test="${!empty shopexp.pics}">
               		<div class="imgbox"><a href="/post/${shopexp.postid}" target="_blank"><span></span></a></div>
                </c:if>
                
                <div id="pics_${shopexp.postid}" style="border:1px solid gray; margin:2px; display:none;">
					<div class="arrow_bg arrow_top">
                       <div class="arrow"></div>
                       <div class="arrow_ligh"></div>
                     </div>
                     
                     <div class="layerBox">
                     
                         <div id="pics_${shopexp.postid}" class="pics">
                         	<c:forEach items="${shopexp.pics}" var="pic">
                         		<img style="width:108px;height:108px;" src="/pic/${pic.picid}-1.${pic.fileType}" alt="" />
                         	</c:forEach>
                         </div>
                         
                     </div>
				</div>
            </div>
        
            <div class="left">
                <dl class="titlebox s_clear">
                    <dt><a href="#"><img src="/pic/${shopexp.avatarname}" alt="" /></a></dt>
                    <dd>
                        <h3><a href="/post/${shopexp.postid}" target="_blank">${shopexp.title}</a></h3>
                        <p>${shopexp.username}</p>
                    </dd>
                </dl>
                <p class="info"><b>体验：</b><a href="/post/${shopexp.postid}" target="_blank">${shopexp.listcontent}</a></p>
                <p>
                	<c:if test="${!empty exp.lastComment}">
                	<b>最后评论：</b><a href="#"><span>${shopexp.lastComment.username}</span></a>  ${shopexp.lastComment.timepassed}
                    </c:if>
                </p>
            </div>
           
        </div>
    </c:forEach>
        
     <div class="more">
         <div class="more">
         	<c:if test="${typeid eq 1}">
         		<psf:simplepage pageCount="${shopexps.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',4,#page#,${typeid})" page="${page}"></psf:simplepage>	
         	</c:if>
         	<c:if test="${typeid eq 2}">
         		<psf:simplepage pageCount="${shopexps.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',4,#page#,${typeid},{'postid':${postid},'uid':${uid}})" page="${page}"></psf:simplepage>
         	</c:if>
         	<c:if test="${typeid eq 3}">
         		<psf:simplepage pageCount="${shopexps.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',4,#page#,${typeid},{'postid':${postid}})" page="${page}"></psf:simplepage>
         	</c:if>
         </div>
     </div>
                    
</div>