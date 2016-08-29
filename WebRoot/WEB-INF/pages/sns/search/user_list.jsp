<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty userlist}">
<div class="right_nodata_big">没有相关数据哦，赶快去发布吧。</div>
</c:if>
<c:forEach items="${userlist}" var="user">
<dl psftype="friendList" class="namebox s_clear" id="my_friend_${user.uid}" style="margin-top:20px;margin-bottom:20px;border-bottom: 1px solid #DCDCDC;">
      <dt class="imgborder" psftype="card" uid="${user.uid}">
        <a href="#"><img src="/pic/${user.avatarFileName }" alt="" /></a>
      </dt>
      <dd class="dd" style="width:480px;">
          <div class="row">
				<c:if test="${user.sex eq 0}"></c:if>
				<c:if test="${user.sex eq 1}"><span class="sex man"></span></c:if>
                <c:if test="${user.sex eq 2}"><span class="sex woman"></span></c:if>
                <div class="name">
                    <a href="#"><b>${user.username}</b></a>
                </div>
          </div>
          <div class="row">
				<c:if test="${user.snsstatus eq 1}"><span class="sex danshen"></span></c:if>
                <c:if test="${user.snsstatus eq 2}"><span class="sex xin"></span></c:if>
				<c:if test="${user.snsstatus eq 3}"><span class="sex hua"></span></c:if>
                <div class="name">
                	${user.zonename }
                </div>
          
          </div>
          <div class="data">
                <span><a href="#">关注</a>${user.followcount}</span><span><a href="#">粉丝</a>${user.fanscount }</span><span><a href="#">圈子</a>${user.groupcount}</span><span><a href="#">发表</a>${user.publiccount}</span>
          </div>	
          <c:if test="${!empty user.lastpost}">
			<div class="extMsgbox" id="showMore_${user.uid}" style="margin-bottom:15px;">
				<div>
					<c:if test="${fn:length(user.lastpost.content)>50}">
                   		<a class="right" href="javascript:showMore(${user.uid});"></a>
                   	</c:if>
					<a href="javascript:showMore(${user.uid});">${user.lastpost.content}(${user.lastpost.timepassed})</a>		
				</div>
			</div>
          </c:if>
      </dd>

      <dd class="list" style="margin-left:30px;">
          <div class="flag">
              <c:if test="${user.isfriend}"><span class="sxgz"></span></c:if>
              <c:if test="${user.isfollow && isfans}"><span class="sxgz sxgz_two"></span></c:if>
          </div>
          <div style="margin-top:20px;">
			<div id="fans_add_follow_1" class="flag">
				<c:choose>
					<c:when test="${!user.isfollow}">
						<a id="fans_add_follow_${user.uid}" class="addbtn02 addbtn02_ok" onclick="addFollow(${user.uid}, addFollowHandle3);" href="javascript:void(0)">
							<em></em>关注
						</a>
					</c:when>
					<c:otherwise>
						<c:if test="${!user.isfriend}">
							<a id="addfriend_${user.uid}" class="addbtn02 addbtn02_ok" onclick="openAskForFriendDialog(${user.uid},'${user.username}',this);" href="javascript:void(0)">
								<em></em>好友
							</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
          <!--
              <p><a href="javascript:void(0)" onclick="opentuijianFriendDialog(${user.uid},'${user.username }')">推荐好友</a></p>
 			  <p><a href="javascript:void(0)" onclick="openIntroduceFriendDialog(${user.uid},'${user.username }')">引荐好友</a></p>
              <p><a href="javascript:void(0)" onclick="openSendMsgDialog('${user.uid}','${user.username }',this);">发私信</a></p>
              <p><a href="javascript:void(0)" onclick="">举报</a></p>
          -->
          </div>
      </dd>
</dl>
</c:forEach>
<br/>


	<c:if test="${pageCount > 1}">
		<psf:page pageCount="${pageCount}" page="${page}" action="javascript:loadList(-1,null,-1,#page#)"></psf:page>
	</c:if>
<script type="text/javascript">
initPsfTypes();
function initFriendList() {
	$("dl[psftype='friendList']").hover(function(){
		$(this).find(".link").show();
	},function(){
		$(this).find(".link").hide();
	});
}
initFriendList();
</script>