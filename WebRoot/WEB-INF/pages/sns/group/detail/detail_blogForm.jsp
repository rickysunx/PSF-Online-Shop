<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
function closeBlogOtherDialog() {
	
}

function initImageSwfUpload() {
	
	$("#blog_image_upload_swf_div").html("<div id='blog_image_upload_swf_div1'>正在加载上传工具……</div>");
	
	var blogImageSwfUploadSetting = {
		flash_url : "/js/swfupload.swf",
		upload_url: "/action/upload_pic?uid=${loginPsfUid}&type=1",
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
	$("#smileybutton").psfSmiley({
		target:function(e){
			$("#blogContent").val($("#blogContent").val()+e);
		},
		init:function(){
			$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").psfDialogClose();
			$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").find(".tab03 .layerClose .close").unbind("click");
		}
	});

	$("#uploadimgbutton").click(function(){
		$("#blog_image_upload_swf_div0").appendTo("#blog_image_upload_swf_div");
		
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").psfDialogClose();
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").find(".tab03 .layerClose .close").unbind("click");
		
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

	$("#uploadvideobutton").click(function(){
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").psfDialogClose();
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").find(".tab03 .layerClose .close").unbind("click");
		$("#blogUploadVideoForm").find("input[name='url']").val("");
		$("#dialog_uploadvideo").psfDialog({
			top:$(this).position().top+this.offsetHeight,
			left:$(this).position().left,
			width:396,
			openAnimate:100,
			arrow:true,
			arrowdirection:"top",
			arrowstyle:"1",
			arrowpos:20
		});
		$("#dialog_uploadvideo .tab03 .layerClose .close").click(function(){
			$("#dialog_uploadvideo").psfDialogClose();
			$(this).unbind("click");
		});
	});
	
	$("#uploadmusicbutton").click(function(){
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").psfDialogClose();
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").find(".tab03 .layerClose .close").unbind("click");
		
		$("#dialog_uploadmusia").psfDialog({
			top:$(this).position().top+this.offsetHeight,
			left:$(this).position().left,
			width:396,
			openAnimate:100,
			arrow:true,
			arrowdirection:"top",
			arrowstyle:"1",
			arrowpos:20
	
		});
		$("#dialog_uploadmusia .tab03 .layerClose .close").click(function(){
			$("#dialog_uploadmusia").psfDialogClose();
			$(this).unbind("click");
		});
	});
	
	$("#uploadtopicbutton").click(function(){
		var oldContent = $("#blogContent").val();
		var content = "#输入您要发表的话题#";
		$("#blogContent").val(oldContent+content);
		$("#blogContent").selectTextRange(oldContent.length+1,(oldContent+content).length-1);
	});
	
	$("#psffriendbutton").click(function(){
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").psfDialogClose();
		$("#dialog_psfsmiley,#dialog_uploadimg,#dialog_uploadvideo,#dialog_uploadmusia,#dialog_psffriend").find(".tab03 .layerClose .close").unbind("click");
	
		$("#dialog_psffriend").psfDialog({
			top:$(this).position().top+this.offsetHeight,
			left:$(this).position().left,
			width:396,
			openAnimate:100,
			arrow:true,
			arrowdirection:"top",
			arrowstyle:"1",
			arrowpos:20
		});
		
		$("#psfFriendPage").val(1);
		$("#psfFriendName").val("");
		onPsfFriendNameChange();
		
		$("#dialog_psffriend .tab03 .layerClose .close").click(function(){
			$("#dialog_psffriend").psfDialogClose();
			$(this).unbind("click");
		});
	});
});

</script>
<form method="post" action="/action/sns/add_blog" id="blogForm">
	<input type="hidden" name="groupid" value="${group.groupid}"/>	<!-- 发到圈子的微博，参数groupid，圈子参数 -->
	<input type="hidden" name="topicid" value="${topic.topicid}"/>  <!-- 回复话题，参数topicid，话题参数 -->
	<div class="${group.isJoin ? 'mblogbox' : 'mblogbox_none'}">
		<div class="mblogbox_none_link"><p>只有加入圈子才能发言哦~</p></div>
		<div class="nav">
	    	<em></em>
	    </div>
	    <div class="blogContent">
	    	<div><textarea name="blogContent" id="blogContent"></textarea></div>
	        <div class="num">可以输入<b id="word_left_count">200</b>个字</div>
	    </div>
	    <div class="txtarea_bottom">
	        <ul class="right">
            	<li><input type="checkbox" name="sendToBlog" value="1"/><label>同时发送到我的广播</label></li>
            	<li><a href="javascript:void(0);" class="button" id="blogSubmitButton1">发表</a></li>
            </ul>
	        <div class="face">
	            <a id="smileybutton" href="javascript:void(0)"><em></em>表情</a>
	            <a id="uploadimgbutton" class="pic" href="javascript:void(0)"><em></em>图片</a>
	            <a id="uploadvideobutton" class="video" href="javascript:void(0)"><em></em>视频</a>
	            <%-- <a id="uploadmusicbutton" class="music" href="javascript:void(0)"><em></em>音乐</a>--%>
	            <a id="uploadtopicbutton" class="topic" href="javascript:void(0)"><em></em>话题</a>
	            <a id="psffriendbutton" class="pin" href="javascript:void(0)"><em></em>品友</a>
	        </div>
	    </div>
	</div>
</form>