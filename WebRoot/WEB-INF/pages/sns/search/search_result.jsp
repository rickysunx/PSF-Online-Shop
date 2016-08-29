<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	var load_param = {
		"type" : ${type},
		"keyword" : "${empty keyword ? null : keyword}",
		"orderby" : 1,
		"page" : 1
	};
	
	$(function(){
		loadList(-1,null,-1,-1);
	});
	
	function loadList(type,keyword,orderby,page){
		if(type != -1){
			load_param["type"] = type;
			page = 1;
		}if(keyword != null){
			load_param["keyword"] = keyword;
		}if(orderby != -1){
			load_param["orderby"] = orderby;
			$("#searchTab li:eq("+(orderby-1)+")").addClass("active").siblings().removeClass("active");
		}if(page != -1){
			load_param["page"] = page;
		}
		$("#result_list").html("<img style='top:5px;position:relative;' src='/images/loading.gif'/>");
		$("#result_list").load(
			"/sns/search/resultlist",
			load_param
		);
	}
</script>

<psf:include page="/sns/search/search_tab.jsp"></psf:include>

<div class="searchNav"></div>

<div id="result_list" class="post_list"></div>