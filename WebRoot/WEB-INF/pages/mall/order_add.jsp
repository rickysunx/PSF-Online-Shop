<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>确认订单信息</title>
<psf:header />
<link href="/css/mall.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var allRegionList = ${jsonExpressRegion};
var currAddressPage = 1;
var addressList = [];

function findRegion(region_id,regionList) {
	if(regionList==undefined) regionList = allRegionList;
	var i;
	for(i=0;i<regionList.length;i++) {
		var region = regionList[i];
		if(region.region_id==region_id) {
			return region;
		} else {
			if(region.children) {
				var result = findRegion(region_id,region.children);
				if(result) return result;
			}
		}
	}
	return null;
}

function getRegionName(region_id) {
	var region =findRegion(region_id);
	return region==null?"":region.region_name;
}

$(document).ready(function(){
	
	loadAddressList();
	
	var province_select = $("#orderForm").find("select[name='province']");
	var province_html = "<option value='0'>-请选择省份-</option>";
	$.each(allRegionList,function(i,r){
		province_html += "<option value='"+r.region_id+"'>"+r.region_name+"</option>";
	});
	province_select.html(province_html);
	
});

function onProvinceChange() {
	var province_id = $("#orderForm").find("select[name='province']").val();
	var province_region = findRegion(province_id);
	var html = "<option value='0'>-请选择市-</option>";
	if(province_region) {
		$.each(province_region.children,function(i,r){
			html+="<option value='"+r.region_id+"'>"+r.region_name+"</option>";
		});
	}
	var city_select = $("#orderForm").find("select[name='city']");
	city_select.html(html);
	
	var district_select = $("#orderForm").find("select[name='district']");
	district_select.html("<option value='0'>-请选择区县-</option>");
}

function onCityChange() {
	var city_id = $("#orderForm").find("select[name='city']").val();
	var city_region = findRegion(city_id);
	var html = "<option value='0'>-请选择区县-</option>";
	if(city_region) {
		$.each(city_region.children,function(i,r){
			html+="<option value='"+r.region_id+"'>"+r.region_name+"</option>";
		});
	}
	var district_select = $("#orderForm").find("select[name='district']");
	district_select.html(html);
}

function editAddress() {
	$("#addressContent").hide();
	$("#addressList").show();
	$("#addressAction").text("[关闭]");
	$("#addressAction").attr("href","javascript:closeAddress();");
}

function closeAddress() {
	$("#addressList").hide();
	$("#addressContent").show();
	$("#addressAction").text("[修改]");
	$("#addressAction").attr("href","javascript:editAddress();");
}

function toggleInvoiceInfo() {
	var display = $("#invoiceInfo").css("display");
	if(display=='none') {
		$("#invoiceInfo").show();
		$("#invoiceAction").addClass("more_btn");
	} else {
		$("#invoiceInfo").hide();
		$("#invoiceAction").removeClass("more_btn");
	}
}

function confirmInvoice() {
	toggleInvoiceInfo();
}

function confirmAddress() {
	var consignee = $("#orderForm").find("input[name='consignee']").val();
	var province = $("#orderForm").find("select[name='province']").val();
	var city = $("#orderForm").find("select[name='city']").val();
	var district = $("#orderForm").find("select[name='district']").val();
	var address = $("#orderForm").find("textarea[name='address']").val();
	var mobile = $("#orderForm").find("input[name='mobile']").val();
	var tel = $("#orderForm").find("input[name='tel']").val();
	var zipcode = $("#orderForm").find("input[name='zipcode']").val();
	
	if(consignee.trim()=="") {
		alert("请输入收货人");
		return;
	}
	
	if(province==0) {
		alert("请选择省份");
		return;
	}
	
	if(city==0) {
		alert("请选择市");
		return;
	}
	
	if(district==0) {
		alert("请选择区县");
		return;
	}
	
	if(address.trim()==0) {
		alert("请输入地址");
		return;
	}
	
	if(mobile.trim()==0) {
		alert("请输入手机号");
		return;
	}
	
	var html = "";
	html+="<p>收 货 人："+consignee+"</p>";
	html+="<p>省　　份："+getRegionName(province)+" "+getRegionName(city)+" "+getRegionName(district)+"</p>";
	html+="<p>地　　址："+address+"</p>";
	html+="<p>手机号码："+mobile+"</p>";
	html+="<p>固定电话："+tel+"</p>";
	html+="<p>邮政编码："+zipcode+"</p>";
	
	$("#addressContent").html(html);
	
	$("#orderForm").find("input[name='consignee0']").val(consignee);
	$("#orderForm").find("input[name='province0']").val(province);
	$("#orderForm").find("input[name='city0']").val(city);
	$("#orderForm").find("input[name='district0']").val(district);
	$("#orderForm").find("input[name='address0']").val(address);
	$("#orderForm").find("input[name='mobile0']").val(mobile);
	$("#orderForm").find("input[name='tel0']").val(tel);
	$("#orderForm").find("input[name='zipcode0']").val(zipcode);
	
	
	closeAddress();
	
	$("#expressDiv").show();
	$("#checkOutDiv").show();
	$("#submitDiv").show();
}

