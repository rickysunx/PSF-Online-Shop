 <%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:forEach items="${follows.list}" var="follow">
<dl class="namebox s_clear" id="follow_${follow.friendid }" psftype="followList">
      <dt class="imgborder" psftype="card" uid="${follow.friendid}">
		  <input type="hidden" id="followgroup_otype" value="${otype }"/>
          <a href="#"><img src="/pic/${follow.avatarFileName }" alt="" /></a>
      </dt>
      <dd class="dd">
          <div class="row">
				<c:if test="${follow.sex eq 0}"></c:if>
				<c:if test="${follow.sex eq 1}"><span class="sex man"></span></c:if>
                <c:if test="${follow.sex eq 2}"><span class="sex woman"></span></c:if>
                <div class="name">
                    <a href="#"><b>${follow.username }</b></a>
					<span id="oname_${follow.friendid }">
					<c:choose>
						<c:when test="${empty follow.oname}"><a href="javascript:openRemarkDialog(${follow.friendid},'','${follow.username}');">[设置备注]</a></c:when>
						<c:otherwise>(${follow.oname})<a href="javascript:openRemarkDialog(${follow.friendid},'${follow.oname}','${follow.username}');">[修改备注]</a></c:otherwise>
					</c:choose>
					</span>
                </div>
          </div>
          <div class="row">
                <span class="sex xin"></span>
                <div class="name">
                     ${follow.zonename }
                </div>
          
          </div>
          <div class="data">
                <span><a href="#">关注</a>${follow.follows }</span><span><a href="#">粉丝</a>${follow.fans }</span><span><a href="#">圈子</a>${follow.groups }</span><span><a href="#">发表</a>${follow.pubs }</span>
          </div>
   			<c:choose>
				<c:when test="${empty follow.newpost}"></c:when>
	
				<c:otherwise>
					<div class="extMsgbox extMsgbox_on">
	 					<div>
							<a href="#">${follow.newpost}</a>		
						</div>
					</div>	
				</c:otherwise>
			</c:choose>  
      </dd>
      <dd class="dropbtn" psftype="followGroup" friendid="${follow.friendid}">
        <a class="drop" href="javascript:void(0);"><b id="followGroup_${follow.friendid }">${follow.followgroupname }</b><em></em></a>
      </dd>
      <dd class="list">
                
          <div class="flag">
			  <c:if test="${follow.isfans}"><span class="sxgz sxgz_two"></span></c:if>
          </div>
          <div class="link" style="display:none;">
          
              <p><a href="javascript:void(0)" onclick="delFollow(${follow.friendid},delFollowHandle3);">取消关注</a></p>
			  <c:choose>
			  	<c:when test="${follow.isfans}"></c:when>
				<c:otherwise><p><a href="javascript:void(0)" onclick="openAskForFollowDialog('${follow.friendid }','${follow.username }',this);">求关注</a></p></c:otherwise>
			  </c:choose>	  
          	  <p><a href="javascript:void(0)" onclick="openSendMsgDialog('${follow.friendid }','${follow.username }',this);">私信</a></p>
          </div>
      
      </dd>
</dl>
</c:forEach>
<br/>
<c:if test="${follows.pageCount > 1}">
<psf:page pageCount="${pageCount}" page="${curPage}" action="javascript:loadFollowList(${otype},'${keyword }',#page#);"></psf:page>
</c:if>
<script type="text/javascript">
initPsfTypes();
function initFollowList() {
	$("dl[psftype='followList']").hover(function(){
		$(this).find(".link").show();
	},function(){
		$(this).find(".link").hide();
	});
}
initFollowList();

</script>