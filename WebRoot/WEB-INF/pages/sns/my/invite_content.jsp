<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script src="/js/userselect.js" type="text/javascript"></script>
<script type="text/javascript">
	function checkApply(applyid,fromuid,type,checkstatus){
		$.post(
			"/sns/apply/check_apply","applyid="+applyid+"&fromuid="+fromuid+"&type="+type+"&checkstatus="+checkstatus,
			function(data){
				if(data.success == 1){
					$.psfInfoDialog("操作成功",2000);
					$("#applyinfo_"+applyid).remove();
				} else {
					$.psfInfoDialog(data.info,2000);
				}
			},"json"
		);
	}
	function searchInvite(){
		var keyword = encodeURI(encodeURI($("#invite_keyword").val()));
		window.location.href = "/sns/my/invite?keyword="+keyword;
	}
	function changeInvitePage(page,keyword){
		var keyword = encodeURI(encodeURI(keyword));
		window.location.href = "/sns/my/invite?keyword="+keyword+"&page="+page;
	}
</script>
<div class="mypage_main left">
    	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">我的邀请</font> </span> <span class="mypage_alt"> 您有<label>${count }</label>封邀请信</span></div>
             <div class="right pagesearch">
                <form method="post">
					<c:choose>
						<c:when test="${empty keyword}"> <input type="text" id="invite_keyword" name="invite_keyword" class="left pagesearch_text" onclick="this.value=''" value="按昵称搜索" /></c:when>
						<c:otherwise> <input type="text" id="invite_keyword" name="invite_keyword" class="left pagesearch_text" onclick="this.value=''" value="${keyword }" /></c:otherwise>
					</c:choose>
                    <input type="button" class="pagesearch_btn right" onclick="searchInvite()"/>
                </form>
             </div>
         	<div class="navbar"></div>
        	<div id="warning"><span class="left">尊敬的用户，如果您收到通过私信发布的加粉丝等广告，您可以<a href="#" target="_self" class="warning">点击这里举报</a>。</span><a href="#" onclick="warning_close();" class="right warning" >×</a></div>
            <div class="navbar"></div>
            <!--内容srart-->
            <div>
            		 <div id="lib_Tab1">
                         <div class="lib_Contentbox lib_tabborder">  
                          <div id="con_one_1" >
                          	<ul class="usernews">
								 
                            <c:forEach items="${applyList}" var="apply">
                             <li class="usernewsitem" id="applyinfo_${apply.applyid }">
                                 <!--信息容器start-->
                                 		<div class="pagenews_pic">
                                        <img src="/pic/${apply.avatarFileName }" alt="userphoto" />
                                        </div>
                                        <div class="pagenews_main ">
                                                <div class="invite_title left">
                                                	<p><a href="#" target="_self" class="mypage_title">${apply.username }</a>
														<c:if test="${apply.type eq 1}">邀请加你为好友</c:if>
														<c:if test="${apply.type eq 2}">邀请你关注Ta</c:if>
													</p>
                                                	<p><span>${apply.usersex}</span>&nbsp;<span>${apply.zonename }</span></p>
                                                	<p>关注:(<span>${apply.followCount }</span>)&nbsp;好友：(<span>${apply.friendCount }</span>)&nbsp;粉丝(<span>${apply.fansCount }</span>)&nbsp;发表:(<span>${apply.pubCount }</span>)</p>
                                                </div>
                                                <div class=" right" id="uboxstyle">
                                          			<a href="javascript:checkApply(${apply.applyid },${apply.fromuid },${apply.type },1);">同意</a> <a href="javascript:checkApply(${apply.applyid },${apply.fromuid },${apply.type },2);">拒绝</a>
                                                </div>
                                                <div style="clear:both;">
                                                <div class="bubbletop"></div>
                                                <div class="bubblemiddle">${apply.content }</div>
                                                <div class="bubblebottom"></div>
                                                </div>
                                                <div  class="bubbleOperating"><span class="mypage_alt">来自：${apply.chnAddtime }</span></div>
                                                        
										</div>
								 <div class="clear"></div>
                                 <!--信息容器end-->			
                                </li>
							</c:forEach>
                            </ul>
                          </div>
                         </div>
                     </div>
            </div>
            <!--内容end-->


	 <c:if test="${pageCount > 1}">
		<psf:page pageCount="${pageCount}" page="${curPage}" action="changeInvitePage(#page#,'${keyword}')" href=""></psf:page>
	</c:if>
   	 </div>

   	 
   