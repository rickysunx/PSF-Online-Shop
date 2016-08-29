function EditorImageUploader(editor,id,uid) {
	this._currentFileObject = null;
	this._onPicSelected = function(fileObject) {
		this._editor_uploader._currentFileObject = fileObject;
	};
	this._onFileDialogComplete = function(nSelected,nQueued,nAllQueued) {
		if(nSelected>0) {
			this.startUpload(this._editor_uploader._currentFileObject.id);
			if($("#editor_upload_progress_dialog").length==0) {
				$("body").append("<div id='editor_upload_progress_dialog'>" +
					"正在上传图片(<span id='editor_upload_indicator'></span>%)，请稍候</div>");
			}
			$("#editor_upload_progress_dialog").psfDialog({"center":true,modal:true});
			$("#editor_upload_indicator").text("0");
		}
	};
	this._onPicUploadProgress = function(fileObject,bytesComplete,totalBytes) {
		$("#editor_upload_indicator").text(Math.round(bytesComplete*100/totalBytes));
	};
	this._onPicUploadError = function() {
		
	};
	this._onPicUploadSuccess = function(fileObject,serverData,response) {
		var result = $.parseJSON(serverData);
		if(result.success==1) {
			this._editor_uploader._editor.execCommand("inserthtml","<img src='/pic/"+result.picFileName+"'/>");
		} else {
			alert(result.info);
		}
		
	};
	this._onPicUploadComplete = function(fileObject) {
		$("#editor_upload_progress_dialog").psfDialogClose();
	};
	this._editor = editor;
	this._id = id;
	this._setting = {
		flash_url : "/js/swfupload.swf",
		upload_url: "/action/upload_editor_pic?uid="+uid,
		file_size_limit : "10MB",
		file_types : "*.jpg;*.gif;*.png;*.bmp",
		file_types_description : "图片文件",
		file_upload_limit : 100,
		file_queue_limit : 0,
		debug: false,
		button_action:SWFUpload.BUTTON_ACTION.SELECT_FILE,

		// Button settings
		button_image_url: "/images/editor_upload_image.gif",
		button_width: "20",
		button_height: "20",
		button_placeholder_id: "editor_img_"+this._id,
		button_cursor : SWFUpload.CURSOR.HAND,
		
		file_queued_handler : this._onPicSelected,
		file_dialog_complete_handler : this._onFileDialogComplete,
		upload_progress_handler : this._onPicUploadProgress,
		upload_error_handler : this._onPicUploadError,
		upload_success_handler : this._onPicUploadSuccess,
		upload_complete_handler : this._onPicUploadComplete
	};
	this._swfUpload = new SWFUpload(this._setting);
	this._swfUpload._editor_uploader = this;
}


function _editor_initPicUpload() {
	var _editor_image_upload = new SWFUpload(editor_image_upload_setting);
}

function _editor_onPicSelected(fileObject) {
	currentFileObject = fileObject;
}

function _editor_onFileDialogComplete(nSelected,nQueued,nAllQueued) {
	if(nSelected>0) {
		avatar_upload.startUpload(currentFileObject.id);
		$("#avatar_upload_info").text("正在上传图片，请稍候……");
		$("#avatarResize").hide();
		$("#fileUploadProgress").show();
		$("#avatar_progress").show();
	}
}

function _editor_onPicUploadProgress(fileObject,bytesComplete,totalBytes) {
	$("#avatar_progress_bar").width((bytesComplete*150/totalBytes));
}

function _editor_onPicUploadError() {
	$("#avatar_upload_info").text("上传失败");
}


function _editor_onPicUploadSuccess(fileObject,serverData,response) {
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

function _editor_onPicUploadComplete(fileObject) {
	
}

function _createEditor(sId,uid,name) {
	var _editor = new baidu.editor.ui.Editor({
	    id: sId,
	    toolbars: [
	        ['FullScreen','Bold','Underline','StrikeThrough','|',
	        'JustifyLeft','JustifyCenter','JustifyRight','|',
	        new baidu.editor.ui.Button({
	        	showIcon:false,
	        	label:"<div style='width:20px;height:20px;' id='editor_img_"+sId+"'></div>",
	            className: 'edui-for-image',
	            onclick: function (event){
	        	
	            }
        	}),'PlaceName','Link','Unlink','|']
	    ],
	    minFrameHeight: $("#"+sId).height()-40,
	    elementPathEnabled:false,
	    enterTag:"br",
	    initialContent:$("#"+sId).val(),
	    textarea:name?name:sId
	});
	_editor.render();
	var _image_uploader = new EditorImageUploader(_editor,sId,uid);
	return _editor;
}

(function($){
	$.fn.extend({
		editor:function(uid,name){
			return _createEditor($(this).attr('id'),uid,$(this).attr('name'));
		},
		selectTextRange:function(start,end) {
			$.each($(this),function(i,n){
				if(n.createTextRange){
					var range = n.createTextRange();
					range.collapse(true);
			        range.moveEnd('character', end);
			        range.moveStart('character', start);
			        range.select();
				} else {
					n.focus();
					n.setSelectionRange(start, end);
				}
			});
		}
	});
})(jQuery);