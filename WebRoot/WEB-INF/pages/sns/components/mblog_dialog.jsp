<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<psf:include page="/sns/components/smiley.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#dialog_uploadimg .tab03 li").psfTab($("#dialog_uploadimg .uploadimg_item,#dialog_uploadimg .uploadvideo_item"));
	$("#dialog_uploadmusia .tab03 li").psfTab($("#dialog_uploadmusia .uploadvideo_item,#dialog_uploadmusia .uploadvideo_item"));
});
</script>
<!-- 图片上传 -->
<script type="text/javascript">

function blog_image_onSwfLoaded() {
	alert("loaded");
}

function blog_image_upload_next() {
	var item = $(".blogUploadImgItem[state='0']").first();
	var fileObjectId = $(item).attr("fileObjectId");
	this.startUpload(fileObjectId);
}

function blog_image_onPicSelected(fileObject) {
	$("#blog_image_upload_swf_div").before("<div psftype='blogUploadImageItem' id='blogUploadImgItem_"+fileObject.id+
		"' fileObjectId='"+fileObject.id+
		"' class='blogUploadImgItem' state='0'>"+fileObject.name+"</div>");
	this.setButtonText("<span class='info'>点击添加第"+$("#blog_image_upload_list").children().length+"张图片</span>");
}

function blog_image_onFileDialogComplete(nSelected,nQueued,nAllQueued) {
	if(nSelected>0) {
		blog_image_upload_next.call(this);
	}
}

function blog_image_onPicUploadProgress (fileObject,bytesComplete,totalBytes) {
	$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"("+Math.round(bytesComplete*100/totalBytes)+"%)");
}

function blog_image_onPicUploadError () {
	
}

function blog_image_del_pic(fileObjectId) {
	if(confirm('真的要删除图片吗？')) {
		var picid = $("#blogUploadImgItem_"+fileObjectId).attr("picid");
		$("#blogUploadImgItem_"+fileObjectId).remove();
		$("input[name='picid'][value='"+picid+"']").remove();
		blog_image_swf_uploader.setButtonText("<span class='info'>点击添加第"+$("#blog_image_upload_list").children().length+"张图片</span>");
	}
}

function blog_image_onPicUploadSuccess (fileObject,serverData,response) {
	var result = $.parseJSON(serverData);
	if(result.success==1) {
		$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"(完成)");
		$("#blogUploadImgItem_"+fileObject.id).attr("state","1");
		$("#blogUploadImgItem_"+fileObject.id).removeClass('blogUploadImgItem');
		$("#blogUploadImgItem_"+fileObject.id).css("float","left");
		$("#blogUploadImgItem_"+fileObject.id).attr("picid",result.picid);
		$("#blogUploadImgItem_"+fileObject.id).html(
			"<div style='margin:0 0 5px 0;float:left;'><img width='370px' src='/pic/"+result.picFileName+"'/></div>"+
			"<div class='blogUploadImgDel' onclick=\"blog_image_del_pic('"+fileObject.id+"');\"><img src='/images/deluploadpic.png'/></div>");
		$("#blogImageUploadInputDiv").append("<input type='hidden' name='picid' value='"+result.picid+"'/>");
	} else {
		$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"(出错)");
		$("#blogUploadImgItem_"+fileObject.id).attr("state","2");
		alert(result.info);
	}
}

function blog_image_onPicUploadComplete (fileObject) {
	blog_image_upload_next.call(this);
}

function blog_image_Ok () {
	$("#dialog_uploadimg").psfDialogClose();
}

function blog_image_Cancel() {
	if(confirm('选择取消，将删除当前上传的图片，是否继续？')) {
		blog_image_clear();
	}
}

function blog_image_clear() {
	$("#dialog_uploadimg").psfDialogClose();
	$("input[name='picid']").remove();
	$("div[psftype='blogUploadImageItem']").remove();
}

var blog_image_swf_uploader = null;

$(document).ready(function(){
	$("#dialog_uploadimg .tab03 li").psfTab($("#psfsmiley .smiley_items,#psfsmiley .normal_smiley_items"));
	
});



</script>
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
<!-- 视频上传 -->
<script type="text/javascript">
<!--
function mblogSubmitVideo() {
	$.post(
		"/action/sns/blog/get_video_info",
		$("#blogUploadVideoForm").serialize(),
		function(data){
			if(data.success==1) {
				$("#blogContent").val(data.shorturl);
				$("#dialog_uploadvideo").psfDialogClose();
			} else {
				alert(data.info);
			}
		},
		"json");
}
//-->
</script>
<div id="dialog_uploadvideo" class="dialog_uploadvideo dialogtitle" style="display:none">
	<dl class="tab03">
		<dd>
			<ul>
				<li class="current"><a href="javascript:void(0)">视频连接</a></li>
			</ul>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<form id="blogUploadVideoForm" action="/action/sns/blog/get_video_info">
	<div class="uploadvideo_item">
		<p>粘贴视频播放地址</p>
		<div class="uploadvideo_item_border">
		<input type="text" name="url" />
		<a class="button11" href="javascript:mblogSubmitVideo();">确定</a>
		</div>
	</div>
	</form>
</div>
<!-- 音乐上传 -->
<div id="dialog_uploadmusia" class="dialog_uploadvideo dialogtitle" style="display:none">
	<dl class="tab03">
		<dd>
			<ul>
				<li class=""><a href="javascript:void(0)">上传音乐</a></li>
				<li class="current"><a href="javascript:void(0)">音乐收藏</a></li>
			</ul>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<div class="uploadvideo_item" style="display: none">
		<div class="uploadvideo_item_border">
		<input type="text" />
		<a class="button11" href="javascript:void(0)">上传</a>
		</div>	
	</div>
	<div class="uploadvideo_item" >
		<div class="uploadvideo_item_border">
		<input type="text" />
		<a class="button11" href="javascript:void(0)">搜索</a>
		</div>	
	</div>
