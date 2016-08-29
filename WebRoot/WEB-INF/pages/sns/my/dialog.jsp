<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>我与${username }的对话</title>
	<psf:header/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script src="/js/common/CJL.0.1.min.js" type="text/javascript"></script>
	<script src="/js/common/ImageTrans.js" type="text/javascript"></script>
	<script src="/js/swfupload.js" type="text/javascript"></script>

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
$(document).ready(function(){
	
	$("a[psftype='smileybutton']").psfSmiley({
		target:function(e){
			$("textarea[psftype='status']").val($("textarea[psftype='status']").val()+e);
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
});	

$(document).ready(function(){
	$("#dialog_uploadimg .tab03 li").psfTab($("#psfsmiley .smiley_items,#psfsmiley .normal_smiley_items"));
	
});
	function changeDetailPage(touid,page,keyword){
		keyword = encodeURI(encodeURI(keyword));
		window.location.href = "/sns/my/dialog?touid="+touid+"&page="+page+"&keyword="+keyword;
	}
	function searchDetailMsg(touid){
		var keyword = encodeURI(encodeURI($("#detail_keyword").val()));
		window.location.href = "/sns/my/dialog?touid="+touid+"&keyword="+keyword;
	}

</script>
</head>

<body>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="index"/>

<div id="sns_main" class="snsrbox s_clear">
	<div id="sns_left">
			<psf:include page="/sns/my/dialog_content.jsp"/>
	</div>	
	<div id="sns_right">
		<psf:include page="/sns/my/my_right.jsp"/>
	</div>	
</div>
<psf:tail/>
</div>
</body>
</html>