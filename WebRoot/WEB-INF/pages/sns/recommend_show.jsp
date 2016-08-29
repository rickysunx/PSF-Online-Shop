<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(document).ready(function() {
		if($("#floatShow").length==0) {
			$("body").append("<div id='floatShow' style='display:none;width:250px;height:355px;'></div>");
		}
		$.each($("*[psftype='show']"),function(i,n){
			$(n).psfDirectoryDialog({"contentid":"floatShow","arrow":true,"arrowauto":false,"arrowdirection":"right","arrowpos":0},function(target){
				var showid = $(target).attr("showid");
				$("#floatShow").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
				$("#floatShow").load("/action/sns/get_float_show",{"showid":showid});
			});
		});
		/*
		$("*[psftype='show']").psfDirectoryDialog({"contentid":"floatShow"},function(target){
			var showid = $(target).attr("showid");
			$("#floatShow").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#floatShow").load("/action/sns/get_float_show",{"showid":showid});
		});*/
	});
</script>
    
<!--秀场-->
<div class="freeimg-list">
                
    <div class="listbox">
    
        <ul class="imgborder s_clear">
        	<c:if test="${empty shows}">
        		<div style="text-align:center">${message}</div>
        	</c:if>
        	<c:forEach items="${shows.list}" var="show">
	            <li psftype="show" showid="${show.postid}">
	                <a href="/post/${show.postid}" target="_blank"><img src="/pic/${show.cover_thumb}" alt="" /></a>
	            </li>
			</c:forEach>
        </ul>
        
       	<div class="more">
       	<c:if test="${typeid eq 1}">
     		<psf:simplepage pageCount="${shows.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',3,#page#,${typeid})" page="${page}"></psf:simplepage>	
       	</c:if>
       	<c:if test="${typeid eq 2}">
       		<psf:simplepage pageCount="${shows.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',3,#page#,${typeid},{'postid':${postid},'uid':${uid}})" page="${page}"></psf:simplepage>
       	</c:if>
       	<c:if test="${typeid eq 3}">
       		<psf:simplepage pageCount="${shows.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',3,#page#,${typeid},{'postid':${postid}})" page="${page}"></psf:simplepage>
       	</c:if>
       	</div>
    </div>
</div>
    
    
    