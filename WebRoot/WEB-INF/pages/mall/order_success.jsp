<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>成功提交订单</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
    function showOrderPost(link,type) {
		$(".pay_detail_box .tab li").removeClass("current");
		$(link).parent("li").addClass("current");
		$(".pay_detail_box .pay_content").hide();
		$("#order_"+type+"_content").fadeIn("fast");
	}
    </script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">

    <div id="mall_header">
    
    	<div class="top">
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <a href="#"><img src="/images/mall/photo/banner_big2.png" alt="" /></a>
            
        </div>
    
    </div>
        
    <div class="order_process_box">
    
        <ul class="process_header">
        
            <li><em class="mybuy"></em></li>
            <li><em class="order_confirm"></em></li>
            <li class="current"><em class="order_success"></em></li>
            <li><em class="order_post"></em></li>
        
        </ul>
        
        <div class="order_post_box">
        
            <dl class="order_prompt">
            
                <dt></dt>
                <dd>
                
                    <h3>订单已经处理，请尽快选择付款方式付款</h3>
                    <p>
                        <strong>实际支付：<b>${order.goods_amount}</b></strong>
您的订单号：<b>${order.order_sn}</b>，订单金额<b>${order.goods_amount}</b>元。
<!--使用享金<b>100.00</b>元，礼卷<b>20</b>元、积分<b>1000</b>分　抵<b>10.00</b>元-->
                    </p>
                
                </dd>
            
            </dl>
            <div class="order_address_info">
            
                <h5>您的收货信息：</h5>
                <dl>
                
                    <dt>收货人：</dt>
                    <dd><span class="name">${order.consignee}</span><!--a href="/order/edit?orderid=${order.order_id}">修改收货人信息&gt;&gt;</a--></dd>
                
                </dl>
                <dl>
                
                    <dt>收货地址：</dt>
                    <dd>${order.province_name} ${order.city_name} ${order.district_name} ${order.address}</dd>
                
                </dl>
                <dl>
                
                    <dt>送货上门时间：</dt>
                    <dd>
                        <span class="time">${order.best_time}</span>
                        <span><b>快递备注：</b>${(order.postscript==null)?"无":order.postscript}</span>
                    </dd>
                
                </dl>
            
            </div>
            <div class="order_pay_info">
            
                <h3>在线支付</h3>
                <strong><em></em>以上信息都无误的情况下，请立即付款<b>（如12小时内不支付款项，订单将取消）</b></strong>
            
            </div>
            
            <div class="pay_detail_box">
            
                <dl class="tab">
                
                    <dt><b>网银支付限额：</b><a href="#">点击查看&gt;&gt;</a></dt>
                    <dd>
                    
                        <ul>
                        
                            <li id="order_bank" class="current"><a href="javascript:void(0);" onclick="showOrderPost(this,'bank');">网上银行</a></li>
                            <li id="order_pay"><a href="javascript:void(0);" onclick="showOrderPost(this,'pay');">支付平台</a></li>
                            <li id="order_card"><a href="javascript:void(0);" onclick="showOrderPost(this,'card');" >信用卡</a></li>
                        
                        </ul>
                    
                    </dd>
                
                </dl>
                
                <div id="order_bank_content" class="pay_content">
                
                    <ul class="bank_pay_list">
                        <li>
                            <a href="#"><img src="/images/pay/gongshang.gif" alt="" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="/images/pay/jianshe.gif" alt="" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="/images/pay/nongye.gif" alt="" /></a>
                        </li>
                    </ul>
                    
                    
                    <!--div class="bank_pay_group">
                    
                        <h1>B-F</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                        
                        <h1>G-H</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社成都农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                        
                        <h1>J-P</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                    
                    </div-->
                    
                  <div class="pay_table">
                    
                    　<h3>网银支付限额：</h3>
                      <table cellpadding="0">
                        
                          <tr>
                              <th class="index">拼音索引</th>
                              <th class="name">银行</th>
                              <th class="scope">开通范围</th>
                              <th class="type">客户类型</th>
                              <th class="one_price">单笔限额（元）</th>
                              <th class="day_price">日累计限额（元）</th>
                              <th class="detail">开通条件</th>
                          </tr>
                            
                          <tr>
                            
                              <td class="index">B</td>
                              <td class="name">勃海银行</td>
                              <td class="scope">所有卡</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">请到勃海银行各营业网点申请办理个人网上银行服务，获得动态口令，绑定动态口令后，登陆个人网上银行，选择＂电子商务支付＂项下的＂网上支付功能开关＂选项，完成开通；凭网银客户号、动态口令、静态密码进行网上支付交易</td>
                            
                          </tr>
                            
                          <tr>
                              <td class="index" rowspan="2">C</td>
                              <td class="name">长沙银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">到各营业网点开通</td>
                          </tr>
                          <tr>
                            
                              <td class="name">勃海银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">无限额</td>
                              <td class="day_price">无限额</td>
                              <td class="detail">默认开通网上支付功能，请致电人工服务热线设定交易限额</td>
                            
                          </tr>
                        
                      </table>
                    
                    </div>
                
                </div>
                
                
                <div id="order_pay_content" class="pay_content" style="display:none">
                
                    <div class="bank_pay_list">
                    
                        <table cellpadding="0">
                        
                        	<tr>
                            
                                <td class="img"><a href="#"><img src="/images/pay/unionpay.jpg" alt="" /></a></td>
                                <td>
                                    <p>
                                    	<strong class="red">无需开通网银,即可完成在线支付,方便,快捷</strong> <b>银联在线支付支持银行清单：</b><a href="#">点击查看&gt;&gt;</a>
                                    </p>
                                    <p>
                                    	<strong>您只需要一张带有银联标志的银行卡，无需开通网银，通过短信认证即可完成支付！</strong>
                                    </p>
                                </td>
                            
                            </tr>
                            
                            <tr>
                                <td class="img">
                                	<a href="#"><img src="/images/pay/yeepay.jpg" alt="" /></a>
                                </td>
                                <td>
                                    <p><strong class="green">绿色支付　快乐生活</strong></p>
                                </td>
                            
                            </tr>
                        
                        </table>
                    
                    </div>
                    
                  	<div class="pay_table">
                    
                    　<h3>银联在线支付支持银行清单：</h3>
                      <table cellpadding="0">
                        
                          <tr>
                              <th class="index">拼音索引</th>
                              <th class="name">银行</th>
                              <th class="scope">开通范围</th>
                              <th class="type">客户类型</th>
                              <th class="one_price">单笔限额（元）</th>
                              <th class="day_price">日累计限额（元）</th>
                              <th class="detail">开通条件</th>
                          </tr>
                            
                          <tr>
                            
                              <td class="index">B</td>
                              <td class="name">勃海银行</td>
                              <td class="scope">所有卡</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">请到勃海银行各营业网点申请办理个人网上银行服务，获得动态口令，绑定动态口令后，登陆个人网上银行，选择＂电子商务支付＂项下的＂网上支付功能开关＂选项，完成开通；凭网银客户号、动态口令、静态密码进行网上支付交易</td>
                            
                          </tr>
                            
                          <tr>
                              <td class="index" rowspan="2">C</td>
                              <td class="name">长沙银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">到各营业网点开通</td>
                          </tr>
                          <tr>
                            
                              <td class="name">勃海银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">无限额</td>
                              <td class="day_price">无限额</td>
                              <td class="detail">默认开通网上支付功能，请致电人工服务热线设定交易限额</td>
                            
                          </tr>
                        
                      </table>
                    
                    </div>
                
                </div>
                
                
                <div id="order_card_content" class="pay_content" style="display:none">
                    <ul class="bank_pay_list">
                        <li>
                            <a href="#"><img src="/images/mall/photo/bank15.png" alt="" /></a>
                        </li>
                    </ul>
                    
                    <!--div class="bank_pay_group">
                    
                        <h1>B-F</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                        
                        <h1>G-H</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社成都农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                        
                        <h1>J-P</h1>
                        <div>
                        
                            <span><a href="#">包商银行</a></span>
                            <span><a href="#">长沙银行</a></span>
                            <span><a href="#">承德银行</a></span>
                            <span><a href="#">成都农村商业银行</a></span>
                            <span><a href="#">重庆农村商业银行</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                            <span><a href="#">重庆银行</a></span>
                            <span><a href="#">大连银行</a></span>
                            <span><a href="#">东营市商业银行</a></span>
                            <span><a href="#">鄂尔多斯银行</a></span>
                            <span><a href="#">福建省农村信用社</a></span>
                        
                        </div>
                    
                    </div-->
                    
                  <div class="pay_table">
                    
                    　<h3>信用卡支付限额：</h3>
                      <table cellpadding="0">
                        
                          <tr>
                              <th class="index">拼音索引</th>
                              <th class="name">银行</th>
                              <th class="scope">开通范围</th>
                              <th class="type">客户类型</th>
                              <th class="one_price">单笔限额（元）</th>
                              <th class="day_price">日累计限额（元）</th>
                              <th class="detail">开通条件</th>
                          </tr>
                            
                          <tr>
                            
                              <td class="index">B</td>
                              <td class="name">勃海银行</td>
                              <td class="scope">所有卡</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">请到勃海银行各营业网点申请办理个人网上银行服务，获得动态口令，绑定动态口令后，登陆个人网上银行，选择＂电子商务支付＂项下的＂网上支付功能开关＂选项，完成开通；凭网银客户号、动态口令、静态密码进行网上支付交易</td>
                            
                          </tr>
                            
                          <tr>
                              <td class="index" rowspan="2">C</td>
                              <td class="name">长沙银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">2万</td>
                              <td class="day_price">10万</td>
                              <td class="detail">到各营业网点开通</td>
                          </tr>
                          <tr>
                            
                              <td class="name">勃海银行</td>
                              <td class="scope">借记卡：94007、622368</td>
                              <td class="type"></td>
                              <td class="one_price">无限额</td>
                              <td class="day_price">无限额</td>
                              <td class="detail">默认开通网上支付功能，请致电人工服务热线设定交易限额</td>
                            
                          </tr>
                        
                      </table>
                    
                    </div>
                
                </div>
            
            </div>
        
        </div>
    
    </div>
    
