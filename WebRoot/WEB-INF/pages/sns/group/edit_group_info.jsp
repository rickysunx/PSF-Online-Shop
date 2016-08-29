<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>创建圈子</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script src="/js/sns/resize/crop.js" type="text/javascript"></script>
	<script src="/js/sns/resize/drag.js" type="text/javascript"></script>
	<script src="/js/sns/resize/resize.js" type="text/javascript"></script>
	<script src="/js/swfupload.js" type="text/javascript"></script>
	
	<style type="text/css">
	#rRightDown,#rLeftDown,#rLeftUp,#rRightUp,#rRight,#rLeft,#rUp,#rDown{
		position:absolute;
		background:#FFF;
		border: 1px solid #333;
		width: 6px;
		height: 6px;
		z-index:500;
		font-size:0;
		opacity: 0.5;
		filter:alpha(opacity=50);
	}
	
	#rLeftDown,#rRightUp{cursor:ne-resize;}
	#rRightDown,#rLeftUp{cursor:nw-resize;}
	#rRight,#rLeft{cursor:e-resize;}
	#rUp,#rDown{cursor:n-resize;}
	
	#rLeftDown{left:-4px;bottom:-4px;}
	#rRightUp{right:-4px;top:-4px;}
	#rRightDown{right:-4px;bottom:-4px;background-color:#00F;}
	#rLeftUp{left:-4px;top:-4px;}
	#rRight{right:-4px;top:50%;margin-top:-4px;}
	#rLeft{left:-4px;top:50%;margin-top:-4px;}
	#rUp{top:-4px;left:50%;margin-left:-4px;}
	#rDown{bottom:-4px;left:50%;margin-left:-4px;}
	
	#bgDiv{width:200px; height:200px; border:1px solid #666666; position:relative;margin:0 auto;}
	#dragDiv{border:1px dashed #fff; width:180px; height:180px; top:10px; left:10px; cursor:move; }
	</style>
	
	<script type="text/javascript">
	function shift(tabid){
		if(tabid == 1){
			$("dl.tab03 dd ul li:eq("+(tabid-1)+")").addClass("current").siblings().removeClass("current");
			$("#groupinfo").removeClass("hide");
			$("#avatarinfo").addClass("hide");
		}else if(tabid == 2){
			var groupid = $("#groupid").val();
			if(groupid == undefined || groupid==''){
				$.psfInfoDialog("请保存圈子信息!");
				return false;
			}else{
				$("dl.tab03 dd ul li:eq("+(tabid-1)+")").addClass("current").siblings().removeClass("current");
				$("#groupinfo").addClass("hide");
				$("#avatarinfo").removeClass("hide");
			}
		}
	}
	
	//编辑头像js
	var currentFileObject = null;
	var avatar_upload = null;
	
	$(document).ready(function(){
		/*
		var ic = new ImgCropper("bgDiv", "dragDiv", 
			"http://images.cnblogs.com/cnblogs_com/cloudgamer/143727/r_xx2.jpg", {
			Width: 200, Height: 200, Color: "#000",
			Resize: true,
			Right: "rRight", Left: "rLeft", Up:	"rUp", Down: "rDown",
			RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
			Preview: "viewDiv", viewWidth: 120, viewHeight: 120});*/
		
		var avatar_upload_setting = {
			flash_url : "/js/swfupload.swf",
			upload_url: "/action/sns/upload_avatar?uid=${loginPsfUid}",
			file_size_limit : "10MB",
			file_types : "*.jpg;*.gif;*.png;*.bmp",
			file_types_description : "图片文件",
			file_upload_limit : 100,
			file_queue_limit : 0,
			debug: false,
			button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,
	
			// Button settings
			button_image_url: "/images/sns/default/avatar/avatar_upload.gif",
			button_width: "92",
			button_height: "30",
			button_placeholder_id: "avatarUploadButton",
			button_cursor : SWFUpload.CURSOR.HAND,
			
			file_queued_handler : onPicSelected,
			file_dialog_complete_handler : onFileDialogComplete,
			upload_progress_handler : onPicUploadProgress,
			upload_error_handler : onPicUploadError,
			upload_success_handler : onPicUploadSuccess,
			upload_complete_handler : onPicUploadComplete
		};
		avatar_upload = new SWFUpload(avatar_upload_setting);
	});
	
	
	
	function onPicSelected(fileObject) {
		currentFileObject = fileObject;
	}
	
	function onFileDialogComplete(nSelected,nQueued,nAllQueued) {
		if(nSelected>0) {
			avatar_upload.startUpload(currentFileObject.id);
			$("#avatar_upload_info").text("正在上传图片，请稍候……");
			$("#avatarResize").hide();
			$("#fileUploadProgress").show();
			$("#avatar_progress").show();
		}
	}
	
	function onPicUploadProgress(fileObject,bytesComplete,totalBytes) {
		$("#avatar_progress_bar").width((bytesComplete*150/totalBytes));
	}
	
	function onPicUploadError() {
		$("#avatar_upload_info").text("上传失败");
	}
	
	
	function onPicUploadSuccess(fileObject,serverData,response) {
		var result = $.parseJSON(serverData);
		if(result.success==1) {
			$("#avatar_upload_info").text("上传成功");
			$("#fileUploadProgress").hide();
			imgDirection = 0;
			currentAvatarFileName=result.picFileName;
			changeResizePic("/avatar/"+currentAvatarFileName);
		} else {
			$("#avatar_upload_info").text("上传失败，请重新上传");
			$("#avatar_progress").hide();
		}
	}
	
	function onPicUploadComplete(fileObject) {
	}
	
	var imgCropper = null;
	var imgDirection = 0;
	var currentAvatarFileName = null;
	
	function changeResizePic(picFileName) {
		$("#avatarResizeDiv").empty();
		$("#avatarResizeDiv").append("<div id='bgDiv'>"+
				"	<div id='dragDiv'>              "+
				"		<div id='rRightDown'> </div>  "+
				"		<div id='rLeftDown'> </div>   "+
				"		<div id='rRightUp'> </div>    "+
				"		<div id='rLeftUp'> </div>     "+
				"		<div id='rRight'> </div>      "+
				"		<div id='rLeft'> </div>       "+
				"		<div id='rUp'> </div>         "+
				"		<div id='rDown'></div>        "+
				"	</div>                          "+
				"</div>                           ");
		
		$("#avatarResize").show();
		
		
		imgCropper = new ImgCropper("bgDiv", "dragDiv", 
			picFileName, {
			Width: 300, Height: 300, Color: "#000",
			Resize:true,Scale:true,Ratio:1,minHeight:50,minWidth:50,Min:true,
			Right: "rRight", Left: "rLeft", Up:	"rUp", Down: "rDown",
			RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
			Preview: "viewDiv", viewWidth: 180, viewHeight: 180}
		);
	}
	
	function saveAvatar() {
		var pos = $("#dragDiv").position();
		var x = pos.left;
		var y = pos.top;
		var w = $("#dragDiv").width();
		var h = $("#dragDiv").height();
		
		var groupid = $("#groupid").val();
		$.post("/action/sns/save_avatar",
			{"d":imgDirection,"filename":currentAvatarFileName,"x":x,"y":y,"w":w,"h":h,"groupid":groupid},
			function(data){
				if(data.success==1) {
					$.psfInfoDialog("头像保存成功");
					$("#avatarResize").hide();
					$("#fileUploadProgress").show();
					$("#avatar_progress").hide();
					$("#avatar_upload_info").text("头像修改成功，如需再次修改头像，请点击[本地上传]");
				} else {
					alert(data.info);
				}
			},"json"
		);
	}
	
	function avatarTurnLeft() {
		if(imgDirection==0) {
			imgDirection = 3;
		} else {
			imgDirection--;
		}
		changeResizePic("/avatar/"+currentAvatarFileName+"?d="+imgDirection);
	}
	
	function avatarTurnRight() {
		if(imgDirection==3) {
			imgDirection = 0;
		} else {
			imgDirection++;
		}
		changeResizePic("/avatar/"+currentAvatarFileName+"?d="+imgDirection);
	}
	
	//编辑基本信息js	
	var initIntro = "最多可以输入70个字";
	$(function(){
		$("#group_intro").val(initIntro);
		$("#group_intro").focus(function(){
			if($(this).val() == "最多可以输入70个字"){
				$(this).val("");
			}
		});
		$("#group_intro").blur(function(){
			$('.group_intro_errmsg').text("");
			if($(this).val()==''){
				$(this).val(initIntro);
				$('.group_intro_errmsg').text("圈子介绍字数不能空！");
			}else if($.trim($(this).val()).length > 70){
				$('.group_intro_errmsg').text("圈子介绍字数不能超过70！");
			}
		});
		
		$("[name='group_type']:radio").click(function(){
			if($('#group_type_1').is(":checked")){
				$('#join_type').show();	
			}else{
				$('#join_type').hide();	
			}
		});

	});
	
	function getChildZone(obj,divid){
		var parentid = $(obj).val();
		$.post(
			"/sns/group/getchildzone",
			"parentid="+parentid,
			function(result){
				var content = '';
				$.each(result.childs,function(i,child){
					content += "<option value="+child.zoneid+">"+child.zonename+"</option>"
				});
				$('#'+divid).html(content);
			},
			"json"
		);
	}
	
	function validateGroupName(divid){
		$('.'+divid+'_errmsg').text("");
		var groupname = $.trim($('#'+divid).val());
		if(groupname.length < 1){
			$('.'+divid+'_errmsg').text("圈子名称不能为空！");
			$('#'+divid)[0].focus();
			return false;
		}else{
			return true;
		}
	}
	
	function validateTag(divid){
		$(".group_tag_errmsg").text("");
		var tag = $.trim($('#'+divid).val());
		var regExp = /[,|\s|,\s|\s,]+/;
		var tags = tag.split(regExp);
		
		if(tags.length > 5){
			$(".group_tag_errmsg").text("最多5个标签");
			return false;
		}
		return true;
	}
	
	function saveGroup() {
		var groupname = $.trim($('#group_name').val());
		var groupintro = $.trim($('#group_intro').val());

		if(groupname.length < 1){
			$(".group_name_errmsg").text("圈子名称不能为空！");
			return false;
		}else if(groupintro.length < 1 || groupintro.length>70 || groupintro=='最多可以输入70个字'){
			$(".group_intro_errmsg").text("圈子介绍不能为空，且字数不能超过70！");
			return false;
		}else if(!validateTag('group_tag')){
			$('.group_tag_errmsg').text("最多5个标签");
			return false;
		}else{
			var param = $("#group_info").serialize();
			$.post(
				"/sns/group/savegroup",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog("创建成功！");
						$("#groupid").val(result.groupid);
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}
	</script>
</head>

<body>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="group"/>
<div id="sns_main" class="snsrbox s_clear">
	<div id="sns_left">
    	<div class="sns_group_manage_conwrap">
			<psf:include page="/sns/group/edit_group_tab.jsp"/>
			<div id="edit_content">
				<!-- 编辑圈子基本信息 -->
				<div id="groupinfo">
					<form id="group_info">
					<div class="group_manage_form">
						<dl>
					    	<dt><span>*</span> 圈子名称：</dt>
					        <dd>
					        	<input id="group_name" class="input_name" name="group_name" onblur="validateGroupName('group_name')" value=""/>
					            <span class="errmsg group_name_errmsg"></span>
					        </dd>
					    </dl>
					    
					    <dl>
					    	<dt><span>*</span> 圈子简介：</dt>
					        <dd>
					        	<textarea id="group_intro" name="group_intro"></textarea>
					            <span class="errmsg group_intro_errmsg"></span>
					        </dd>
					    </dl>
					    
					    <dl>
					    	<dt><span>*</span> 圈子分类：</dt>
					        <dd>
					        	<select id="group_class" name="group_class">
					            	<c:forEach items="${groupclass}" var="gc">
					            		<option value="${gc.groupclassid}">${gc.groupclassname}</option>
					            	</c:forEach>
					            </select>
					            <span class="errmsg group_class_errmsg"></span>
					        </dd>
					    </dl>
					    
					    <dl>
					    	<dt><span>*</span> 圈子地址：</dt>
					        <dd>
					        	<select id="addr_province" name="addr_province" onchange="getChildZone(this,'addr_city')">
					            	<c:forEach items="${provinces}" var="province">
					            	<option value="${province.zoneid}">${province.zonename}</option>
					            	</c:forEach>
					            </select>
					            <select id="addr_city" name="addr_city">
					            	<c:forEach items="${cities}" var="city">
					            	<option value="${city.zoneid}">${city.zonename}</option>
					            	</c:forEach>
					            </select>
					            <span class="errmsg addr_province_errmsg addr_city_errmsg"></span>
					        </dd>
					    </dl>
					    
					    <dl>
					    	<dt>圈子标签：</dt>
					        <dd>
					        	<input id="group_tag" class="input_name" name="group_tag" onchange="validateTag('group_tag')" value=""/>
					            <span class="errmsg group_tag_errmsg"></span>
					            <p>标签可以让你的群更容易被搜索到（最多5个签标，签标之间可以用空格或逗号隔开）</p>
					        </dd>
					    </dl>
					    
					    <dl>
					    	<dt>圈子类别：</dt>
					        <dd>
					            <ul>
					            	<li>
					                    <input id="group_type_1" name="group_type" class="radio" type="radio" checked="checked" value="1"/>
					                    <label>公开圈子</label>
					                    <span class="infomsg">
					                        (圈子的内容是完全共公开的，任何人都可以搜索及转发)
					                    </span>
					                    <div id="join_type" class="group_popupbox">
					                    	<div class="arrow"></div>
					                        <div class="conbox">
					                        	<ol>
					                            	<li class="name">加入方式</li>
					                            	<li>
					                                    <input name="join_type" class="radio" type="radio" checked="checked" value="1"/>
					                                    <label>自由加入</label>
					                                </li>
					                                <li>
					                                    <input name="join_type" class="radio" type="radio" value="2"/>
					                                    <label>申请加入</label>
					                                </li>
					                            </ol>
					                        </div>
					                    </div>
					                </li>
					                <li>
					                    <input id="group_type_2" name="group_type" class="radio" type="radio" value="3"/>
					                    <label>半公开圈子</label>
					                    <span class="infomsg">
					                        (只有圈友才能浏览、搜索及转发)
					                    </span>
					                </li>
					                <li>
					                    <input id="group_type_3" name="group_type" class="radio" type="radio" value="4"/>
					                    <label>私密圈子</label>
					                    <span class="infomsg">
					                        (圈子只能由圈主和管理员主动邀请加入，内容不能被搜索及转发)
					                    </span>
					                </li>
					            </ul>
					            
					        </dd>
					    
					    </dl>
					    <dl>
					    	<dt></dt>
					        <dd><a class="savedatabtn" href="javascript:void(0)" onclick="saveGroup()">保存资料</a></dd>
					    </dl>
					
					</div>
					</form>
				</div>
				
				<!-- 编辑圈子头像信息 -->
				<div id="avatarinfo" class="hide">
					<div class="avatar_div_outter" style="margin-top: 20px;">
						<div class="avatar_div">
							<div class="avatar_left">
								<div class="avatar_upload">
									<div id="avatarUploadButton"></div>
								</div>
								<div id="fileUploadProgress">
									<div id="avatar_upload_info">请选择图片上传</div>
									<div id="avatar_progress" class="avatar_progress" style="display:none;">
										<div id="avatar_progress_bar" class="avatar_progress_bar"></div>
									</div>
								</div>
								<div id="avatarResize" style="display:none;">
									<div id="avatarResizeDiv" class="avatar_resize">
										<div id="bgDiv">
											<div id="dragDiv">
												<div id="rRightDown"> </div>
												<div id="rLeftDown"> </div>
												<div id="rRightUp"> </div>
												<div id="rLeftUp"> </div>
												<div id="rRight"> </div>
												<div id="rLeft"> </div>
												<div id="rUp"> </div>
												<div id="rDown"></div>
											</div>
										</div>
									</div>
									<div class="avatar_action">
										<a href="javascript:avatarTurnLeft();">左旋</a> 
										<a href="javascript:avatarTurnRight();">右旋</a>
									</div>
									<div class="avatar_save">
										<input type="image" src="/images/sns/default/avatar/avatar_save.gif" onclick="saveAvatar();"/>
									</div>
								</div>
							</div>
							<div class="avatar_right">
								<div class="avatar_tip">头像预览</div>
								<div class="avatar_bigpreview">
									<div id="viewDiv" style="width:180px; height:180px;">
										<img src="/pic/${user.avatarid}.jpg"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div style="display:none;">
						<input id="idSize" type="button" value="缩小显示" />
						<input id="idOpacity" type="button" value="全透明" />
						<input id="idColor" type="button" value="白色背景" />
						<input id="idScale" type="button" value="使用比例" />
						<input id="idMin" type="button" value="设置最小尺寸" />
						<input id="idView" type="button" value="缩小预览" />
						<input id="idImg" type="button" value="换图片" />
						图片地址：<input id="idPicUrl" type="text" value="http://images.cnblogs.com/cnblogs_com/cloudgamer/143727/r_mm14.jpg" />
						<input id="idPic" type="button" value="换图" />
					</div>
				</div>
			</div>
        </div>
	</div>	
	<div id="sns_right">
		<psf:include page="/sns/group/group_right.jsp"/>
	</div>	
</div>
<psf:tail/>
</div>
<input type="hidden" id="groupid" value=""/>
</body>
</html>