<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
//弹出发布商品对话框
function openSelectProductDialog(){
	if($("#select_product_dialog").length==0) {
		$("body").append("<div id='select_product_dialog' style='display:none;width:700px;'></div>");
	}
	var options = {"width": "700px", center: true, modal: true};
	var dialogId = $("#select_product_dialog").psfDialog(options,function(target){
		$("#select_product_dialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#select_product_dialog").load("/sns/exp/select_product",{"pub":0},function(data){
			$("#psfDialog_"+dialogId).psfCenter();
		});
	});
}
//关闭对话框
function closeSelectPorductDialog(divid){
	$("#"+divid).psfDialogClose();
}
//选择分类
function selectProductByChoose(cateid,pub,page,keyword){
	$("li[type='selectProduct']").removeClass("current");
	$("#exp_"+pub).addClass("current");
	$("#select_product_dialog").load("/sns/exp/select_product",{"pub":pub,"cateid":cateid,"page":page,"keyword":keyword});
}
//筛选
function search(cateid,pub,page){
	var keyword = $("#keyword").val();
	selectProductByChoose(cateid,pub,page,keyword);
}
//选定商品
function selectProduct(pname,pid,price,picname) {
	$("#pid").attr("value",pid);
	$("#pname").attr("value",pname);
	var s = "" ;
	s += "<a href='#'><img src='/pic/"+picname+"' alt='' /></a>";
	s += "<div>";
	s += "<h4>"+pname+"</h4>";
	s += "<p>品上价:<b>￥"+price+"</b></p>";
	s += "<p class='combox'>";
	s += "<span>用户点评：</span>";
	s += "<span class='icons'><em></em><em></em><em></em><em class='no'></em><em class='no'></em></span>";
	s += "</p>";
	s += "</div>";
	$("#chooseProduct").html(s);
	closeSelectPorductDialog('select_product_dialog');
}

//初始化商品评分按钮
function initExpChangeScore() {
	$("#exp_scores > em").hover(function(){
		$(this).siblings().attr("class","scoresbig_gray");
		$(this).attr("class","scoresbig_orange");
		$(this).prevAll().attr("class","scoresbig_orange");
	},function(){
		var value = $("#score").val();
		if(value=="") value=0;
		$(this).parent().children("em").attr("class","scoresbig_gray");
		$(this).parent().children("em:lt("+(value)+")").attr("class","scoresbig_orange");
	});
	$("#exp_scores > em").click(function(){
		$("#score").val($.inArray(this,$(this).parent().children("em"))+1);
	});
	
}
//发布体验
function submitExpForm(){
	expEditor.sync();
	$.post(
		"/action/sns/exp/save",
		$("#expForm").serialize(),
		function(data) {
			if(data.success == 0) {
				$.psfInfoDialog("发布成功",2000);
				window.location.href='/sns/exp';
			} else {
				$.psfInfoDialog("发布失败:"+data.info,2000);
			}
		},
		"json"
	);
}
$(document).ready(function(){
	initExpChangeScore();
});
</script>

<!-- 发布体验内容 -->
<div class="editformbox">
<h1><em></em><i>发布体验</i></h1>
<div class="form">
	<form id="expForm">
	<input type="hidden" name="pid" id="pid" value=""/>
	<input type="hidden" name="score" id="score" value="0" />
	<input type="hidden" name="pname" id="pname" value="" />
	<dl class="edit_exp_selectproduct">
		<dt>
			<label for="etitle" onclick="">选择商品</label>
			<a class="button11 button11_26" href="javascript:openSelectProductDialog();">选择商品</a>
			<span>选一个体验的商品吧</span>
		</dt>
		<dd id="chooseProduct">
			<div>
				<h4 onclick="javascript:openSelectProductDialog();">还没有选择商品</h4>
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label for="etitle">商品评分:</label>
			<span id="exp_scores" class="edit_exp_scores">
				<em class="scoresbig_gray"></em>
				<em class="scoresbig_gray"></em>
				<em class="scoresbig_gray"></em>
				<em class="scoresbig_gray"></em>
				<em class="scoresbig_gray"></em>
			</span>
			<span>为你体验的商品评评分哦~</span>
		</dt>
	</dl>
	<dl class="edit_textarea">
		<dt>编辑描述</dt>
		<dd>
			<textarea id="expContent" name="content" style="width:600px;height:300px;"></textarea>
		</dd>
		<dd class="txtarea_bottom s_clear">
			<div class="ckgroup">
				<input id="bd1" type="checkbox">
				<label for="bd1">同时发表到我的圈子</label>
			</div>
			<div class="right">
				<a class="button12" href="javascript:void(0);" onclick="submitExpForm();">我要发布</a>
			</div>
		</dd>
	</dl>
	</form>
</div>
</div>