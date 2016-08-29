<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="mypage_main left">
    	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">

系统通知</font> </span> <span class="mypage_alt"> 您有<label>${msgAutoCount }</label>条系统通知

</span></div>
             <div class="right pagesearch">
                <form method="post" action="/sns/my/notice">
                    <input type="text" class="left pagesearch_text" id="keyword" name="keyword" onclick="this.value=''" value="信件内容" />
                    <input type="submit" class="pagesearch_btn right" value=""/>
                </form>
             </div>
         	<div class="navbar"></div>
        	
            <!--内容srart-->
            <div>
            		 <div id="lib_Tab1">
							<!--  
                     		<div class="lib_Menubox lib_tabborder">
	                            <ul>
	                            <li id="one1" onclick="setTab('one',1,2)" class="hover">展开全部</li>
	                            <li id="one2" onclick="setTab('one',2,2)" >全部收起</li>
	                            </ul>
                        	</div>
                        	-->
                         <div class="lib_Contentbox lib_tabborder">  
                          <div id="con_one_1" >
                          	<ul class="usernews">

							<c:forEach items="${msgAutoList}" var="msg">
                             <li class="usernewsitem">
                                <!--信息容器start-->
                                 		<div class="pagenews_pic">
                                        <img src="/images/sns/my/userphoto.gif" alt="userphoto" />
                                        </div>
                                        <div class="pagenews_main ">
                                                <div class="left">
                                                	<p><a href="#" target="_self" class="mypage_title">系统管理员通知：</a></p>                                                	
                                                </div>
                                                <div class=" right mypage_alt">${msg.time }</div>
                                                <div class="navbar"></div>
                                                <div class="bubbletop"></div>
                                                <div class="bubblemiddle">${msg.msgcontent }</div>
                                                <div class="bubblebottom"></div>
                                                
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
                             <div id="con_one_2" style="display:none;" >2</div>
                         </div></div></div></div>