function setDefaultAddress(addressid) {
	$.post("/action/order/set_default_address",{"addressid":addressid},function(data){
		loadAddressList();
	},"json"); 
}

function loadAddressList(page,callback) {
	if(page==undefined) page = 1;
	$("#addressItemList").load("/action/order/get_address",{"page":page},callback);
}

function addressPageUp() {
	if(currAddressPage==1) {
		alert("已经是第一页");
	} else {
		loadAddressList(currAddressPage-1);
	}
}

function addressPageDown() {
	loadAddressList(currAddressPage+1);
}

function checkAddressRadio(addressid) {
	var i;
	var len = addressList.length;
	var addr0 = null;
	for(i=0;i<len;i++) {
		var addr = addressList[i];
		if(addressid==addr.address_id) {
			addr0 = addr;
			break;
		}
	}
	
	$("#addressItemList").find("li").removeClass("current");
	$("#addressItem_0").removeClass("current");
	$("#addressItem_"+addressid).addClass("current");
	
	if(addr0==null) {
		$("#orderForm").find("input[name='consignee']").val("");
		$("#orderForm").find("select[name='province']").val(0);
		onProvinceChange();
		$("#orderForm").find("textarea[name='address']").val("");
		$("#orderForm").find("input[name='zipcode']").val("");
		$("#orderForm").find("input[name='mobile']").val("");
		$("#orderForm").find("input[name='tel']").val("");	
	} else {
		$("#orderForm").find("input[name='consignee']").val(addr0.consignee);
		var province = findRegion(addr0.province);
		var city = findRegion(addr0.city);
		var district = findRegion(addr0.district);
		$("#orderForm").find("select[name='province']").val(province.region_id);
		onProvinceChange();
		$("#orderForm").find("select[name='city']").val(city.region_id);
		onCityChange();
		$("#orderForm").find("select[name='district']").val(district.region_id);
		$("#orderForm").find("textarea[name='address']").val(addr0.address);
		$("#orderForm").find("input[name='zipcode']").val(addr0.zipcode);
		$("#orderForm").find("input[name='mobile']").val(addr0.mobile);
		$("#orderForm").find("input[name='tel']").val(addr0.tel);		
	}
}

function submitOrder() {
	$.post("/action/order/save",$("#orderForm").serialize(),function(data){
		if(data.success==1) {
			window.location.href='/order/success?orderid='+data.orderid;
		} else {
			alert(data.info);
		}
	},"json");
}

