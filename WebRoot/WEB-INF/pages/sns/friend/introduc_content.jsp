<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".introduc_item_box").psfArrow({
			direction:"top",
			arrowpos:20,
			style:"2"
		});
	});
	function delIntro(uid,username){
		if(confirm("确定要删除"+username+"为您推荐的好友？")){
			$.post(
				"/action/sns/friend/del_introduce","uid="+uid,
				function(data){
					if(data.success == 1){
						$("#introduce_"+uid).remove();
						$.psfInfoDialog("删除成功",2000);	
					} else {
						$.psfInfoDialog("删除失败",2000);	
					}
				},"json"
			);
		}
	}
	function followAllIntroduce(uids){
		var ids = uids.split(",");
		for(var i=0;i<ids.length;i++){
			addFollow(ids[i],addFollowHandle4);
		}
	}
</script>
		
<c:forEach items="${list}" var="intro">
<div class="introduc_item" id="introduce_${intro.uid }">
	<div class="introduc_item_header s_clear">
		<div  class="introduc_item_avtar">
			<a><img src="/pic/${intro.avatarFileName }"/></a>
		</div>
		<div class="introduc_item_title">
			<h4>${intro.username }</h4>
			<p>为我引荐品友</p>
		</div>
		<div class="introduc_item_other">
			<div class="layerClose"><a class="close" href="javascript:delIntro(${intro.uid },'${intro.username }');"></a></div>
			<p>${intro.time }</p>
		</div>
	</div>
	<div class="introduc_item_dialog s_clear">
		<div class="introduc_item_box">
			${intro.introcontent }
		</div>
		<a class="followbutton" href="javascript:followAllIntroduce('${intro.uids }');">+&nbsp;一键关注</a>
	</div>
	<div class="introduc_item_friend piclist">
		<ul>
		<c:forEach items="${intro.users}" var="user">
          <li>
              <div class="picborder">
                  <table class="pictable">
                      <tbody><tr>
                          <td class="t_l"> </td>
                          <td class="t_m">
                              <div></div>
                              <b></b>
                              <em></em>
                          </td>
                          <td class="t_r"> </td>
                      </tr>
                      <tr>
                          <td class="m_l"> </td>
                          <td class="m_m">
                              <div class="pic_card">
                                  <div class="card_infowrap">
                                      <div class="img imgborder01">
                                          <a href="#"><img alt="" src="/pic/${user.avatarFileName }"></a>
                                      </div>
                                      <div class="name_card">
                                          <div class="namebox">
                                              <div class="row">
												  <c:if test="${user.sex eq 0}"></c:if>
												  <c:if test="${user.sex eq 1}"><span class="sex man"></span></c:if>
												  <c:if test="${user.sex eq 2}"><span class="sex woman"></span></c:if>
                                                  <div class="name">
                                                      <a href="#"><b>${user.username }</b></a>
                                                  </div>
                                              </div>
                                              
                                              <div class="row">
                                                  <span class="sex xin"></span>
                                                  <div class="name">
													${user.nowZoneName }
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="friend">
                                          <div class="moreItembox">
                                              <a href="javascript:void(0);" id="psfFriend_1"><b>${user.togFriendCount }</b>个共同好友</a>
												<div class="sns_dialog moreItem" id="togfriend">
                                                  <div class="dialog_skin">
                                                      <div class="layerBox">
                                                          <ul>
																<li><a href="#">test</a></li>
                                                          </ul>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      
                                      <div class="buttons">

										  <c:choose>
										  	<c:when test="${user.isfriend}">
										  		<a href="javascript:void(0);" class="okbtn" onclick=""><em></em>好友</a>
										  	</c:when>
											<c:otherwise>
												<a href="javascript:void(0);" class="addbtn02 addbtn02_ok" onclick="openAskForFriendDialog('${user.uid }','${user.username }');"><em></em>好友</a>
											</c:otherwise>
										  </c:choose>  
 
										  <c:choose>
										  	<c:when test="${user.isfollow}">
												<a href="javascript:delFollow(${user.uid},delFollowHandle4);" class="okbtn" id="psf_friend_del_follow_${user.uid }" name="addfollow"><em></em>关注</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:addFollow(${user.uid},addFollowHandle4);" class="addbtn02 addbtn02_ok" id="psf_friend_add_follow_${user.uid }" name="addfollow"><em></em>关注</a>
											</c:otherwise>
										  </c:choose>

                                      </div>
                                  </div>
                              </div>
                          </td>
                          <td class="m_r"> </td>
                      </tr>
                      
                      <tr>
                          <td class="b_l"> </td>
                          <td class="b_m">
                              <em></em>
                              <b></b>
                              <div></div>
                          </td>
                          <td class="b_r"> </td>
                      </tr>
                  </tbody></table>
                  <div class="shadow"></div>
              </div>
          	</li>
		</c:forEach>
          	
      </ul>
	</div>
</div>
</c:forEach>

<script type="text/javascript">
initPsfTypes();
</script>

	<c:if test="${pageCount > 1}">
		<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/friend/introduce?page=#page#"></psf:page>
	</c:if>
