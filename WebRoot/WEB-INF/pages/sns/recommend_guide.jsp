<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("*[psftype='guide']").hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
		});
		
		initFloatPic(null,110);
		initBrandPic(148);
		
	});
</script>
    
<!--指南-->

<div class="media-list"> 
	<c:if test="${empty guides}">
		<div style="text-align:center">${message}</div>
	</c:if>                 
    <c:forEach items="${guides.list}" var="guide">
    <div class="item s_clear" psftype="guide">
    
        <div class="right rinfo">
        
            <div class="popup">
                <span class="popupbox"><span>${guide.commentcount}</span></span>
            </div>
            
            <div class="love">
            
                <div class="lovebox">
                
                    <a class="love_minibtn" liked="${(guide.isLiked) ? 1 : 0}" psftype="like" otype="4" oid="${guide.postid}"></a>
                     
                </div>
                <p>${guide.likecount}</p>
                <p>喜欢</p>
                
                <c:if test="${!empty guide.pics}">
	                <div class="imgbox">
	                    <a href="/post/${guide.postid}" target="_blank"><span psftype="pic" postid="${guide.postid}"></span></a>
	                </div>
            	</c:if>
            </div>
            
            <c:if test="${!empty guide.pics}">
            	<div class="imgbox"><a href="/post/${guide.postid}" target="_blank"><span></span></a></div>
            </c:if>
            
            <div id="pics_${guide.postid}" style="border:1px solid gray; margin:2px; display:none;">
				<div class="arrow_bg arrow_top">
                      <div class="arrow"></div>
                      <div class="arrow_ligh"></div>
                    </div>
                    
                    <div class="layerBox">
                    
                        <div id="pics_${guide.postid}" class="pics">
                        	<c:forEach items="${guide.pics}" var="pic">
                         		<img style="width:108px;height:108px;" src="/pic/${pic.picid}-1.${pic.fileType}" alt="" />
                         	</c:forEach>
                        </div>
                        
                    </div>
			</div>
            
            <div class="activeflag activeflag-green">
                <a href="/post/${guide.postid}" target="_blank" psftype="brand_pic" postid="${guide.postid}">相关品牌</a>
            </div>
            <div id="brand_list_${guide.postid}" class="logo_popup" style="width:162px;border:1px gray solid;background:#fff;display:none;">
				<div class="logo_list">
			    	<c:forEach items="${guide.brands}" var="brand">
			    		<div><a class="like" href="#"></a><a href="#"><img width="148px" height="73" src="/pic/${brand.logoName}" alt="${brand.brandname}" /></a></div>
			        </c:forEach>
			    </div>
			</div>
        
        </div>
    
        <div class="left">
        
            <dl class="titlebox">
            
                <dt><a href="#"><img src="/pic/${guide.avatarName}" alt="" /></a></dt>
                <dd>
                    <h3><a href="/post/${guide.postid}" target="_blank">${guide.title}</a></h3>
                    <p>${guide.username}</p>
                </dd>
            
            </dl>
            
            <p class="info"><b>指南：</b><a href="/post/${guide.postid}" target="_blank">${guide.listcontent}</a></p>
            <p>
            	<c:if test="${!empty guide.lastComment}">
                <b>最后评论：</b><a href="#"><span>${guide.lastComment.username}</span></a>   ${guide.lastComment.timepassed}
                </c:if>
            </p>
        
        </div>
        
    </div>
    </c:forEach>
    
   <div class="more">
       <div class="more">
       <c:if test="${typeid eq 1}">
       	<psf:simplepage pageCount="${guides.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',5,#page#,${typeid})" page="${page}"></psf:simplepage>
       </c:if>
       <c:if test="${typeid eq 2}">
       	<psf:simplepage pageCount="${guides.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',5,#page#,${typeid},{'postid':${postid},'uid':${uid}})" page="${page}"></psf:simplepage>
       </c:if>
       <c:if test="${typeid eq 3}">
       	<psf:simplepage pageCount="${guides.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',5,#page#,${typeid},{'postid':${postid}})" page="${page}"></psf:simplepage>
       </c:if>
       </div>
   </div>
                    
</div>
    