</script>
</head>
<body>
	<psf:shortcut />
	<div id="html_wrap">
		<div id="mall_header">
			<div class="top">
				<a id="logo" href="#"><img src="/images/mall/logo.png" alt="" />
				</a> <a href="#"><img src="/images/mall/photo/banner_big2.png" alt="" />
				</a>
			</div>
		</div>
		<div class="order_process_box">
			<ul class="process_header">
				<li>
					<em class="mybuy"></em>
				</li>
				<li class="current">
					<em class="order_confirm"></em>
				</li>
				<li>
					<em class="order_success"></em>
				</li>
				<li>
					<em class="order_post"></em>
				</li>
			</ul>
			<div class="order_confirm_box">
				<dl class="order_prompt">
					<dt></dt>
					<dd>
						<h3>品上丰100提醒您</h3>
						<p>尊敬的客户,您订单中的商品存放在不同仓库中,为确保商品能够快速送达,您下单后系统将对对订单进行自动折分,商品按折分后的子订单分开配送！由此给你带来的不便敬请谅解！</p>
					</dd>
				</dl>
				<form id="orderForm" action="/order/save">
				<div>
					<div class="order_br_box">
						<div class="header">
							<h3>确认收货人信息</h3>
							<a id="addressAction" href="javascript:closeAddress();">[关闭]</a>
						</div>
						<div id="addressContent" class="address_card" style="display:none;">
							<p>收 货 人：</p>
							<p>省　　份：</p>
							<p>地　　址：</p>
							<p>手机号码：</p>
							<p>固定电话：</p>
							<p>邮政编码：</p>
						</div>
						<input name="consignee0" type="hidden"/>
						<input name="province0" type="hidden"/>
						<input name="city0" type="hidden"/>
						<input name="district0" type="hidden"/>
						<input name="address0" type="hidden"/>
						<input name="zipcode0" type="hidden"/>
						<input name="mobile0" type="hidden"/>
						<input name="tel0" type="hidden"/>
						<div id="addressList" class="address_list">
							<div class="title">
								<h5>常用地址</h5>
								<a id="addrPrev" href="javascript:addressPageUp();">上一页</a> &nbsp; 
								<a id="addrNext" href="javascript:addressPageDown();">下一页</a>
							</div>
							<ul id="addressItemList">
								
							</ul>
							<ul>
								<li id="addressItem_0">
									<div class="operations">
										<input onclick="checkAddressRadio(0);" name="userAddress" class="address_radio" type="radio" value="0" checked="checked" />
										<span>使用新地址</span>
									</div>
									<div class="address_form">
										<dl>
											<dt>收货人姓名：</dt>
											<dd>
												<input name="consignee" class="address_input" />
												<div>*</div>
											</dd>
										</dl>
										<dl>
											<dt>所在地区：</dt>
											<dd>
												<select id="area_province" style="width:100px;" onchange="onProvinceChange();" name="province" class="province"></select>
												<label>省</label>
												<select id="area_city" style="width:100px;" onchange="onCityChange();" name="city" class="city"></select>
												<label>市</label>
												<select id="area_district" style="width:100px;" name="district" class="area"></select>
												<label>区</label>
												<div>*</div>
											</dd>
										</dl>
										<dl>
											<dt>街道地址：</dt>
											<dd>
												<textarea name="address"></textarea>
												<div>
													*<span> 不需要重复填写/市/区</span>
												</div>
											</dd>
										</dl>
										<dl>
											<dt>邮政编码：</dt>
											<dd>
												<input name="zipcode" class="code_input" />
												<div>
													<span> 大陆以外地区可不填写</span>
												</div>
											</dd>
										</dl>
										<dl>
											<dt>手机号码：</dt>
											<dd>
												<input name="mobile" class="phone_input" /><font color="#B40000">*</font>
											</dd>
										</dl>
										<dl>
											<dt>电话号码：</dt>
											<dd>
												<input name="tel" class="tele_input" />
												<span>区号－电话号码－分机</span>
											</dd>
										</dl>
										<dl>
											<dt>设为默认：</dt>
											<dd class="checkbox">
												<input type="checkbox" />
												<label>默认地址</label>
											</dd>
										</dl>
										<dl>
											<dt></dt>
											<dd class="buttons">
												<a class="save_address_button" href="javascript:confirmAddress();"></a>
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div id="expressDiv" class="address_detail" style="display:none;">
						<div class="address_left">
							<dl>
								<dt>送货上门时间：</dt>
								<dd>
									<select name="expressTime">
										<option value="0">工作日和节假日均可</option>
										<option value="1">尽量工作日送</option>
										<option value="2">尽量节假日送</option>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>快递备注：</dt>
								<dd>
									<textarea name="expressNote"></textarea>
								</dd>
							</dl>
						</div>
						<div class="address_right">
							<h5 class="actions">
								<!--a class="more_btn" href="#">发票信息<em></em></a-->
								<a id="invoiceAction" href="javascript:toggleInvoiceInfo();">发票信息<em></em></a>
							</h5>
							<div id="invoiceInfo" class="address_more" style="display:none;">
								<div class="invoice_form">
									<dl>
										<dt>发票抬头：</dt>
										<dd>
											<input name="inv_payee" />
										</dd>
									</dl>
									<dl>
										<dt>发票内容：</dt>
										<dd>
											<input name="inv_content" />
											<a class="yes_button" href="javascript:confirmInvoice();">确定</a>
										</dd>
									</dl>
									<div class="invoice_statement">
										<h5>发票说明：</h5>
										<p>1、由于存在可能的退换货，如您需要发票，请您在订单此处索取发票，我们将在您收到货物7天后，以平邮的方式寄送到您的地址</p>
										<p>2、部分商品供应商可能无法提供发票，品上商城向您保证所有商品均为正品，并建立了500万的品质保证金，承诺假一赔三</p>
									</div>
								</div>
								<!--div class="shopcar">
									<h5>以下商品暂时无法提供发票：</h5>
									<table cellpadding="0">
										<tr>
											<th class="name">商品详情</th>
											<th class="type">购物类型</th>
											<th class="price">成交价</th>
											<th class="scope">赠送积分</th>
											<th class="favor">优惠</th>
											<th class="post">包邮</th>
											<th class="num">数量</th>
										</tr>
										<tr>
											<td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
											<td class="type">普通</td>
											<td class="price">20000.00</td>
											<td class="scope">84</td>
											<td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b>
											</td>
											<td class="post"><em class="yes"></em>
											</td>
											<td class="num numInput">2</td>
										</tr>
									</table>
									<div class="bottom">
										<b>如果您对商品无法提供发票不满意，建议您返回修改</b><a href="/cart"><em></em>购物车&gt;&gt;</a>
									</div>
								</div-->
							</div>
						</div>
					</div>
				</div>
				<div id="checkOutDiv" class="order_br_box" style="display:none;">
					<div class="header">
						<h3>确认结算信息</h3>
					</div>
					<div class="account_info_box">
						<div class="price_total">
							商品总金额:<b>${goodsTotalAmount}</b>元 + 运费<b>${expressAmount}</b>元
							<!-- 享金支出<b>100.00</b>元 - 礼卷支出<b>30.00</b>元 - 积分<b>1000</b>分 抵<b>10.00</b>元-->
							= <b>${totalAmount}</b>元 
						</div>
						<div class="price_detail">
							<div class="total">
								<span><em></em>你现在有享金<b>100</b>元，礼卷<b>50</b>元、积分<b>3000</b>分可以抵消全部或部分消费金额</span>
								<a class="yes_button" href="#">我要消费</a> 应付总额：<b>￥${totalAmount}</b>元
							</div>
							<div class="price_edit" style="display:none;">
								<div class="share">
									你有享金<b>100.00</b>元，此次使用
									<input value="100"/>
									元<a class="yes_button" href="#">确定</a>
								</div>
								<div class="coupons">
									<h3>
										您有礼卷<b>50</b>元，最多可使用<b>20</b>元，请选择礼卷
									</h3>
									<div class="num_input">
										<ul>
											<li>
												<div class="num">
													5元卷：使用<input />张
												</div>
												<div class="result">
													小计<input />元
												</div>
											</li>
											<li>
												<div class="num">
													10元卷：使用<input />张
												</div>
												<div class="result">
													小计<input />元
												</div>
											</li>
											<li>
												<div class="num">
													20元卷：使用<input />张
												</div>
												<div class="result">
													小计<input />元
												</div>
											</li>
										</ul>
										<a class="yes_button" href="#">确定</a>
									</div>
								</div>
								<div class="score">
									你有品上积分<b>5000</b>分，本次最多可以消费<b>1000</b>分，你要使用
									<input value="1000" />
									分抵<b>10.00</b>元<a class="yes_button" href="#">确定</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="submitDiv" class="btns" style="display:none;">
					<a class="post_order_button" href="javascript:submitOrder();"></a>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="container">
			<div class="footer_help_list">
				<dl class="guide">
					<dt>
						<em></em>
					</dt>
					<dd>
						<h5>
							<a href="#">新手指南</a>
						</h5>
						<p>
							<a href="#">注册新用户</a>
						</p>
						<p>
							<a href="#">网站订购流程</a>
						</p>
						<p>
							<a href="#">网站地图</a>
						</p>
					</dd>
				</dl>
				<dl class="pay">
					<dt>
						<em></em>
					</dt>
					<dd>
						<h5>
							<a href="#">如何付款与退款</a>
						</h5>
						<p>
							<a href="#">支付方式</a>
						</p>
						<p>
							<a href="#">如何办理腿退款</a>
						</p>
						<p>
							<a href="#">发票制度说明</a>
						</p>
					</dd>
				</dl>
				<dl class="distribution">
					<dt>
						<em></em>
					</dt>
					<dd>
						<h5>
							<a href="#">配送方式</a>
						</h5>
						<p>
							<a href="#">支付方式</a>
						</p>
						<p>
							<a href="#">如何办理腿退款</a>
						</p>
						<p>
							<a href="#">发票制度说明</a>
						</p>
					</dd>
				</dl>
				<dl class="service">
					<dt>
						<em></em>
					</dt>
					<dd>
						<h5>
							<a href="#">售后服务</a>
						</h5>
						<p>
							<a href="#">退换货政策</a>
						</p>
						<p>
							<a href="#">如何办理退换货</a>
						</p>
					</dd>
				</dl>
				<dl class="help">
					<dt>
						<em></em>
					</dt>
					<dd>
						<h5>
							<a href="#">帮助中心</a>
						</h5>
						<p>
							<a href="#">常见热点问题</a>
						</p>
						<p>
							<a href="#">联系我们</a>
						</p>
						<p>
							<a href="#">投诉与建议</a>
						</p>
					</dd>
				</dl>
			</div>
			<div class="bottom">
				<center>
					<img src="/images/mall/kefu.png" alt="" />
				</center>
			</div>
		</div>
	</div>
</body>
</html>