</div>

<div id="footer"><div class="container">

	<div class="footer_help_list">
    
    	<dl class="guide">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">新手指南</a></h5>
                <p><a href="#">注册新用户</a></p>
                <p><a href="#">网站订购流程</a></p>
                <p><a href="#">网站地图</a></p>
            </dd>
        
        </dl>
        <dl class="pay">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">如何付款与退款</a></h5>
                <p><a href="#">支付方式</a></p>
                <p><a href="#">如何办理腿退款</a></p>
                <p><a href="#">发票制度说明</a></p>
            </dd>
        
        </dl>
        <dl class="distribution">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">配送方式</a></h5>
                <p><a href="#">支付方式</a></p>
                <p><a href="#">如何办理腿退款</a></p>
                <p><a href="#">发票制度说明</a></p>
            </dd>
        
        </dl>
        <dl class="service">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">售后服务</a></h5>
                <p><a href="#">退换货政策</a></p>
                <p><a href="#">如何办理退换货</a></p>
            </dd>
        
        </dl>
        <dl class="help">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">帮助中心</a></h5>
                <p><a href="#">常见热点问题</a></p>
                <p><a href="#">联系我们</a></p>
                <p><a href="#">投诉与建议</a></p>
            </dd>
        
        </dl>
    
    </div>
    
    <div class="bottom">
    
    	<center><img src="/images/mall/kefu.png" alt="" /></center>
    
    </div>

</div></div>

</body>
</html>