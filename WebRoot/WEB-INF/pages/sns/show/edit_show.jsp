<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>发布秀场</title>
	<psf:header/>
	<script type="text/javascript" src="/js/sns/common.js"></script>
	<script type="text/javascript" src="/js/sns/index.js"></script>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/swfupload.js" type="text/javascript"></script>
	<script type="text/javascript" src="/js/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="/js/ueditor/editor_ui_all.js"></script>
	<link rel="stylesheet" type="text/css" href="/js/ueditor/themes/default/ueditor.css"/>
	<script type="text/javascript">
		var showEditor1 = null;
		$(document).ready(function(){
			showEditor1 = $("#showEditor").editor(${loginPsfUid}); //初始化编辑器 
		
			loadSelectedProduct("has_selected",null,1);	//加载已选择的商品列表
			
			
			var avatar_upload_setting = {
				flash_url : "/js/swfupload.swf",
				upload_url: "/action/sns/upload_showpic?uid=${loginPsfUid}&type=2",
				file_size_limit : "10MB",
				file_types : "*.jpg;*.gif;*.png;*.bmp",
				file_types_description : "图片文件",
				file_upload_limit : 10,
				file_queue_limit : 0,
				debug: false,
				button_action:SWFUpload.BUTTON_ACTION.SELECT_FILES,
		
				// Button settings
				button_image_url: "/images/sns/default/avatar/avatar_upload.gif",
				button_width: "92",
				button_height: "30",
				button_placeholder_id: "uploadPic",
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
		
		var picQueue = new Array();
		var index = 0;
		
		function onPicSelected(fileObject) {
			// currentFileObject = fileObject;
			index++;
			picQueue.push(fileObject);
		}
	
		function onFileDialogComplete(nSelected,nQueued,nAllQueued) {
			if(nSelected>0) {
				avatar_upload.startUpload();
				$("#upload_info").show();
			}
		}
		
		function onPicUploadProgress(fileObject,bytesComplete,totalBytes) {
		}
		
		function onPicUploadError() {
			$("#upload_info").html("<font color='red'>上传失败</font>");
		}
		
		function onPicUploadSuccess(fileObject,serverData,response) {
			var result = $.parseJSON(serverData);
			if(result.success==1) {
				$("#upload_info").html("<span>上传成功<span>");
				$("#upload_info").hide();
				
				var content = "<li id='show_pic_"+result.picid+"'><div class='imgtitle'><img height='78px' src='/pic/"+result.picFileName+"' alt='' picid='"+result.picid+"'/><a picid='"+result.picid+"' href='javascript:void(0)' onclick='setCover(this)'>设置封面</a></div><input type='hidden' id='picid_"+result.picid+"' name='picid' value='"+result.picid+"'/><a class='close' href='javascript:delShowPic("+result.picid+")'></a><textarea name='intro_"+result.picid+"' class='intro_of_pic textarea'></textarea></li>";
				$(".pic_list ul").prepend(content);
				if(!$("#has_selected_pic").is(":visible")){
					$("#has_selected_pic").show();
				}
				initTextArea("intro_of_pic", "亲，用一段文字介绍你的美图吧！");
				$(".pic_list ul li").hover(function() {$(this).addClass("current")},function() {$(this).removeClass("current")});
				
				//设置默认封面
				var cover = $(".pic_list ul li:eq(0)").attr("id").split("_")[2];
				$("input[name='cover']").val(cover);
			} else {
				$("#avatar_upload_info").text("上传失败，请重新上传");
			}
		}
		
		function onPicUploadComplete(fileObject) {
			index--;
			if(index > 0){
				avatar_upload.startUpload();
			}
		}
		
		//初始化照片说明 
		function initTextArea(classname, msg){
			$("."+classname).text(msg);
			$("."+classname).focus(function() {
				$(this).text("");
			});
			$("."+classname).blur(function() {
				var msg1 = $(this).text();
				if(msg1 == undefined || $.trim(msg1) == ''){
					$(this).text(msg);
				}
			});
		}
		
		//删除上传的照片 
		function delShowPic(picid){
			$.post(
				"/sns/show/del_pic",
				{"picid":picid,"uid":${loginPsfUid}},
				function(result){
					if(result.success==1){
						$("#show_pic_"+result.picid).remove();
						if($(".pic_list ul li").length==0){
							$("#has_selected_pic").hide();
						}
					}else{
						$.psfInfoDialog("删除失败!");
					}
				},
				"json"
			);
		}

		//设置秀场封面
		function setCover(obj){
			var cover = $(obj).attr("picid");
			$("input[name='cover']").val(cover);
			$("#show_pic_"+cover).siblings().each(function(){
				$(this).find("div.imgtitle a:hidden").show();
			});
			$(obj).hide();
		}
		
		function submit_show(){
			var title = $.trim($("input[name='show_title']").val());
			showEditor1.sync();
			var content = showEditor1.getContent();
			var reg = new RegExp("<p>|<\\/p>|<br \\/>","g");
			content = content.replace(reg,"");
			//alert(content);
			if(title == undefined || title == ''){
				$.psfInfoDialog("秀场主题不能为空!");
				return;
			}else if($("input[name='pid']:hidden").length==0){
				$.psfInfoDialog("请选择商品!");
				return;
			}else if($("input[name='picid']:hidden").length==0){
				$.psfInfoDialog("请上传照片!");
				return;
			}else if(content==undefined || $.trim(content)==''){
				$.psfInfoDialog("请写下你的秀场内容!");
				return;
			}
			$.post(
				"/sns/show/save_show",
				$("#show_form").serialize(),
				function(result){
					if(result.success == 1){
						$.psfInfoDialog("发布成功!");
						window.location.href = "/sns/show";
					}else{
						$.psfInfoDialog("发布秀场失败!");
						return;
					}
				},
				"json"
			);
		}
	</script>
</head>

<body>

<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="show"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
		<div class="sns_conwrap">
			<psf:include page="/sns/show/edit_show_content.jsp"/>
		</div>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/show/show_right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>