<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:forEach var="question" items="${questionList}">
<div id="answer_item_${question.postid}" class="answer_list_group">
    <psf:set key="q" value="${question}"></psf:set>
    <psf:include page="/mall/product_one_question.jsp"></psf:include>
</div>
</c:forEach>

<c:if test="${pageCount>1}">
	<psf:page pageCount="${pageCount}" action="loadGoodsQuestion(#page#)" page="${page}"></psf:page>
</c:if>