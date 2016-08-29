<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	initPsfTypes();
</script>

<table cellpadding="0">
    <tr>
        <th class="checkbox"></th>
        <th class="name">申请人</th>
        <th class="content">申请理由</th>
        <th class="time">申请时间</th>
        <th class="operations"></th>
    </tr>
    <c:if test="${empty applylist}">
    	<tr><td colspan="5">当前没有圈子申请</td></tr>
    </c:if>
    <c:forEach items="${applylist}" var="apply">
     <tr>
         <td class="checkbox"><input type="checkbox" name="applyid" value="${apply.applyid}"/></td>
         <td class="name">
             <div class="img"><a href="javascript:void(0)" psftype="card" uid="${apply.fromuid}"><img src="/pic/${apply.avatarFileName}" alt="" /></a></div>
             <p><a href="javascript:void(0)" psftype="card" uid="${apply.fromuid}">${apply.username}</a></p>
         </td>
         <td>${apply.content}</td>
         <td class="time">${apply.chnAddtime}</td>
         <td class="operations">
             <a href="javascript:void(0)" onclick="handleApply(false,1,${apply.applyid})">通过</a>
             <a href="javascript:void(0)" onclick="handleApply(false,2,${apply.applyid})">拒绝</a>
             <a href="javascript:void(0)" onclick="handleApply(false,3,${apply.applyid})">忽略</a>
         </td>
     </tr>
    </c:forEach>
</table>
<c:if test="${!empty applylist}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadApplyList(#page#);"></psf:page>
</c:if>

