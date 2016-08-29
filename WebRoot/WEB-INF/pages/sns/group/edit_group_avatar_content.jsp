<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
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
	
	$.post("/action/sns/save_avatar",
		{"d":imgDirection,"filename":currentAvatarFileName,"x":x,"y":y,"w":w,"h":h,"groupid":${group.groupid}},
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



</script>
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
						<img src="/pic/${group.picid}.jpg"/>
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