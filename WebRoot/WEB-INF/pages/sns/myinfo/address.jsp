<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>收货地址</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		initZone();
		initUpdateZone();
		$(".shouhuo .close").css("cursor","pointer").click(function(){
			$(this).parents(".shouhuo").psfDialogClose();
		});
	});
	
	var zones = ${zones};
	function findZoneById(zoneid) {
		for(var i=0;i<zones.length;i++) {
			if(zones[i].zoneid==zoneid) return zones[i];
		}
		return null;
	}
	function initZone() {
		$("select[name='address_provice']").append("<option value='0'>-请选择-</option>");
		$("select[name='address_city']").append("<option value='0'>-请选择-</option>");
		$.each(zones,function(i,zone){
			$("select[name='address_provice']").append("<option value='"+zone.zoneid+"'>"+zone.zonename+"</option>");
		});
		
		$("select[name='address_provice']").change(function(){
			var zoneid = $(this).val();
			var zone = findZoneById(parseInt(zoneid));
			$("select[name='address_city']").empty();
			$("select[name='address_city']").append("<option value='0'>-请选择-</option>");
			$.each(zone.children,function(i,z){
				$("select[name='address_city']").append("<option value='"+z.zoneid+"'>"+z.zonename+"</option>");
			});
		});
	}
	function initUpdateZone() {
		$("select[name='newaddress_provice']").append("<option value='0'>-请选择-</option>");
		$("select[name='newaddress_city']").append("<option value='0'>-请选择-</option>");
		$.each(zones,function(i,zone){
			$("select[name='newaddress_provice']").append("<option value='"+zone.zoneid+"'>"+zone.zonename+"</option>");
		});
		
		$("select[name='newaddress_provice']").change(function(){
			var zoneid = $(this).val();
			var zone = findZoneById(parseInt(zoneid));
			$("select[name='newaddress_city']").empty();
			$("select[name='newaddress_city']").append("<option value='0'>-请选择-</option>");
			$.each(zone.children,function(i,z){
				$("select[name='newaddress_city']").append("<option value='"+z.zoneid+"'>"+z.zonename+"</option>");
			});
		});
	}

	function openAddAddress(){
		var dialogId = $("#addAddress").psfDialog({"modal":true,"center":true});
	}

	function saveAddress(){
		var consignee = $("#consignee").val();
		var address_city = $("select[name='address_city']").val();
		var address = $("#address").val();
		var telnum1 = $("#telnum1").val();
		var telnum2 = $("#telnum2").val();
		var phone = $("#phone").val();
		var reg1 = /^[0-9]{3,4}$/;
		var reg2 = /^[0-9]{7,8}$/;
		var reg3 = /^[0-9]{11}$/;
		if(consignee.length == 0){
			$.psfInfoDialog("填写收货人",2000);
		} else if(address_city == 0) {
			$.psfInfoDialog("选择所在地区",2000);
		} else if(address.length == 0) {
			$.psfInfoDialog("填写收货地址",2000);
		} else if( telnum1.length == 0 && telnum2.length == 0 && phone.length == 0) {
			$.psfInfoDialog("至少填写一个电话",2000);
		} else if (telnum1.length != 0 && !reg1.test(telnum1)) {
			$.psfInfoDialog("区号有误",2000);
		} else if (telnum1.length != 0 && telnum2.length == 0) {
			$.psfInfoDialog("填写电话号码",2000);
		} else if(telnum2.length !=0 && !reg2.test(telnum2)) {
			$.psfInfoDialog("电话号码有误",2000);
		} else if (telnum2.length !=0 && telnum1.length == 0) {
			$.psfInfoDialog("填写区号",2000);
		}  else if( phone.length !=0 && !reg3.test(phone)) {
			$.psfInfoDialog("手机号有误",2000);
		} else {
			$.post(
				"/sns/myinfo/save_address",$("#addAddressForm").serialize(),
				function(data) {
					if(data.success == 1){
						$.psfInfoDialog("添加成功",2000);
						$("#addedCount").text(parseInt($("#addedCount").text())+1);
						$("#toAddCount").text($("#toAddCount").text()-1);
						$("#addressTable").append("<tr class='' id='address_"+data.addressid+"'><td id='consignee_"+data.addressid+"'>"+consignee+"</td>"+
			              							 "<td id='zonename_"+data.addressid+"'>"+data.zonename+"</td>"+
			              							 "<td id='addressinfo_"+data.addressid+"'>"+address+"</td>"+
			              							 "<td id='phone1_"+data.addressid+"'>"+data.tel+"</td>"+
			              							 "<td id='phone2_"+data.addressid+"'>"+phone+"</td>"+
			              							 "<td><a href='javascript:openUpdateAddress("+data.addressid+");'>编辑</a> / <a href='javascript:delAddress("+data.addressid+");'>删除</a></td>"+
			              							 "<td><input type='radio' name='DefaultAddress' id='DefaultAddress' value='"+data.addressid+"'/></td></tr>");
						$("#addAddress").psfDialogClose();
					} else {
						$.psfInfoDialog(data.info,2000);
					}
				},"json"
			);
		}
	}

	function saveDefault(){
		var obj=document.getElementsByName("DefaultAddress");
		var addressid = "";
		for (i=0;i<obj.length;i++){ 
			if(obj[i].checked){
				addressid = obj[i].value;
			} 
		}

		$.post(
			"/sns/myinfo/set_default_address","addressid="+addressid,
			function(data){
				if(data.success == 1){
					$("#saveSuccess").psfDialog({"modal":true,"center":true});
					$("#saveSuccess").find("#ok").click(function(){
						$("#saveSuccess").psfDialogClose();
					});
				} else {
					$.psfInfoDialog(data.info,2000);
				}
			},"json"
		);
	}

	function delAddress(addressid) {
		if(confirm("确定删除?")){
			$.post(
					"/sns/myinfo/del_address","addressid="+addressid,
					function(data){
						if(data.success == 1){
							$.psfInfoDialog("删除成功",2000);
							$("#address_"+addressid).remove();
							$("#addedCount").text($("#addedCount").text()-1);
							$("#toAddCount").text(parseInt($("#toAddCount").text())+1);
						} else {
							$.psfInfoDialog(data.info,2000);
						}
					},"json"
			);
		}
	}
	function openUpdateAddress(addressid){
		var dialogId = $("#updateAddress").psfDialog({"modal":true,"center":true});
		$("#newconsignee").val($("#consignee_"+addressid).text());
		$("#newaddress").val($("#addressinfo_"+addressid).text());
		$("#addressid").val(addressid);
		$("#newphone").val($("#phone2_"+addressid).text());

		$("select[name='newaddress_provice']").val($("#parentzoneid_"+addressid).val());
		$("select[name='newaddress_provice']").change();
		$("select[name='newaddress_city']").val($("#zoneid_"+addressid).val());
		
		var tel = $("#phone1_"+addressid).text();
		if(tel.length == 0){
			$("#newtelnum1").val("");	
			$("#newtelnum2").val("");
			$("#newtelnum3").val("");
		} else {
			var phones = tel.split("-");
			$("#newtelnum1").val(phones[0]);
			$("#newtelnum2").val(phones[1]);
			if(phones[2] != "undefined" && phones[2] != null && phones[2].length != 0){
				$("#newtelnum3").val(phones[2]);
			} else {
				$("#newtelnum3").val("");
			}
		}
	}
	function saveUpdateAddress(){
		var consignee = $("#newconsignee").val();
		var address_city = $("select[name='newaddress_city']").val();
		var address = $("#newaddress").val();
		var telnum1 = $("#newtelnum1").val();
		var telnum2 = $("#newtelnum2").val();
		var telnum3 = $("#newtelnum3").val();
		var phone = $("#newphone").val();
		var reg1 = /^[0-9]{3,4}$/;
		var reg2 = /^[0-9]{7,8}$/;
		var reg3 = /^[0-9]{11}$/;
		if(consignee.length == 0){
			$.psfInfoDialog("填写收货人",2000);
		} else if(address_city == 0) {
			$.psfInfoDialog("选择所在地区",2000);
		} else if(address.length == 0) {
			$.psfInfoDialog("填写收货地址",2000);
		} else if( telnum1.length == 0 && telnum2.length == 0 && phone.length == 0) {
			$.psfInfoDialog("至少填写一个电话",2000);
		} else if (telnum1.length != 0 && !reg1.test(telnum1)) {
			$.psfInfoDialog("区号有误",2000);
		} else if (telnum1.length != 0 && telnum2.length == 0) {
			$.psfInfoDialog("填写电话号码",2000);
		} else if(telnum2.length !=0 && !reg2.test(telnum2)) {
			$.psfInfoDialog("电话号码有误",2000);
		} else if (telnum2.length !=0 && telnum1.length == 0) {
			$.psfInfoDialog("填写区号",2000);
		}  else if( phone.length !=0 && !reg3.test(phone)) {
			$.psfInfoDialog("手机号有误",2000);
		} else {
			$.post(
				"/sns/myinfo/update_address",$("#updateAddressForm").serialize(),
				function(data) {
					if(data.success == 1){
						$("#consignee_"+data.addressid).text(consignee);
						$("#zonename_"+data.addressid).text(data.zonename);
						$("#addressinfo_"+data.addressid).text(address);
						if(telnum1.length != 0 && telnum2.length != 0 && telnum3.length != 0){
							$("#phone1_"+data.addressid).text(telnum1+"-"+telnum2+"-"+telnum3);
						} else if(telnum1.length != 0 && telnum2.length != 0) {
							$("#phone1_"+data.addressid).text(telnum1+"-"+telnum2);
						}
						$("#phone2_"+data.addressid).text(phone);
						$.psfInfoDialog("修改成功",2000);
						$("#updateAddress").psfDialogClose();						
					} else {
						$.psfInfoDialog(data.info,2000);
					}
				},"json"
			);
		}
	}
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
			<p class="title navclass"><b>您目前的收货地址有（<a href="#" class="redText" id="addedCount">${addedCount }</a>）个地址，您还再添加（<a href="#" class="redText" id="toAddCount">${toAddCount }</a>）个</b></p>
			<p class="senTitle navclass">请定期维护您的收货地址，确保您的财产安全。</p>
		</div>
		<div class="right"><input type="button" class="bankaddbtn" value="+添加收货地址" onclick="openAddAddress()"/></div>
		 <table width="100%" border="1" cellpadding="1" cellspacing="0" rules="rows" class="myTable" >
	          <tbody style="background:#EBF2C8;">
	          <tr class="green">
	          <td>收货人</td>
              <td>所在地区</td>
              <td>街道地址</td>
              <td>电话</td>
              <td>手机</td>
              <td>操作</td>
              <td>默认地址</td>
	          </tr>
	          </tbody>
			  <c:forEach items="${addressList}" var="address">
		          <tr id="address_${address.addressid }">
					  <input type="hidden" id="zoneid_${address.addressid }" name="zoneid_${address.addressid }" value="${address.expresszoneid }" />
					  <input type="hidden" id="parentzoneid_${address.addressid }" name="parentzoneid_${address.addressid }" value="${address.parentZoneid }"/>
			          <td id="consignee_${address.addressid }">${ address.consignee}</td>
		              <td id="zonename_${address.addressid }">${address.zoneName }</td>
		              <td id="addressinfo_${address.addressid }">${address.address }</td>
		              <td id="phone1_${address.addressid }">${address.phone1 }</td>
		              <td id="phone2_${address.addressid }">${address.phone2 }</td>
		              <td><a href="javascript:openUpdateAddress(${address.addressid });">编辑</a> / <a href="javascript:delAddress(${address.addressid });">删除</a></td>
		              <td>
						<c:if test="${address.isdefault eq 0}"><input type="radio" name="DefaultAddress" id="DefaultAddress" value="${address.addressid }"/></c:if>
						<c:if test="${address.isdefault eq 1}"><input type="radio" name="DefaultAddress" id="DefaultAddress" value="${address.addressid }" checked="checked"/></c:if>
					  </td>
		          </tr>
		      </c:forEach>
			<tfoot id="addressTable"></tfoot>
          </table>
         <br/><br/>
			<center><input type="button" class="saveBtn" value="保存设置"  onclick="saveDefault();"/></center>
		  <!-- 添加收货地址 -->
          <div class="shouhuo" style="display:none" id="addAddress">
			<form id="addAddressForm">
             <div class="green" >
             	<strong class="left"> 添加收货地址信息</strong>
             	<div class="layerClose">
				<a class="close" style="margin-top:5px;right:3px;"></a>
				</div>
			</div>
             <div class="shouhuobox">
             <dl class="addaddress">
             	<dd><span class="bankrow left"> 收 货 人：</span><input type="text" class="consignee"  id="consignee" name="consignee"/></dd>
             	<dd><span class="bankrow left">所在地区：</span>  
					<select name="address_provice"></select>省
					<select name="address_city"></select>市
				</dd>
             	<dd><span class="bankrow left">街道地址：</span><input type="text" class="userinsert" id="address" name="address"/></dd>
             <!--  <dd><span class="bankrow left">邮政编码：</span><input type="text" class="consignee" id="post" name="post"/></dd>-->	
             	<dd><span class="bankrow left">电话号码：</span><input type="text" class="phoneNo" id="telnum1" name="telnum1"/>-<input type="text" class="consignee" id="telnum2" name="telnum2"/>-<input type="text" class="phoneNo" id="telnum3" name="telnum3"/></dd>
             	<dd><span class="bankrow left">手机号码：</span><input type="text" class="consignee" id="phone" name="phone"/></dd>
             </dl>
             <center><input type="button" class="addbtn" value="确认无误，提交"  onclick="saveAddress();"/></center>
             </div>
			</form>
          </div>
		  <!-- 编辑收货地址 -->
          <div class="shouhuo" style="display:none" id="updateAddress">
			<form id="updateAddressForm">
			<input type="hidden" id="addressid" name="addressid" value="" />
             <div class="green" >
             	<strong class="left"> 编辑收货地址信息</strong>
             	<div class="layerClose">
				<a class="close" style="margin-top:5px;right:3px;"></a>
				</div>
             </div>
             <div class="shouhuobox">
             <dl class="addaddress">
             	<dd><span class="bankrow left"> 收 货 人：</span><input type="text" class="consignee"  id="newconsignee" name="newconsignee" value=""/></dd>
             	<dd><span class="bankrow left">所在地区：</span>  
					<select name="newaddress_provice"></select>省
					<select name="newaddress_city"></select>市
				</dd>
             	<dd><span class="bankrow left">街道地址：</span><input type="text" class="userinsert" id="newaddress" name="newaddress" value=""/></dd>
             	<dd><span class="bankrow left">电话号码：</span><input type="text" class="phoneNo" id="newtelnum1" name="newtelnum1" value=""/>-<input type="text" class="consignee" id="newtelnum2" name="newtelnum2" value=""/>-<input type="text" class="phoneNo" id="newtelnum3" name="newtelnum3" value=""/></dd>
             	<dd><span class="bankrow left">手机号码：</span><input type="text" class="consignee" id="newphone" name="newphone" value=""/></dd>
             </dl>
             <center><input type="button" class="addbtn" value="确认无误，提交"  onclick="saveUpdateAddress();"/></center>
             </div>
			</form>
          </div>
	</div>
	<div class="addjob" style="display:none" id="saveSuccess">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的资料保存成功！</div>
        <center><input type="submit" value="确 定" class="savebtn" id="ok" /></center>
                                                
     </div>
	</div>
</body>
</html>