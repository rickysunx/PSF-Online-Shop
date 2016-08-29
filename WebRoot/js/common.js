function closeCartDialog() {
	$("#cartDialog").psfDialogClose();
}

function refreshCartCount() {
	$.post("/action/mall/get_cart_count",null,function(data){
		if(data.goods_count) {
			$("#shopCartCount").text(data.goods_count);
		} else {
			
		}
	},"json");
}

function addToCart() {
	var checkAttrPass = true;
	var attr_name = null;
	$.each(attrList,function(i,attr){
		var selected = false;
		
		$.each($("#goodsBuyAttrContainer > input"),function(j,input){
			if($(input).attr("attr_id")==attr.attr_id) {
				selected = true;
			}
		});
		if(!selected) checkAttrPass = false;
		if(!checkAttrPass) {
			attr_name = attr.attr_name;
			return false;
		}
	});
	
	if(!checkAttrPass) {
		alert("请先选择["+attr_name+"]！");
		return;
	}
	
	$.post("/action/mall/add_to_cart",
		$("#goodsBuyForm").serialize(),
		function(data){
			if(data.success==1) {
				$("#cartDialog").psfDialog({"center":true,"modal":true});
				refreshCartCount();
			} else {
				alert(data.info);
			}
		},
		"json");
}

function changeCartGoodsAmount(pid,inputid,reloadPage,plusValue) {
	var pcount = parseInt($("#"+inputid).val());
	if(plusValue) {
		pcount+=plusValue;
	}
	$.post("/action/mall/update_cart_amount",{"pid":pid,"pcount":pcount},function(data){
		if(data.success==1) {
			$("#"+inputid).val(pcount);
			if(reloadPage) {
				window.location.reload();
			} else {
				reloadFloatCartList();
			}
		} else {
			alert("数量改变失败："+data.info);
		}
	},"json");
}

function removeFromCart(pid,reloadPage) {
	if(confirm("真的要从购物车中删除该商品吗？")) {
		$.post("/action/mall/remove_form_cart",{"pid":pid},function(data){
			if(data.success==1) {
				if(reloadPage) {
					window.location.reload();
				} else {
					reloadFloatCartList();
				}
			} else {
				alert(data.info);
			}
		},"json");
	}
}

function moveToLike(pid,reloadPage) {
	$.post("/action/mall/move_to_like",{"pid":pid},function(data){
		if(data.success==1) {
			$.psfInfoDialog("成功加入收藏");
		} else {
			alert(data.info);
		}
	},"json");
}

function closeLoginDialog() {
	$("#psfLoginDialog").psfDialogClose();
}

function openLoginDialog(redirectURL) {
	if($("#psfLoginDialog").length==0) {
		$("body").append("<div id='psfLoginDialog'></div>");
		$("#psfLoginDialog").load("/action/get_login_dialog",null,function(data){
			$("#psfLoginDialog").psfDialog({"center":true,"modal":true});
			function submitLoginForm() {
				$("#info").text("正在发送请求...");
				$.post(
					$("#loginForm").attr("action"),
					$("#loginForm").serialize(),
					function(data) {
						if(data.success==1) {
							$("#info").text("登录成功，正在跳转页面...");
							window.location.href = redirectURL;
						} else {
							$("#info").text(data.info);
							alert(data.info);
						}
					},
					"json"
				);
			}

			$(document).ready(function(){
				$("#loginSubmitButton").click(function(){
					submitLoginForm();
				});
				$("#loginUserName").keypress(function(event){
					if(event.keyCode==13) {
						$("#loginUserPass").focus();
					}
				});
				$("#loginUserPass").keypress(function(event){
					if(event.keyCode==13) {
						submitLoginForm();
					}
				});
				$("#loginUserName").focus();
			});
		});
	} else {
		$("#psfLoginDialog").psfDialog({"center":true,"modal":true});
	}
	
	
}

function changeCaptcha0() {
	$("#captchaImg").attr("src","/captcha?t="+Math.random());
}
