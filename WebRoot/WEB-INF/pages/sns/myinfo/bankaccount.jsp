<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>银行账户</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>

<script type="text/javascript">
	function openAddBankAccount(){
		$("#addBankAccount").psfDialog({"modal":true,"center":true});
	}
	function saveBankAccount(){
		var bankname = $("#bankname").val();
		var accountcode = $("#accountcode").val();
		var accountname = $("#accountname").val();
		var reg1 = /^[0-9]{19}$/;
		var reg2 = /^[0-9]{16}$/;
		var reg3 = /^[\u0391-\uFFE5]+$/;
		if(bankname.length == 0){
			$.psfInfoDialog("请填写开户银行",2000);
		} else if (accountcode.length == 0){
			$.psfInfoDialog("请填写银行账户",2000);
		} else if(accountname.length == 0) {
			$.psfInfoDialog("请填写开户姓名",2000);
		} else if(!reg1.test(accountcode) && !reg2.test(accountcode)){
			$.psfInfoDialog("银行账户有误",2000);
		} else if(!reg3.test(bankname)) {
			$.psfInfoDialog("开户银行有误",2000);
		} else if(!reg3.test(accountname)){
			$.psfInfoDialog("开户姓名有误",2000);
		} else {
			$.post(
					"/sns/myinfo/save_bankaccount",$("#saveBankAccountForm").serialize(),
					function(data){
						if(data.success == 1){
							$("#accountTable").append("<tr id='bankinfo_"+data.accountid+"'><td>"+bankname+"</td><td>"+accountcode+"</td><td>"+accountname+"</td><td><a href=''>编辑</a> / <a href='javascript:delBankAccount("+data.accountid+");'>删除</a></td></tr>");
							$("#addBankAccount").psfDialogClose();
						} else {
					//		$.psfInfoDialog(data.info,2000);
						}
					},"json"
				);
		}
	}
	function delBankAccount(accountid){
		if(confirm("确定要删除？")){
			$.post(
				"/sns/myinfo/del_bankaccount","accountid="+accountid,
				function(data){
					if(data.success == 1){
						$.psfInfoDialog("删除成功",2000);
						$("#bankinfo_"+accountid).remove();
					} else {
						$.psfInfoDialog(data.info,2000);
					}
				},"json"
			);
		}
	}
	function openUpdateBankAccount(accountid){
		$("#updateBankAccount").psfDialog({"modal":true,"center":true});
		$("#newbankname").val($("#bankname_"+accountid).text());
		$("#newaccountcode").val($("#accountcode_"+accountid).text());
		$("#newaccountname").val($("#accountname_"+accountid).text());
		$("#accountid").val(accountid);
	}
	function saveUpdateBankAccount(){
		var bankname = $("#newbankname").val();
		var accountcode = $("#newaccountcode").val();
		var accountname = $("#newaccountname").val();
		var accountid = $("#accountid").val();
		var reg1 = /^[0-9]{19}$/;
		var reg2 = /^[0-9]{16}$/;
		var reg3 = /^[\u0391-\uFFE5]+$/;
		if(bankname.length == 0){
			$.psfInfoDialog("请填写开户银行",2000);
		} else if (accountcode.length == 0){
			$.psfInfoDialog("请填写银行账户",2000);
		} else if(accountname.length == 0) {
			$.psfInfoDialog("请填写开户姓名",2000);
		} else if(!reg1.test(accountcode) && !reg2.test(accountcode)){
			$.psfInfoDialog("银行账户有误",2000);
		} else if(!reg3.test(bankname)) {
			$.psfInfoDialog("开户银行有误",2000);
		} else if(!reg3.test(accountname)){
			$.psfInfoDialog("开户姓名有误",2000);
		} else {
			$.post(
					"/sns/myinfo/update_bankaccount",$("#updateBankAccount").serialize(),
					function(data){
						if(data.success == 1){
							$("#bankname_"+accountid).text(bankname);
							$("#accountcode_"+accountid).text(accountcode);
							$("#accountname_"+accountid).text(accountname);
							$("#updateBankAccount").psfDialogClose();
						} else {
							$.psfInfoDialog(data.info,2000);
						}
					},"json"
				);
		}
	}
	$(document).ready(function(){
		$("#addBankAccount .layerClose .close").click(function(){
			$("#addBankAccount").psfDialogClose();
		});
		$("#updateBankAccount .layerClose .close").click(function(){
			$("#updateBankAccount").psfDialogClose();
		});
	});
</script>

</head>

<body>
<psf:shortcut/>

