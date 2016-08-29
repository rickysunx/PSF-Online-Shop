<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_guide","搜索指南");
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_guide" name="keyword" />
		<a class="searchbtn" href="javascript:void(0)" onclick="javascript:loadClubGuide(-1,-1,$('#search_guide').val(),-1,-1)"></a>
	</div>
	<div class="linkbox">
		<dl cateid="0">
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadClubGuide(0,-1,null,1,-1)"><span><span>全部</span></span></a></dt>
		</dl>
		<c:forEach items="${catelist}" var="cate" begin="0" end="3">
		<dl><dt>|</dt></dl>
		<dl cateid="${cate.cateid}">
			<dt><a href="javascript:void(0)" onclick="javascript:loadClubGuide(${cate.cateid},-1,null,1,-1)"><span><span>${cate.catename}</span></span></a></dt>
		</dl>
		</c:forEach>
		
		<c:if test="${fn:length(catelist)>4}">
		<dl class="dropmenu">
			<dt><a class="morebtn" href="#"><i>更多</i><span></span></a></dt>
			<dd>
				<ul>
					<li cateid="${cate.cateid}"><a href="javascript:void(0)" onclick="javascript:loadClubGuide(${cate.cateid},-1,null,1,-1)">${cate.catename}</a></li>
				</ul>
			</dd>
		</dl>
		</c:if>
	</div>
</div>