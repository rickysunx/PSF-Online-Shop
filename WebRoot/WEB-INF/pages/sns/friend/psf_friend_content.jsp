<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="piclist">
<ul>
  <c:forEach items="${psfFriends.list}" var="psfFriend">
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
                                <div class="img">
                                    <a href="#"><img alt="" src="/pic/${psfFriend.avatarFileName }"></a>
                                </div>
                                <div class="name_card">
                                    <div class="namebox">
                                        <div class="row">
                                            <c:if test="${psfFriend.sex eq 0}"></c:if>
                                            <c:if test="${psfFriend.sex eq 1}"><span class="sex man"></span></c:if>
                                            <c:if test="${psfFriend.sex eq 2}"><span class="sex woman"></span></c:if>
                                            <div class="name">
                                                <a href="#"><b>${psfFriend.username }</b></a>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <span class="sex xin"></span>
                                            <div class="name">
                                                ${psfFriend.zonename }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="friend">
                                    <a href="javascript:void(0);" id="psfFriend_${psfFriend.friendid }"><b>${psfFriend.togfriendcount}</b>个共同好友</a>
                                          
                                    <script type="text/javascript">
                                          function initPsfFriendList(){
                                              $("#psfFriend_${psfFriend.friendid}").psfMenu({
                                                  pos:"below",
                                                  items:[
                                                       <c:forEach items="${psfFriend.users}" var="user">
                                                      {"name":"${user.username}","handler":"#"},
                                                      </c:forEach>
                                                      {"name":"","handler":""}
                                                  ]
                                              });
                                          }
                                          initPsfFriendList()
                                    </script>
                                    
                                    <!--
                                    <div class="sns_dialog moreItem" id="togfriend">
                                        <div class="dialog_skin">
                                            <div class="layerBox">
                                                <ul>
                                                  <c:forEach items="${psfFriend.users}" var="user">
                                                      <li><a href="#">${user.username }</a></li>
                                                  </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    -->
                                        
                                </div>
                                
                                <div class="buttons">
                                    <a href="javascript:void(0);" class="addbtn02 addbtn02_ok" onclick="openAskForFriendDialog('${psfFriend.friendid }','${psfFriend.username }',this);"><em></em>好友</a>
                                    <c:choose>
                                      <c:when test="${psfFriend.isfollow}">
                                  
                                          <a href="javascript:delFollow(${psfFriend.friendid},delFollowHandle4);" class="okbtn" id="psf_friend_del_follow_${psfFriend.friendid }" name="addfollow">
                                              <em></em>关注
                                          </a>
                                      </c:when>
                                      <c:otherwise>
                                          <a href="javascript:addFollow(${psfFriend.friendid},addFollowHandle4);" class="addbtn02 addbtn02_ok" id="psf_friend_add_follow_${psfFriend.friendid }" name="addfollow">
                                              <em></em>关注
                                          </a>
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
<c:if test="${psfFriends.pageCount > 1}">
<psf:page pageCount="${pageCount}" page="${curPage}" action="javascript:loadPsfFriendList(${type},#page#);"></psf:page>
</c:if>
<script type="text/javascript">
initPsfTypes();
</script>
</div>
