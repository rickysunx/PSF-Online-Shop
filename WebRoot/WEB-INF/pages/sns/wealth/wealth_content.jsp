<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="lib_Contentbox lib_tabborder">  
	<div class="lib_Contentbox lib_tabborder">  
		<div id="con_five_1" >
			<ul class="friend-wealth">
				<c:forEach items="${userList}" var="user">
					<li>
						<img src="/pic/${user.avatarFileName }" alt="品友" />
	                    <p><a href="#">${user.username }</a></p>
	                    <p><b>享金累计:</b><a href="#">${user.coins }</a>元</p>
	                </li>
				</c:forEach>
   				<div class="pagenav"></div>
            </ul>
              <center>
				<c:if test="${pageCount > 1}">
					<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/wealth/psffriendwealth?type=${type}&page=#page#"></psf:page>
			    </c:if>
			</center>
            
		</div>
	</div>
</div>

