<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty grouplist}">
	<li><div class="post_no_data">没有相关数据哦，赶快去发布吧。</div></li>	
</c:if>
<input id="pageCount" type="hidden" name="pageCount" value="${pageCount}"/>
<input id="page" type="hidden" name="page" value="${page}"/>

<c:forEach items="${grouplist}" var="group">
 <li>
     <div class="item">
         <dl>
             <dt><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo}" alt="" /></a></dt>
             <dd>
                 <h4><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a></h4>
                 <p>创建者：<a href="#">${group.displayName}</a></p>
                 <p>成员：${group.membercount}人</p>
             </dd>
         </dl>
         
         <div class="info">简介：<a href="#">${group.intro}</a></div>
         
         <div class="bottom">
         	<c:if test="${!empty group.joiner}">
             <div class="friends">
                 <c:forEach items="${group.joiner}" var="user">
                 <a href="#"><img src="/pic/${user.avatarFileName}" alt="" width="20px" height="20px"/></a>
              	</c:forEach>
             </div>
             </c:if>
             <div class="total">
                 <a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">你有${group.psfFriendCount}个品友在参与&gt;&gt;</a>
             </div>
         </div>
     </div>
 </li>
</c:forEach>
<script type="text/javascript">
	if($('#pageCount').val() > 1){
		$('#next').show();
	}else{
		$('#next').hide();
	}
</script>