<div id="html_wrap">
	<psf:snsHeader/>
	<psf:snsTab/>
	<psf:include page="/sns/myinfo/tab.jsp"/>
	<div class="jobtime">
		<div class="left">
			<p class="title navclass"><b>银行账户:</b>关联您在品上丰的购物支付权限，定期维护自己的账号有助于账号安全。</p>
			<p class="senTitle navclass">您已关联了（<b><a href="#" class="redText">1</a></b>）个银行账号信息，请保管好您的账户信息,做好信息维护</p>
		</div>
		<div class="right"><input type="button" class="bankaddbtn" value="+添加银行账户" onclick="openAddBankAccount();"/></div>
		 <table width="100%" border="1" cellpadding="1" cellspacing="0" rules="rows" class="myTable">
	          <tbody style="background:#EBF2C8;">
	          <tr class="green">
	          <td><strong>开户行名称</strong></td>
	          <td><strong>银行卡卡号</strong></td>
	          <td><strong>姓名</strong></td>
	          <td><strong>操作</strong></td>
	          </tr>
	          </tbody>
			  <c:if test="${empty accountList}"><tr><td colspan="4">您还没有填写账户信息</td></tr></c:if>
			  <c:forEach items="${accountList}" var="account">
				  <tr id="bankinfo_${account.accountid }">
		          	<td id="bankname_${account.accountid }">${account.bankname }</td>
		          	<td id="accountcode_${account.accountid }">${account.accountcode }</td>
		          	<td id="accountname_${account.accountid }">${account.accountname }</td>
		          	<td><a href="javascript:openUpdateBankAccount(${account.accountid });">编辑</a> / <a href="javascript:delBankAccount(${account.accountid });">删除</a></td>
		          </tr>
			  </c:forEach>
			<tfoot id="accountTable"></tfoot>
          </table>


		<!-- 添加账户 -->
          <div class="shouhuo" id="addBankAccount" style="width:640px;height:290px;display: none">
             <div class="green" >
             	<strong class="left"> 添加银行账号信息</strong>
             	<span class=" right" style="margin-right:25px;">提示：请如实填写银行账户信息，否则造成的后果品上丰不予解释</span>
             	<div class="layerClose">
				<a class="close" style="margin-top: 5px; right: 3px; cursor: pointer;"></a>
				</div>
             </div>
             <div class="shouhuobox">
             <p class="redText"><strong>品上丰声明：</strong><br />北京品上丰信息有限公司工作人员不会在任何情况下向用户索取银行账号相关资料，账号相关信息由用户输入并牢记，不要轻易告诉他人或者泄露您的信息，如遇到问题，请按照正规流程找回信息或者拨打品上丰官方客服电话：<strong>400-800-1234</strong> 进行申诉找回，我们将竭诚为您服务。谨防上当受骗。</p>
            <form action="" id="saveBankAccountForm">
				<dl class="addblank">
	             	<dd><span class="bankrow left">开户银行：</span><input type="text" class="userinsert left" id="bankname" name="bankname"/><span class="senTitle">开户行为中国境内包括港、澳、台地区主要开放的银行机构，不含国外银行</span></dd>
	             	<dd><span class="bankrow left">银行账号：</span><input type="text" class="userinsert left" id="accountcode" name="accountcode"/><span class="senTitle">银行卡的正面或者背面的识别该卡的号码串</span></dd>
	             	<dd><span class="bankrow left">开户姓名：</span><input type="text" class="userinsert left" id="accountname" name="accountname"/><span class="senTitle">用户在开通银行时向银行提供的姓名(真实姓名)</span></dd>
	             
	             </dl>
			</form> 
             <center><input type="button" class="addbtn" value="确认无误，提交" onclick="saveBankAccount();"/></center>
             </div>
          </div>
		<!-- 编辑账户 -->
          <div class="shouhuo" id="updateBankAccount" style="width:640px;height:290px;display: none">
             <div class="green" >
             	<strong class="left"> 编辑银行账号信息</strong>
             	<span class=" right" style="margin-right:25px;">提示：请如实填写银行账户信息，否则造成的后果品上丰不予解释</span>
             	<div class="layerClose">
				<a class="close" style="margin-top: 5px; right: 3px; cursor: pointer;"></a>
				</div>
             </div>
             <div class="shouhuobox">
             <p class="redText"><strong>品上丰声明：</strong><br />北京品上丰信息有限公司工作人员不会在任何情况下向用户索取银行账号相关资料，账号相关信息由用户输入并牢记，不要轻易告诉他人或者泄露您的信息，如遇到问题，请按照正规流程找回信息或者拨打品上丰官方客服电话：<strong>400-800-1234</strong> 进行申诉找回，我们将竭诚为您服务。谨防上当受骗。</p>
            <form action="" id="updateBankAccountForm">
				<dl class="addblank">
					<dd><input type="hidden" id="accountid" name="accountid" value="" /></dd>
	             	<dd><span class="bankrow left">开户银行：</span><input type="text" class="userinsert left" id="newbankname" name="newbankname" value=""/><span class="senTitle">开户行为中国境内包括港、澳、台地区主要开放的银行机构，不含国外银行</span></dd>
	             	<dd><span class="bankrow left">银行账号：</span><input type="text" class="userinsert left" id="newaccountcode" name="newaccountcode" value=""/><span class="senTitle">银行卡的正面或者背面的识别该卡的号码串</span></dd>
	             	<dd><span class="bankrow left">开户姓名：</span><input type="text" class="userinsert left" id="newaccountname" name="newaccountname" value=""/><span class="senTitle">用户在开通银行时向银行提供的姓名(真实姓名)</span></dd>
	             
	             </dl>
			</form> 
             <center><input type="button" class="addbtn" value="确认无误，提交" onclick="saveUpdateBankAccount();"/></center>
             </div>
          </div>
	</div>
</div>
</body>
</html>