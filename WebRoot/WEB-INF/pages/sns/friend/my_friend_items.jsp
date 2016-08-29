<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>


<c:forEach items="${friends.list}" var="friend">
<dl psftype="friendList" class="namebox s_clear" id="my_friend_${friend.friendid }">
      <dt class="imgborder" psftype="card" uid="${friend.friendid}">
        <a href="#"><img src="/pic/${friend.avatarFileName }" alt="" /></a>
		<input type="hidden" id="friendgroup_otype" value="${otype }"/>
      </dt>
      <dd class="dd">
          <div class="row">
				<c:if test="${friend.sex eq 0}"></c:if>
				<c:if test="${friend.sex eq 1}"><span class="sex man"></span></c:if>
                <c:if test="${friend.sex eq 2}"><span class="sex woman"></span></c:if>
                <div class="name">
                    <a href="#"><b>${friend.username}</b></a>
					<span id="oname_${friend.friendid }">
					<c:choose>
						<c:when test="${empty friend.oname}"><a href="javascript:openRemarkDialog(${friend.friendid},'','${friend.username}');">[设置备注]</a></c:when>
						<c:otherwise>(${friend.oname})<a href="javascript:openRemarkDialog(${friend.friendid},'${friend.oname}','${friend.username}');">[修改备注]</a></c:otherwise>
					</c:choose>
					</span>
                </div>
          </div>
          <div class="row">
				<c:if test="${friend.snsstatus eq 1}"><span class="sex danshen"></span></c:if>
                <c:if test="${friend.snsstatus eq 2}"><span class="sex xin"></span></c:if>
				<c:if test="${friend.snsstatus eq 3}"><span class="sex hua"></span></c:if>
                <div class="name">
                	${friend.zonename }
                </div>
          
          </div>
          <div class="data">
                <span><a href="#">关注</a>${friend.follows }</span><span><a href="#">粉丝</a>${friend.fans }</span><span><a href="#">圈子</a>${friend.groups }</span><span><a href="#">发表</a>${friend.pubs }</span>
          </div>	
			<c:choose>
				<c:when test="${empty friend.newpost}"></c:when>
				<c:otherwise>

							<div class="extMsgbox extMsgbox_on">
	 							<div>
									<a href="#">${friend.newpost}</a>		
								</div>
							</div>	
			
				</c:otherwise>
			</c:choose>     
      </dd>
      <dd class="dropbtn" psftype="friendGroup" friendid="${friend.friendid}" >
        <a class="drop" href="javascript:void(0);"><b id="friendGroup_${friend.friendid}">${friend.friendgroupname }</b><em></em></a>
      </dd>
      <dd class="list">
          <div class="flag">
              <span class="sxgz"></span>
          </div>
          <div class="link" style="display:none;">
              <p><a href="javascript:void(0)" onclick="opentuijianFriendDialog(${friend.friendid},'${friend.username }')">推荐好友</a></p>
 			  <p><a href="javascript:void(0)" onclick="openIntroduceFriendDialog(${friend.friendid},'${friend.username }')">引荐好友</a></p>
              <p><a href="javascript:void(0)" onclick="delFriend(${friend.friendid});">取消好友</a></p>
              <p><a href="javascript:void(0)" onclick="openSendMsgDialog('${friend.friendid }','${friend.username }',this);">发私信</a></p>
          </div>
      </dd>
</dl>
</c:forEach>
<br/>


	<c:if test="${friends.pageCount > 1 && empty type}">
		<psf:page pageCount="${pageCount}" page="${curPage}" action="javascript:loadFriendList(${otype},'${keyword }',#page#);"></psf:page>
	</c:if>
	<c:if test="${friends.pageCount > 1 && type != null}">
		<psf:page pageCount="${pageCount}" page="${curPage}" action="javascript:loadFriendByTypeList(${type},#page#);"></psf:page>
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
