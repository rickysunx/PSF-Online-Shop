<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<c:forEach items="${fans.list}" var="fan">
<dl class="namebox s_clear" id="fans_${fan.friendid }" psftype="fansList">
      <dt class="imgborder" psftype="card" uid="${fan.friendid}">
          <a href="#"><img src="/pic/${fan.avatarFileName }" alt="" /></a>
      </dt>
      <dd class="dd">
          <div class="row">
				<c:if test="${fan.sex eq 0}"></c:if>
				<c:if test="${fan.sex eq 1}"><span class="sex man"></span></c:if>
                <c:if test="${fan.sex eq 2}"><span class="sex woman"></span></c:if>
                <div class="name">
                    <a href="#"><b>${fan.username }</b></a>
					<span id="oname_${fan.friendid }">
					<c:choose>
						<c:when test="${empty fan.oname}"><a href="javascript:openRemarkDialog(${fan.friendid},'','${fan.username}');">[设置备注]</a></c:when>
						<c:otherwise>(${fan.oname})<a href="javascript:openRemarkDialog(${fan.friendid},'${fan.oname}','${fan.username}');">[修改备注]</a></c:otherwise>
					</c:choose>
					</span>
                </div>
          </div>
          <div class="row">
                <span class="sex xin"></span>
                <div class="name">
                	${fan.zonename }
                </div>
          
          </div>
          <div class="data">
                <span><a href="#">关注</a>${fan.follows }</span><span><a href="#">粉丝</a>${fan.fans }</span><span><a href="#">圈子</a>${fan.groups }</span><span><a href="#">发表</a>${fan.pubs }</span>
          </div>
			<c:choose>
				<c:when test="${empty fan.newpost}"></c:when>
		
				<c:otherwise>
					<div class="extMsgbox extMsgbox_on">
	 							<div>
									<a href="#">${fan.newpost}</a>		
								</div>
							</div>
				</c:otherwise>
			</c:choose>  
      </dd>

      <dd class="list">
                
          <div class="flag" id="fans_add_follow_${fan.friendid }">
              <c:choose>
              	<c:when test="${fan.isfollow}"></c:when>
				<c:otherwise><a href="javascript:void(0)" class="addbtn02 addbtn02_ok" onclick="addFollow(${fan.friendid}, addFollowHandle3);"><em></em>关注</a></c:otherwise>
              </c:choose>    
          </div>
          <div class="link" style="display:none;">
          
              <p><a href="javascript:void(0)" onclick="delFans(${fan.friendid});">删除粉丝</a></p>
              <p><a href="javascript:void(0)" onclick="openAskForFriendDialog('${fan.friendid }','${fan.username }',this);">加好友</a></p>
              <p><a href="javascript:void(0)" onclick="openSendMsgDialog('${fan.friendid }','${fan.username }',this);">发私信</a></p>
          
          </div>
      
      </dd>
</dl>
</c:forEach>
<br/>

<c:if test="${fans.pageCount > 1}">
<psf:page pageCount="${pageCount}" page="${curPage}" action="javascript:loadFansList('${keyword }',#page#);"></psf:page>
</c:if>
<script type="text/javascript">
initPsfTypes();
function initFansList() {
	$("dl[psftype='fansList']").hover(function(){
		$(this).find(".link").show();
	},function(){
		$(this).find(".link").hide();
	});
}
initFansList();
</script>
