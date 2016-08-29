<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>我的私信</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script src="/js/common/CJL.0.1.min.js" type="text/javascript"></script>
	<script src="/js/common/ImageTrans.js" type="text/javascript"></script>
	<script src="/js/swfupload.js" type="text/javascript"></script>
<script src="/js/sns/friend.js" type="text/javascript"></script>

<script type="text/javascript">

function initImageSwfUpload() {

	$("#blog_image_upload_swf_div").html("<div id='blog_image_upload_swf_div1'>正在加载上传工具……</div>");
	
	var blogImageSwfUploadSetting = {
		flash_url : "/js/swfupload.swf",
		upload_url: "/action/upload_pic?uid=${loginPsfUid}&type=21",
		file_size_limit : "10MB",
		file_types : "*.jpg;*.gif;*.png;*.bmp",
		file_types_description : "图片文件",
		file_upload_limit : 100,
		file_queue_limit : 0,
		debug: false,
		button_action:SWFUpload.BUTTON_ACTION.SELECT_FILES,

		// Button settings
		button_image_url: "/images/blog_image_upload.gif",
		button_width: "370",
		button_height: "110",
		button_placeholder_id: "blog_image_upload_swf_div1",
		button_cursor : SWFUpload.CURSOR.HAND,
		button_text : "<span class='info'>点击添加第"+$("#blog_image_upload_list").children().length+"张图片</span>",
		button_text_style : ".info{font-size:14px;}",
		button_text_left_padding : 150,
		button_text_top_padding : 45,
		
		swfUploadLoaded:blog_image_onSwfLoaded,
		file_queued_handler : blog_image_onPicSelected,
		file_dialog_complete_handler : blog_image_onFileDialogComplete,
		upload_progress_handler : blog_image_onPicUploadProgress,
		upload_error_handler : blog_image_onPicUploadError,
		upload_success_handler : blog_image_onPicUploadSuccess,
		upload_complete_handler : blog_image_onPicUploadComplete
	};
	
	blog_image_swf_uploader = new SWFUpload(blogImageSwfUploadSetting);
	
}
	$(function(){
		$(".newscontent").hide(); 
		$('.openlist').toggle(function(){
			$(this).text('关闭对话').parent().nextAll('.newscontent').slideDown(100);
		},function(){
			$(this).text('展开对话').parent().nextAll('.newscontent').slideUp(100);
		});
	});

	function warning_close(){
	    var  target=document.getElementById("warning");
	    target.style.display="none";
	}
	function setTab(name,cursel,n){
		for(i=1;i<=n;i++){
			var menu=document.getElementById(name+i);
			var con=document.getElementById("con_"+name+"_"+i);
			menu.className=i==cursel?"hover":"";
			con.style.display=i==cursel?"block":"none";
		 }
	}

	function saveAddMsg(msgid){
		$.post(
			"/action/sns/send_msg",$("#saveAddMsgForm_"+msgid).serialize(),
			function(data) {
				if(data.success == 1){
					$("textarea[name='content']").val('');
					$.psfInfoDialog("发送成功",2000);	
					window.location.reload();
				} else {
					$.psfInfoDialog("发送失败:"+data.info,2000);
				}
			},"json"
		);
	}
	function readMsg(uid){
		$.post(
			"/action/sns/read_msg","uid="+uid,
			function(data) {
				if(data.success == 1){
					$("#msgReadFlag_"+uid).attr("style","display:none");
				}
			},"json"
		);
	}

	function replyMsg(uid,type) {
		if(type == 1){
			$("textarea[psftype='status_"+uid+"']").focus();
		} else {
			$("#dialogList_"+uid).show();
			$("textarea[psftype='status_"+uid+"']").focus();	
			if(	$("#dialogCount_"+uid).text() != '关闭对话'){
				$("#dialogCount_"+uid).text('关闭对话');
				$("#dialogCount_"+uid).attr("onclick","changeState("+uid+")");
			}		
		}		
	}
	function changeState(uid){
		if($("#dialogCount_"+uid).text() == '关闭对话') {
			$("#dialogList_"+uid).hide();
			$("#dialogCount_"+uid).text('展开对话');
		} else {
			$("#dialogList_"+uid).show();
			$("#dialogCount_"+uid).text('关闭对话');
		}
	}
	function searchMsg(){
		var content = $("#msgKeyword").val();
		alert(content);
	}

	var id = 0;
	function getUid(uid){
		id = uid;
	}
	$(document).ready(function(){

	//	$("#dialog_psfsmiley .tab03 li").psfTab($("#dialog_psfsmiley .smiley_items,#dialog_psfsmiley .normal_smiley_items"));
	//	$("#dialog_uploadimg .tab03 li").psfTab($("#dialog_uploadimg .uploadimg_item,#dialog_uploadimg .uploadvideo_item"));
			
		$("a[psftype='smileybutton']").psfSmiley({
			target:function(e){
			$("textarea[psftype='status_"+id+"']").val($("textarea[psftype='status_"+id+"']").val()+e);
			},
			init:function(){
				$("#dialog_psfsmiley,#dialog_uploadimg").find(".tab03 .layerClose .close").unbind("click");
			}
		});

		$("a[psftype='uploadimgbutton']").click(function(){
			$("#blog_image_upload_swf_div0").appendTo("#blog_image_upload_swf_div");
			
			$("#dialog_psfsmiley,#dialog_uploadimg").psfDialogClose();
			$("#dialog_psfsmiley,#dialog_uploadimg").find(".tab03 .layerClose .close").unbind("click");
			
			$("#blog_image_upload_swf_div").html("<div id='blog_image_upload_swf_div1'>正在加载上传工具……</div>");
			
			$("#dialog_uploadimg").psfDialog({
				top:$(this).position().top+this.offsetHeight,
				left:$(this).position().left,
				width:396,
				openAnimate:100,
				arrow:true,
				arrowdirection:"top",
				arrowstyle:"1",
				arrowpos:20
			});
			
			
			setTimeout("initImageSwfUpload();", 500);
			
			$("#dialog_uploadimg .tab03 .layerClose .close").click(function(){
				$("#dialog_uploadimg").psfDialogClose();
				$(this).unbind("click");
			});
		});


		$("#sendNewMsgSmaily").psfSmiley({
			target:function(e,m){
			$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
			},
			init:function(){
			}
		});
		
	});	

	$(document).ready(function(){
		$("#dialog_uploadimg .tab03 li").psfTab($("#psfsmiley .smiley_items,#psfsmiley .normal_smiley_items"));
		
	});

	function showDetailMsg(uid){
		window.location.href = "/sns/my/dialog?touid="+uid;
	}

	function openSentMsg(){
		$("#SentMsg").psfDialog({"modal":true,"center":true});
	}
	$(document).ready(function(){
		$("#SentMsg .layerClose .close").click(function(){
			$("#SentMsg").psfDialogClose();
		});
		$("#updateBankAccount .layerClose .close").click(function(){
			$("#updateBankAccount").psfDialogClose();
		});
	});
	function sendNewMsg(){
		var newName = $("#sendNewName").val();
		var newContent = $("#newMsgContent").val();
		if(newName.length == 0 || newName == ''){
			$.psfInfoDialog("填写发信人",2000);
		} else if(newContent.length == 0 || newContent == ''){
			$.psfInfoDialog("填写发信内容",2000);
		} else {
			$.post(
				"/action/sns/send_new_msg",$("#sendNewMsg").serialize(),
				function(data){
					if(data.success == 1){
						$.psfInfoDialog("发送成功",2000);
						$("#SentMsg").psfDialogClose();
					} else {
						$.psfInfoDialog(data.info,2000);
					}
				},"json"
			);
		}
		
	}
