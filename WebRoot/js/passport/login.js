function submitLoginForm() {
	$("#info").text("正在发送请求...");
	$.post(
		$("#loginForm").attr("action"),
		$("#loginForm").serialize(),
		function(data) {
			if(data.success==1) {
				$("#info").text("登录成功，正在跳转页面...");
				window.location.href = '/sns';
			} else {
				$("#info").text(data.info);
				$.psfInfoDialog(data.info,2000);
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