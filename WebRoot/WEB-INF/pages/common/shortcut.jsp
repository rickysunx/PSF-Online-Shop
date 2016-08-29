<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>

function reloadFloatCartList() {
	$("#shopCart").load("/action/mall/get_float_cart");
}

var uppass_form={
		nowflag:false,
		newflag:false,
		realfalg:false
	};

$(document).ready(function(){
	$("#mypsfmenubutton").mouseenter(function(){
		$("#mypsfmenu").show();
	}).mouseleave(function(){$("#mypsfmenu").hide()});;
	$("#editpwdlink").click(function(){
		$("#edit_pwd").psfDialog({
			top:$(this).position().top+this.offsetHeight,
			left:$(this).position().left+(this.offsetWidth/2),
			width:486,
			arrow:true,
			arrowauto:true,
			arrowdirection:"top",
			arrowpos:60,
			arrowstyle:"1"
		});
		$("#nowpassword").focus();
		$("#edit_pwd .close").click(function(){
			$("#edit_pwd").psfDialogClose();
			$(this).unbind("click");
		});
	});
	$("#shopcartbutton").mouseenter(function(){
		var display = $("#shopCart").css("display");
		if(display=='none') {
			reloadFloatCartList();
			$("#shopCart").show();
		}
	}).mouseleave(function(){
		$("#shopCart").hide();
	});

	$("#nowpassword").blur(function(){
		if(this.value!=""){
			$.post("/check_now_password",{password:this.value},function(data){
				if(data.success==1) {
					$("#nowpasswordinfo").text("");
					uppass_form["nowflag"]=true;
					return;
				} else if(data.success==0) {
					$("#nowpasswordinfo").text(data.info);
				}
			},"json")
		} else {
			$("#nowpasswordinfo").text("填写当前密码");
		}
		uppass_form["nowflag"]=false;
	});

	$("#newpassword").blur(function(){
		if(this.value!=""){
			if(this.value.length>=6 && this.value.length<=18){
				$("#newpasswordinfo").text("");
				uppass_form["newflag"]=true;
				return;
			}
		} else {
			$("#newpasswordinfo").text("密码长度应在6-18位之间");
		}
		uppass_form["newflag"]=false;
	});
	
	$("#realnewpassword").blur(function(){
		if(this.value!=""){
			if(this.value == $("#newpassword").val()){
				$("#realnewpasswordinfo").text("");
				uppass_form["realflag"]=true;
				return;
			} else{
				$("#realnewpasswordinfo").text("密码和确认密码不一致");
			}
		} else {
			$("#realnewpasswordinfo").text("填写确认密码");
		}
		uppass_form["realflag"]=false;
	});
	
});

function submitUpdatePassword(){
	if( uppass_form["nowflag"] && uppass_form["newflag"] && uppass_form["realflag"] ){
		$.post(
			"/update_password",{password:$("#newpassword").val()},
			function(data){
				if(data.success == 1){
					$.psfInfoDialog("修改成功",2000);
					$("#edit_pwd").psfDialogClose();
				} else {
					$.psfInfoDialog(data.info,2000);
				}
			},"json");
	} else{}
	
}
</script>
<div id="shortcut">

	<div id="shortcut_wrap">
        <ul class="cutleft">
            <li>${shortcutLoginString}</li>
            <li class="icon"><em></em><a href="/mall">品上商城</a></li>
            <li class="icon icon_home"><em></em><a href="/sns">社区广场</a></li>
        </ul>
        
        <div class="cutright">
            <div id="mypsfmenubutton" class="morebtn morebtn_on">
            	<a class="more" href="javascript:void(0)">我的品上<em></em></a>
                <ul id="mypsfmenu" style="display:none">
                    <li><a href="#">我的订单</a></li>
                    <li><a href="#">我的团购</a></li>
                    <li><a href="#">我的收藏</a></li>
                    <li><a href="/sns/wealth">我的财富</a></li>
                </ul>
            </div>
            
            <div class="minishopbar">
            	<div id="shopcartbutton"  class="buy">
                	<em></em>
                    <div onclick="window.location.href='/cart';">购物车 <b id="shopCartCount">${goods_count}</b> 件</div>
                    <div id="shopCart" class="shopcar" style="display:none;">
                    	
					</div>
                </div>
                
                <a href="/cart" class="calc">
                	<em></em>结算
                </a>
            </div>
            
            <div class="link">
            	<a id="myinfobutton" href="javascript:void(0)">消息</a> | 
            	<a href="javascript:void(0)">投诉建议</a> | 
            	<a href="#">帮助中心</a>
            </div>
        </div>
        
    </div>
</div>
<!-- 修改密码 -->
<div id="edit_pwd" class="dialog_editpwd dialogtitle" style="display:none;">
	<dl class="tab03">
	<dd>
		<h3 style="float: left">密码管理</h3>
	</dd>
	<dt class="layerClose">
	<a class="close" href="javascript:void(0)"></a>
	</dt>
	</dl>
	<p class="point">密码由6-16个字符组成,为了您的账号安全,禁止使用全数字,全字母或者连接字符作为密码</p>
	<div class="send_msg">
		<form id="sendMsgForm">
			<div class="send_msg_title">
				<h6>当前密码：</h6>
				<p>
					<input type="text" name="nowpassword" id="nowpassword" />
					<span class="rightpoint" id="nowpasswordinfo"></span>
				</p>
			</div>
			<div class="send_msg_title">
				<h6>新密码：</h6>
				<p>
					<input type="text" name="newpassword" id="newpassword" />
					<span class="rightpoint" id="newpasswordinfo"></span>
				</p>
			</div>
			<div class="send_msg_title">
				<h6>确认新密码：</h6>
				<p>
					<input type="text" name="realnewpassword" id="realnewpassword"/>
					<span class="rightpoint" id="realnewpasswordinfo"></span>
				</p>
			</div>
			<div class="send_msg_buttons">
				<a class="psf_dialog_button" href="javascript:void(0)" onclick="submitUpdatePassword()">提交</a>
			</div>
		</form>
	</div>
</div>
<!-- 购物车 -->