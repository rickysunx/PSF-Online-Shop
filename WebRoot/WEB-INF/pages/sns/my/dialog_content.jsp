<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">

</script>


<psf:include page="/sns/components/smiley.jsp"/>
<div class="mypage_main">
	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">我与<b>${username }</b>的对话</font> </span> <span class="mypage_alt"> 您有<label>${count }</label>条</span></div>
	<div class="right pagesearch">
                <form method="post">
					<c:choose>
						<c:when test="${empty keyword}"> <input type="text" id="detail_keyword" class="left pagesearch_text" onclick="this.value=''" value="信件内容" /></c:when>
						<c:otherwise> <input type="text" id="detail_keyword" class="left pagesearch_text" onclick="this.value=''" value="${keyword }" /></c:otherwise>
					</c:choose>
                   
                    <input type="button" class="pagesearch_btn right" onclick="searchDetailMsg(${touid})" />
                </form>
             </div>
     <div class="navbar"></div>
     <p><a href="/sns/my/msg" class="left">返回所有私信 &gt; &gt;</a><input type="button" value="批量删除" class="right blockDel" onclick="delMsgByUid(${touid},2);"></p>
     <div class="navbar"></div>

			 <script language="javascript">  
                  function countChar(textareaName,spanName)
                  {  
                   document.getElementById(spanName).innerHTML =200 - document.getElementById(textareaName).value.length;
                  }  
                  window.onload = function() 
                  { 
                  document.getElementById('status').onkeydown = function() 
                  {    
                      if(this.value.length >= 198) 
                        event.returnValue = false; 
                  } 
                  } 

              </script>

	    <form id="sendMsgToTa">
		<div class="sennewsBox">
               <div style="width:472px; float:left;">
                       <div class="sendlabe left">发私信给" <span>${username }</span> "</div>
					   <input type="hidden" id="msgtouid" name="msgtouid" value="${touid }"/> 
                       <div class="textnumber right">您还可以再输入<span id="counter">200</span>个文字...</div>
                      	<div class="navbar"></div>
                       <div class="textbox"><textarea id="status"  name="content" psftype="status" style="border:0px;overflow-x:hidden;overflow-y:hidden; width:450px; font-size:12px;"   rows="3" onkeydown='countChar("status","counter");' onkeyup='countChar("status","counter");'></textarea></div>
                            <div class="write">
                            	<div class="icon iconface"><a href="javascript:void(0)" psftype="smileybutton">表情</a></div>
                                <div class="icon iconimg"><a href="javascript:void(0)" psftype="uploadimgbutton">图片</a></div>
                                <input type="button"  value="发 表" class="sendbtn" onclick="sendMsg();"/>
                            </div>
               </div>
                        <div class="userphoto"><img src="/pic/${myAvatarFileName }" alt="userphoto" /></div>
                </div>
			</form>
			<c:forEach items="${msgs}" var="msg">
				<c:if test="${msg.msgType eq 0}">
                      <div class="dialogueFriend" style="height: auto;" id="msgDetailFromFriend_${msg.msgid }">
                      	<div class="left"><img style="width: 30px;" src="/pic/${msg.avatarFileName }" alt="admin" /></div>
                        <div class="right" style="width:425px;">
                        	<div class="dialogueFriend_top"></div>
                            <div class="dialogueFriend_miiddle">
                            	<div class="dialogContent">${msg.msgcontent }</div>
								<div class="imglist">
									<c:forEach var="pic" items="${msg.picList}">
										<a id="${pic.picid}" href="javascript:void(0)"><img src='/pic/${pic.picid}.jpg' style="width:50px;height: 50px"/></a>
									</c:forEach>
								</div>
                                <div class="mypage_alt">
                                <span class="left">来自：<a href="#">${msg.username }</a> ${msg.time }</span>
                                <span class="right"><a href="javascript:replyMsg(${msg.uid },1);"><img src="/images/sns/my/replyicon.gif" alt="回复他/她" style="margin-top:4px;" /> </a> <a href="javascript:delMsgByMsgid(${msg.msgid },1,${msg.uid },2);"><img src="/images/sns/my/delicon.gif" alt="删除" style="margin-top:4px;" /> </a></span>
                                </div>
                                <div class="clear"></div>
                                </div>
                                <div class="dialogueFriend_bottom"></div>
                       </div>
                      </div>
				</c:if>
				
				<c:if test="${msg.msgType eq 1}">
                <div class="dialogueSelf" style="height:auto;" id="msgDetailFromMyself_${msg.msgid }">
                	<div class="left" style="width:425px; ">
                    <div class="dialogueSelf_top"></div>
                    <div class="dialogueSelf_middle">
                    	<div class="dialogContent">${msg.msgcontent }</div>
						<div class="imglist">
							<c:forEach var="pic" items="${msg.picList}">
								<a id="${pic.picid}" href="javascript:void(0)"><img src='/pic/${pic.picid}.jpg' style="width:50px;height: 50px"/></a>
							</c:forEach>
						</div>	
                        <div class="mypage_alt">
                        	<span class="left">来自：我 ${msg.time }</span>
                            <span class="right"><a href="javascript:delMsgByMsgid(${msg.msgid },2,${msg.uid},2);"><img src="/images/sns/my/delicon.gif" alt="删除" style="margin-top:4px;" /> </a> </span>
                        </div>
                        <div class="clear"></div>
                   </div>
                                                      
                   <div class="dialogueSelf_bottom"></div>
                   </div>
                   <div class="right"><img style="width: 30px;" src="/pic/${msg.avatarFileName }" alt="admin" /></div>
               </div>
			   </c:if>


		  </c:forEach>


	<c:if test="${pageCount > 1}">
			<psf:page pageCount="${pageCount}" page="${curPage}" action="changeDetailPage(${touid},#page#,'${keyword }')"  href=""></psf:page>
		</c:if>	
			</div>



<div id="dialog_uploadimg" class="dialog_uploadimg dialogtitle" style="display:none">
	<dl class="tab03">
		<dd>
			<ul>
				<li class="current"><a href="javascript:void(0)">本地上传</a></li>
				<li class=""><a href="javascript:void(0)">链接</a></li>
			</ul>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<div class="uploadimg_item">
		<p>按住Ctrl 键一次选中上传多张图片（最多5张）</p>
		<div class="blogUploadImgList s_clear" id="blog_image_upload_list">
		<%--
			<a class="addbor addbor_small" href="javascript:void(0)">
				<em></em>
			</a>
			<span>点击添加第1张图片</span>
		 --%>
			<div id="blog_image_upload_swf_div"><div id='blog_image_upload_swf_div1'></div></div>
		</div>
		<div class="bottom s_clear">
			<a class="button11" href="javascript:void(0)" onclick="blog_image_Ok();">确定</a>
			<a class="button11" href="javascript:void(0)" onclick="blog_image_Cancel();">取消</a>
		</div>
	</div>
	<div class="uploadvideo_item" style="display: none">
		<p>粘贴图片地址</p>
		<div class="uploadvideo_item_border">
		<input type="text" />
		<a class="button11" href="javascript:void(0)">确定</a>
		</div>
		
	</div>
</div>
	
			
                                                                 