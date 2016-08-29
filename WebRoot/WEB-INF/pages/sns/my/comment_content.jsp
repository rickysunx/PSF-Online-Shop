<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function setTab(name,cursel,n){
		for(i=1;i<=n;i++){
			var menu=document.getElementById(name+i);
			var con=document.getElementById("con_"+name+"_"+i);
			menu.className=i==cursel?"hover":"";
			con.style.display=i==cursel?"block":"none";
		}
	}

</script>

<div class="mypage_main left">
    	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">我的品论</font> </span> </div>
             <div class="right pagesearch">
                <form method="post" action="/sns/my/comment">
					<c:choose>
						<c:when test="${empty keyword}"> <input type="text" id="keyword" name="keyword" class="left pagesearch_text" onclick="this.value=''" value="好友昵称、评论内容..." /></c:when>
						<c:otherwise> <input type="text" id="keyword" name="keyword" class="left pagesearch_text" onclick="this.value=''" value="${keyword }" /></c:otherwise>
					</c:choose>
					<input type="hidden" id="type" name="type" value="${type }" />
                    <input type="submit" class="pagesearch_btn right" value=""/>
                </form>
             </div>
            <div class="navbar"></div>
        	<div id="warning"><span class="left">尊敬的用户，如果您收到通过评论发布的加粉丝等广告，您可以<a href="#" target="_self" class="warning">点击这里举报</a>。</span><a href="#" onclick="warning_close();" class="right warning" >×</a></div>
         	<div class="navbar"></div>
        	
            <!--内容srart-->
            <div>
            		 <div id="lib_Tab1">
                     		<div class="lib_Menubox lib_tabborder">
                            <ul>
                            <li id="one1" onclick="changeList(1,'${keyword}')">全部</li>
                            <li id="one2" onclick="changeList(2,'${keyword}')" >我的好友</li>
                            <li id="one3" onclick="changeList(3,'${keyword}')">我的关注</li>
                            <li id="one4" onclick="changeList(4,'${keyword}')">我的粉丝</li>
                            <li id="one5" onclick="changeList(5,'${keyword}')">我的圈子</li>
                            </ul>
                        </div>
                         <div class="lib_Contentbox lib_tabborder">  
                          <div id="con_one_1" >
                          	<ul class="usernews">
								 
                            	
                          	<c:forEach items="${commentList}" var="comment">
                                 <li id="comment_${comment.commentid }" class="usernewsitem">
                                 <!--信息容器start-->
                                 		<div class="pagenews_pic">
                                       		<img src="/pic/${comment.avatarFileName }" alt="userphoto" />
                                        </div>
                                        <div class="pagenews_main ">
                                                <div class="invite_title left">
                                                	<p><a href="#" target="_self" class="mypage_title">${comment.username }:</a>${comment.content }</p>
													<p><span class="mypage_alt">评论：</span><a href="/post/${comment.oid }">${comment.commentInfo }</a></p>
                                                </div>
                                                <div class=" right mypage_alt">
                                                	${comment.chnTime }
                                                </div>
                                               <div class="navbar"></div>
                                               <div class="newsList">
                                                   <div  class="bubbleOperating">
													<c:choose>
														<c:when test="${sessionID eq comment.touid}"><a href="javascript:delMyComment(${comment.commentid });" class="none">删除</a></c:when>
														<c:otherwise>
															<a href="javascript:delMyComment(${comment.commentid });">删除</a>
															<a href="javascript:addBlacklist(${ comment.touid},'${comment.username }');" class="none">加入黑名单</a>
														</c:otherwise>
													</c:choose>

													</div>
                                                </div>
												
								 <div class="clear"></div>
                                 <!--信息容器end-->			
                                </li>
							</c:forEach>
						<c:if test="${pageCount > 1}">
							<psf:page pageCount="${pageCount}" page="${curPage}" action="changePage(${type},#page#,'${keyword }');" href="" ></psf:page>
						</c:if>	
                            </ul>

												
                          
					</div>


     

   
                         </div>
                     </div>
            </div>
            <!--内容end-->
   	 </div>
