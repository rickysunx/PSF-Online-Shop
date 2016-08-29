<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="mypage_main left">
    	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">提到我的品论</font> </span> <span class="mypage_alt"> 您有<label>${userListCount }</label>条</span></div>
             <div class="right pagesearch">
                <form method="post" action="/sns/my/about">
					<c:choose>
						<c:when test="${empty keyword}"><input type="text" id="keyword" name="keyword" class="left pagesearch_text" onclick="this.value=''" value="好友昵称、评论内容..." /></c:when>
						<c:otherwise> <input type="text" id="keyword" name="keyword" class="left pagesearch_text" onclick="this.value=''" value="${keyword }" /></c:otherwise>
					</c:choose>
                   
                    <input type="submit" class="pagesearch_btn right" value=""/>
                </form>
             </div>
         	<div class="navbar"></div>
        	<div id="warning"><span class="left">尊敬的用户，如果您收到通过评论发布的加粉丝等广告，您可以<a href="#" target="_self" class="warning">点击这里举报</a>。</span><a href="#" onclick="warning_close();" class="right warning" >×</a></div>
            <div class="navbar"></div>
            <!--内容srart-->
            <div>
                         <div class="lib_Contentbox lib_tabborder">  
                          <div id="con_one_1" >
                          	<ul class="usernews">
								 
                           <c:forEach items="${userList}" var="user">
                             <li class="usernewsitem">
                                 <!--信息容器start-->
                                 		<div class="pagenews_pic">
                                        <img src="/pic/${user.avatarFileName }" alt="userphoto" />
                                        </div>
                                        <div class="pagenews_main ">
                                                <div class="invite_title left">
                                                	<p><a href="#" target="_self" class="mypage_title">${user.username }</a><a href="#">[修改备注]</a>在<a href="#">${user.aboutInfo }</a>中提到了您，快<a href="/post/${user.oid }" target="_blank">去看看</a></p>
                                                	<p>
														<span>
														<c:if test="${user.sex eq 0}"></c:if>
														<c:if test="${user.sex eq 1}">男</c:if>
														<c:if test="${user.sex eq 2}">女</c:if>
														</span>
														<span>${user.nowZoneName }</span></p>
                                                	<p>关注:(<span>${user.follows }</span>)&nbsp;好友：(<span>${user.friends }</span>)&nbsp;圈子(<span>${user.groups }</span>)&nbsp;发表:(<span>${user.pubs }</span>)</p>
                                                </div>
                                                <div class="right mypage_alt">
                                                	${user.chnTime }
                                                </div>
                                                     
										</div>
								 <div class="clear"></div>
                                 <!--信息容器end-->			
                                </li>
                   
                            </c:forEach> 	  
              
                            </ul>

						<c:if test="${pageCount > 1}">
							<psf:page pageCount="${pageCount}" page="${curPage}" action="changePage('${keyword}',#page#)"  href=""></psf:page>
						</c:if>	

                          </div>
                            
                         </div>
                     </div>
            </div>
            <!--内容end-->