</div>
<!-- 话题 -->
<!-- 品友 -->
<script type="text/javascript">
<!--

function refreshPsfFriendList() {
	$.post("/action/sns/get_at_user",$("#psfFriendForm").serialize(),function(data){
		if(data.success==1) {
			var s = "";
			
			$.each(data.userList,function(i,user){
				s+="<p userName='"+user.userName+"'>"+user.userName+
					(user.remarkName.length==0?"":"("+user.remarkName+")")+"</p>";
			});
			
			$("#psfFriendItemList").html(s);
			
			$("#psfFriendItemList > p").hover(function(){
				$(this).addClass('psffriend_item_gray_background');
			},function(){
				$(this).removeClass('psffriend_item_gray_background');
			});
			
			$("#psfFriendItemList > p").click(function(){
				var bc = $("#blogContent").val();
				var userName = $(this).attr("userName");
				$("#blogContent").val(bc+"@"+userName+" ");
				
			});
			
			if(data.showPrev) {
				$("#psfFriendPrev").show();
			} else {
				$("#psfFriendPrev").hide();
			}
			
			if(data.showNext) {
				$("#psfFriendNext").show();
			} else {
				$("#psfFriendNext").hide();
			}
			
		} else {
			alert(data.info);
		}
	},"json");
	
	
	
}

function onPsfFriendNameChange() {
	$("#psfFriendPage").val(1);
	refreshPsfFriendList();
}

function psfFriendPrev() {
	var p = $("#psfFriendPage").val();
	p = parseInt(p)-1;
	if(p<1) p = 1;
	$("#psfFriendPage").val(p);
	refreshPsfFriendList();
}

function psfFriendNext() {
	var p = $("#psfFriendPage").val();
	p = parseInt(p)+1;
	$("#psfFriendPage").val(p);
	refreshPsfFriendList();
}
//-->
</script>
<div id="dialog_psffriend" class="dialog_psffriend dialogtitle" style="display:none">
	<dl class="tab03">
		<dd>
			<form id="psfFriendForm">
				<input id="psfFriendPage" type="hidden" name="page" value="1"/>
				<div class="searchbox02">
					<input id="psfFriendName" type="text" name="name" onkeyup="onPsfFriendNameChange();">
					<a class="searchbtn" href="javascript:onPsfFriendNameChange();"></a>
				</div>
			</form>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<div id="psfFriendItemList" class="psffriend_item">
	</div>
	<div id="psfFriendPrevAndNext" class="bottom s_clear">
		<a id="psfFriendPrev" class="pre" href="javascript:void(0)" onclick="psfFriendPrev();">上一组</a>
		<a id="psfFriendNext" class="next" href="javascript:void(0)" onclick="psfFriendNext();">下一组</a>
	</div>
</div>
<script type="text/javascript">
function republish_checkpic(input) {
	var checked = $(input).attr("checked");
	$("#formRepublish").find("input[name='picurl']").attr("checked",false);
	$(input).attr("checked",checked);
}

function republish_getPageInfo() {
	$.post(
		"/action/sns/get_page_info",$("#formRepublish").serialize(),
		function(data){
			if(data.success==1) {
				var s = "";
				s+="<dl><dt>标题：</dt><dd><input class='input_name' name='title' value='"+data.title+"'></dd></dl>";
				s+="<dl><dt>内容简介：</dt><dd><textarea name='content'>"+data.content+"</textarea></dd></dl>";
				
				s+="<dl><dt>选择图片：<p>(选一张为题图)</p></dt><dd><ul>";
				
				$.each(data.imageList,function(i,src){
					s+="<li><img src='"+src+"' style='width:119px;height:78px;'/><input onclick='republish_checkpic(this);' name='picurl' value='"+src+"' type='checkbox' />";
				});
				
				s+="</ul><dd></dl>";
				s+="<div class='bottom s_clear'>";
				s+="<a class='button11' href='javascript:void(0)' onclick='republish_submit();'>发布</a>";
				s+="<a class='button11' href='javascript:void(0)' onclick='republish_close();'>取消</a></div>";
				
				$("#republishContent").html(s);
				$("#republishContent").show();
			} else {
				alert(data.info);
			}
		},"json");
}

function republish_close() {
	$("#dialog_reproduced").psfDialogClose();
}

function republish_submit() {
	$.post("/action/sns/save_republish",$("#formRepublish").serialize(),function(data){
		if(data.success==1) {
			$("#dialog_reproduced").psfDialogClose();
			loadPostList(-1,-1,-1,1);
		} else {
			alert(data.info);
		}
	},"json");
}
</script>
<!-- 转发 -->
<div id="dialog_reproduced" class="dialog_reproduced dialogtitle" style="display: none">
	<dl class="tab03">
		<dd>
			<h4>发现网络热点、分享新鲜生活</h4>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0);"></a>
		</dt>
	</dl>
	<form id="formRepublish" method="post">
	<div class="reproduced_item">
		<p>将你想转载的地址粘贴在这里</p>
		<div class="reproduced_item_border s_clear">
			<input type="text" name="url"/>
			<a href="javascript:void(0)" onclick="republish_getPageInfo();"></a>
		</div>
		
		<div id="republishContent" style="display:none;">
			
		</div>
	</div>
	</form>
</div>