</script>

</head>

<body>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="index"/>
<psf:include page="/sns/components/smiley.jsp"/>

<div id="sns_main" class="snsrbox s_clear">
	<div id="sns_left">
			<psf:include page="/sns/my/msg_content.jsp"/>
			<div class="mypage_main">
    	<div class="left" style="margin-top:10px;"><span class="mypage_title"><font size="3">我的私信</font> </span> <span class="mypage_alt"> 您有<label id="userCount">${userCount }</label>个联系人</span></div>
            <input type="button" class="sendMes left" value="发私信" onclick="openSentMsg();"/> 

			<div class="right pagesearch">
                <form method="post">
                    <input type="text" id="msgKeyword" class="left pagesearch_text" onclick="this.value=''" value="好友昵称、姓名、评论内容..." />
                    <input type="button" class="pagesearch_btn right" onclick="searchMsg()"/>
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
							<c:forEach items="${msgList}" var="msg">
                            	<li id="msgInfo_${msg.uid }" class="usernewsitem">
                                 <!--信息容器start-->
                                 		<div class="pagenews_pic">
                                        <img src="/pic/${msg.avatarFileName }" alt="userphoto" />
										<span id="msgReadFlag_${msg.uid }"><c:if test="${msg.newCount != 0}"><div class="userNewnumber" >${msg.newCount }</div></c:if></span>
                                        </div>
                                        <div class="pagenews_main ">
                                                <span class="left">
												
													<c:if test="${msg.msgType eq 0}"><a href="#" target="_self" class="mypage_title">${msg.username } </a>给您发来一封私信</c:if>
													<c:if test="${msg.msgType eq 1}">您发给<a href="#" target="_self" class="mypage_title">${msg.username }</a>一封私信</c:if>
												
												</span>
                                                <span class=" right mypage_alt">来自：<label>${msg.time }</label> <a href="javascript:delMsgByUid(${msg.uid },1);">删除</a></span>
                                                <div style="clear:both;">
                                                <div class="bubbletop"></div>
                                                <div class="bubblemiddle">${msg.msgcontent }</div>
                                                <div class="bubblebottom"></div>
                                                </div>

                                               		  <div class="newsList">
                                                            <div  class="bubbleOperating"><a class="openlist" id="dialogCount_${msg.uid }" href="javascript:readMsg(${msg.uid});">共<label>${msg.allCount }</label>条对话</a><a href="javascript:void(0)" onclick="showDetailMsg(${msg.uid})">所有对话</a><a href="javascript:void(0);" onclick="openTransmitDialog(${ msg.msgid},'${msg.username}');">转发</a><a href="javascript:replyMsg(${msg.uid },2);" class="none">回复</a></div>
                                                            <div class="newscontent"  id="dialogList_${msg.uid }">
                                                            <form method="post" id="saveAddMsgForm_${msg.msgid }">
																<input type="hidden" id="msgtouid" name="msgtouid" value="${msg.uid }"/>
                                                            	<div class="sennewsBox">
                                                                    <div style="width:472px;float:left;">
                                                                            <div class="sendlabe left">发私信给" <span>${msg.username }</span> "</div>
                                                                            <div class="textnumber right">您还可以再输入<span id="counter">200</span>个文字...</div>
                                                                           
                                                                            <div class="textbox"><textarea id="status"  name="content" psftype="status_${msg.uid}" style="border:0px;overflow-x:hidden;overflow-y:hidden; width:450px; font-size:12px;"   rows="3" onkeydown='countChar("status","counter");' onkeyup='countChar("status","counter");'></textarea></div>
                                                                            <div class="write">
                                                                            	<div class="icon iconface"><a id="${msg.uid }" psftype="smileybutton"  href="javascript:getUid(${msg.uid });">表情</a></div>
                                                                                <div class="icon iconimg"><a href="javascript:getUid(${msg.uid });" psftype="uploadimgbutton" id="${msg.uid }">图片</a></div>
                                                                                <input type="button"  value="发 表" class="sendbtn" onclick="saveAddMsg(${msg.msgid})"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="userphoto"><img src="/pic/${msg.avatarFileName }" alt="userphoto" /></div>
                                                                </div>
                                                               </form>
													<c:forEach items="${msg.detailMsgList}" var="dialog">
                                                                <!--对话列表start-->
																<div id="msgDialog_${msg.uid }">
													<c:if test="${dialog.msgType eq 0}">
                                                                 <div class="dialogueFriend" style="height: auto;" id="friendMsg_${dialog.msgid }">
                                                                 		<div class="left"><img style="width: 30px;" src="/pic/${dialog.avatarFileName }" alt="admin" /></div>
                                                                        <div class="right" style="width:425px;">
                                                                        	<div class="dialogueFriend_top"></div>
                                                                            <div class="dialogueFriend_miiddle">
                                                                            <div class="dialogContent">${dialog.msgcontent }</div>
																			<div class="imglist">
																				<c:forEach var="pic" items="${dialog.picList}">
																					<a id="${pic.picid}" href="javascript:void(0)"><img src='/pic/${pic.picid}.jpg' style="width:50px;height: 50px"/></a>
																				</c:forEach>
																			</div>
                                                                            <div class="mypage_alt">
                                                                            <span class="left">来自：<a href="#">${dialog.username }</a> ${dialog.time }</span>
                                                                            <span class="right"><a href="javascript:replyMsg(${msg.uid },1);"><img src="/images/sns/my/replyicon.gif" alt="回复他/她" style="margin-top:4px;" /> </a> <a href="javascript:delMsgByMsgid(${dialog.msgid },1,${msg.uid },1);"><img src="/images/sns/my/delicon.gif" alt="删除" style="margin-top:4px;" /> </a></span>
                                                                            </div>
                                                                            <div class="clear"></div>
                                                                            </div>
                                                                            <div class="dialogueFriend_bottom"></div>
                                                                            
                                                                        </div>
                                                                 </div>
                                                                 <div class="clear" id="friendMsgClear_${dialog.msgid }"></div>
													</c:if>
                                                                  <!--对话列表第一条，每条以“<div class="clear"></div>”结尾-->
													<c:if test="${dialog.msgType eq 1}">
                                                                 <div class="dialogueSelf" style="height:auto;" id="selfMsg_${dialog.msgid }">
                                                                 	<div class="left" style="width:425px; ">
                                                                    	<div class="dialogueSelf_top"></div>
                                                                        <div class="dialogueSelf_middle">
                                                                       <div class="dialogContent">${dialog.msgcontent }</div>
																		<div class="imglist">
																			<c:forEach var="pic" items="${dialog.picList}">
																				<a id="${pic.picid}" href="javascript:void(0)"><img src='/pic/${pic.picid}.jpg' style="width:50px;height: 50px"/></a>
																			</c:forEach>
																		</div>	
                                                                       <div class="mypage_alt">
                                                                            <span class="left">来自：我 ${dialog.time }</span>
                                                                            <span class="right"><a href="javascript:delMsgByMsgid(${dialog.msgid },2,${msg.uid },1);"><img src="/images/sns/my/delicon.gif" alt="删除" style="margin-top:4px;" /> </a> </span>
                                                                            </div>
                                                                       <div class="clear"></div>
                                                                        </div>
                                                                        
                                                                        <div class="dialogueSelf_bottom"></div>
                                                                    </div>
                                                                    <div class="right"><img style="width: 30px;" src="/pic/${dialog.nowavatarFileName }" alt="admin" /></div>
                                                                 </div>
                                                                 <div class="clear" id="selfMsgClear_${dialog.msgid }"></div>
														
													</c:if>
												</div>
                                            </c:forEach>          
                                                                 <!--对话列表end-->
                                                            </div>
                                                           
                                                        </div>
                      
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
		<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/my/msg?page=#page#"></psf:page>
	</c:if>

   	 </div>
	</div>	

	<div id="sns_right">
		<psf:include page="/sns/my/my_right.jsp"/>
	 
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
</div>
<psf:tail/>
</div>



<!-- 发信 -->
            <div id="SentMsg" style="width:433px;height:188px;display: none">          
        	<div class="titileBar">
            <span style="float:left;"><b>发私信</b></span>	
            <div class="layerClose">
				<a class="close" style=" width:10px; float:right;cursor: pointer;">x</a>
				</div></div>
				<form id="sendNewMsg">
               		<dl class="sentMsg">
	                	<dd><span>发给：</span><input type="text" id="sendNewName" name="sendNewName" value="好友昵称" class="sentName" onclick="this.value=''"/></dd>
	                    <dd><span>内容：</span><textarea style="overflow-y:hidden;" class="sentTxt" id="newMsgContent" name="newMsgContent"></textarea></dd>
	                    <dd style="height:20px; clear:both;"></dd>
	                    <dd>
							<span>
								<a id="sendNewMsgSmaily" href="javascript:void(0);">表情</a>
							</span>
							<input type="button"  value="发送" class="senBtn" onclick="sendNewMsg();"/>
						</dd>			
                	</dl>
				</form>
             		<div class="layerClose">
				<a class="close" style="margin-top: 5px; right: 3px; cursor: pointer;"></a>
				</div>
             </div>

<script type="text/javascript">
initPsfTypes();
</script>
</body>
</html>