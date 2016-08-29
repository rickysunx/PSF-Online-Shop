<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 发布指南-->

<script type="text/javascript">
	var cateid = '';	//定义已选择的品牌分类 ID
	var selected_brandids = '';	//已选择的商品品牌
	function selectBrandDialog(width, height, uid){
		if($("#select_brand_dialog").length==0) {
			$("body").append("<div id='select_brand_dialog' style='display:none;width:"+width+"px;height:"+height+"px;'></div>");
		}		
		var options = {"width": width+"px", "height": height+"px", center: true, modal: true};
		
		var dialogId = $("#select_brand_dialog").psfDialog(options,function(target){
			$("#select_brand_dialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#select_brand_dialog").load("/sns/guide/select_brand_dialog",{"uid":uid,"cateid":cateid},function(){
				$("#psfDialog_"+dialogId).psfCenter();
			});
		});
	}
	
	function closeSelectBrandDialog(divid){
		$("#"+divid).psfDialogClose();
	}
	
	function loadSelectedBrand(options){
		$("#has_selected_brand").load(
			"/sns/guide/get_selected_brand",
			options
		);
	}
	
	
	function submit_brand(){
		if($("#brand_form input[name='brandid']:checked").length==0){
			$.psfInfoDialog("请至少选择一个品牌!");
			return;
		}
		selected_brandids = getSelectedBrandIds();
		var options = $("#brand_form").serialize();
		var cateid = $(".sellistbox ol li.current").attr("cateid");
		options += "&cateid="+cateid;
		loadSelectedBrand(options);
		closeSelectBrandDialog('select_brand_dialog');
	}
	
	function getSelectedBrandIds(){
		selected_brandids = '';	//清零
		$("#brand_form input[name='brandid']:checked").each(function(){
			selected_brandids += $(this).val()+",";
		});
		return selected_brandids;
	}
	
	function saveGuide(){
		var title = $.trim($("input[name='guide_title']").val());
		guideEditor.sync();
		var content = guideEditor.getContent();
		var reg = new RegExp("<p>|<\\/p>|<br \\/>","g");
		content = content.replace(reg,"");
		var cateid = $("input[name='selected_cate']").val();
		
		//alert(content);
		if(title == undefined || title == ''){
			$.psfInfoDialog("指南主题不能为空!");
			return;
		}else if($("input[name='selected_brandid']:hidden").length==0){
			$.psfInfoDialog("请选择品牌!");
			return;
		}else if(content==undefined || $.trim(content)==''){
			$.psfInfoDialog("请写下你的指南内容!");
			return;
		}else if(cateid == undefined || cateid == ''){
			$.psfInfoDialog("品牌分类错误!")
			return false;
		}
		var param = $("#guide_form").serialize();
		$.post(
			"/sns/guide/save_guide",
			param,
			function(result){
				if(result.success==1){
					$.psfInfoDialog("指南发布成功!");
					window.location.href = "/sns/guide";
				}else{
					$.psfInfoDialog(result.info);
					return false;
				}
			},
			"json"
		);
	}
</script>

<div class="editformbox">

	<h1><em></em><i>发布指南</i></h1>
	<form id="guide_form">
	<div class="form">
		<dl class="edit_input">
			<dt><label for="etitle">标题</label></dt>
			<dd><input id="etitle" class="textinput04" name="guide_title"/></dd>
		</dl>
		
		<dl class="logoselectbox">
			<dt><a class="button11 button11_26" href="javascript:selectBrandDialog(684,null,${loginPsfUid})">选择品牌</a></dt>
			<dd id="has_selected_brand"></dd>
		</dl>
		
		<dl class="edit_textarea">
			<dt>内容</dt>
			<dd>
				<textarea id="guideEditor" name="content" style="width:600px;height:300px;" ></textarea>
			</dd>
			<dd class="txtarea_bottom s_clear">
				<!-- <div class="faceimg"><a class="button11 button11_26" href="#">预览</a></div> -->
				<div class="ckgroup">
					<input type="checkbox" id="bd1"><label for="bd1">同时发表到我的圈子</label>
				</div>
				<div class="right"><a class="button11 button11_26" href="javascript:void(0)">取消</a> <a class="button12" href="javascript:saveGuide()">我要发布</a></div>
			</dd>
		</dl>
	</div>
	</form>
	
</div>