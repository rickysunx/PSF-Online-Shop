<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script src="/js/swfupload.js" type="text/javascript"></script>
<script type="text/javascript">
		
	function selectProductDialog(width, height, uid){
		if($("#select_product_dialog").length==0) {
			$("body").append("<div id='select_product_dialog' style='display:none;width:"+width+"px;height:"+height+"px;'></div>");
		}
		
		var options = {"width": width+"px", "height": height+"px", center: true, modal: true};
		
		var dialogId = $("#select_product_dialog").psfDialog(options,function(target){
			$("#select_product_dialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#select_product_dialog").load("/sns/show/get_product_cate",{"uid":uid},function(){
				$("#psfDialog_"+dialogId).psfCenter();
				$("#upload_holder1").hide();
			});
		});
	}
	
	function closeSelectPorductDialog(divid){
		$("#"+divid).psfDialogClose();
		$("#upload_holder1").show();
	}
	
	function loadSelectedProduct(divid, pids, page){
		$("#"+divid).load(
			"/sns/show/get_selected_product",
			{"pids":pids,"page":page}
		);
	}
	
	var pids = '';	//保存已选择商品的ID
	function submit_product(){
		if(pids == ''){
			$.psfInfoDialog("请至少选择一个商品!");
			return;
		}
		loadSelectedProduct("has_selected",pids,1);
		closeSelectPorductDialog("select_product_dialog");
	}
	
</script>

<!-- 发布秀场内容 -->
<div class="editformbox">

	<h1 class="h1_photo"><em></em><i>发布秀场</i></h1>
	<form id="show_form">
	<div class="form">
		<dl class="edit_input">
		
			<dt><label for="etitle">标题</label></dt>
			<dd><input id="etitle" class="textinput04" name="show_title"/></dd>
		
		</dl>
		
		<dl class="photoselectbox">
			<dt><label for="etitle">选择商品</label><a class="button11 button11_26" href="javascript:selectProductDialog(696,null,11)">选择商品</a><span>为你的秀选择商品吧</span></dt>
			<dd id="has_selected"></dd>
		</dl>
		
		 <dl style="margin-top:30px;">
		 	<dt><label for="etitle">选择照片</label><span id="upload_holder1"><a class="button11 button11_26" id="uploadPic">选择照片</a></span><span>上传妮子换的照片，让品友们关注你吧</span></dt>
		 	<dd id="upload_info" style="display: none;padding-bottom:2px;">图片正在上传中……<div style='text-align:center;'><img src='/images/loading.gif'></div></dd>
		 	<dd id="has_selected_pic" style="width:518px;display: none;">
		 		<div class="uploadphoto_dialog">
					<div class="pic_list" style="padding:9px 0px; border: 1px solid #917E51">
						<ul>
						</ul>
						<!-- 
						<div class="bottom">
							<div class="right">
								<a id="uploadPic_continue" class="button11" href="javascript:void(0)">继续添加</a>
								<a class="button12" href="javascript:submit_pic()">确定</a>
							</div>
							已添加<span id="piccount">1</span>张，最多10张 哦~
						</div>
						-->
					</div>
					<input type="hidden" name="cover" value="0"/>
				</div>
		 	</dd>
		 </dl>
		
		<dl class="edit_textarea">

			<dt>编辑描述</dt>
			<dd>
				<textarea id="showEditor" name="content" style="width:600px;height:300px;" ></textarea>
			</dd>
            <dd class="txtarea_bottom s_clear">
                <div class="ckgroup">
                    <input type="checkbox" id="bd1"><label for="bd1">同时发表到我的圈子</label>
                </div>
                <div class="right"><a class="button11 button11_26" href="javascript:void(0)">取消</a> <a class="button12" href="javascript:submit_show()">我要发布</a></div>
            </dd>
		
		</dl>

	</div>
	</form>
</div>