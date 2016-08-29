<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">

$(document).ready(function(){
	initData();
});
function initData(){
	$("select[name='Industry']").val(${type});
}
function changeTab(){
	window.location.href="/sns/wealth/mywealthpoint?type="+$("select[name='Industry']").val();
}
</script>
<!-- 我的积分内容 -->
   		<div class="pagenav"></div>
          	 <select name="Industry" onchange="changeTab()">
          	 	<option value="1">当月记录</option>
            	<option value="2">1个月前记录</option>
                <option value="3">2个月前记录</option>
                <option value="4">3个月前记录</option>
            </select> 
           <div id="monthcopy">
            <table width="100%" border="0">
                           <thead>
                               <tr>
                               <td width="30%">日期</td>
                               <td width="15%">获取积分</td>
                               <td width="15%">消耗积分</td>
                               <td width="40%">详情</td>
                             </tr>
                           </thead>
							<c:forEach items="${pointList}" var="point">
                            <tr>
                               <td>${point.time }</td>
                               <td>${point.getPoint }</td>
                               <td>${point.expPoint }</td>
                               <td><a href="#">${point.summary }</a></td>
                             </tr>
                            </c:forEach>      
             </table>
           </div>
           
           <c:if test="${pageCount > 1}">
			 	<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/wealth/mywealthpoint?type=${type}&page=#page#"></psf:page>
		  </c:if>