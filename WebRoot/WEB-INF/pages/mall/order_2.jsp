<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城购物车购买页－确认订单信息v2.0</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>

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
            <li class="current"><em class="order_confirm"></em></li>
            <li><em class="order_success"></em></li>
            <li><em class="order_post"></em></li>
        
        </ul>
        
        <div class="order_confirm_box">
        
            <dl class="order_prompt">
            
                <dt></dt>
                <dd>
                
                    <h3>品上丰100提醒您</h3>
                    <p>尊敬的客户,您订单中的商品存放在不同仓库中,为确保商品能够快速送达,您下单后系统将对对订单进行自动折分,商品按折分后的子订单分开配送！由此给你带来的不便敬请谅解！</p>
                
                </dd>
            
            </dl>
            

            <div class="">
            
                <div class="order_br_box">
                
                    <div class="header"><h3>确认收货人信息</h3><a href="#">[关闭]</a></div>
                    <div class="address_list">
                    
                        <div class="title">
                            <h5>常用地址</h5>
                            <a href="#">上一页</a> &nbsp; <a href="#">下一页</a>
                        </div>
                        <ul id="ajxa刷新的id">
                        
                            <li class="current">
                            
                                <div class="operations">
                                    <div class="actions"><a href="#">默认地址</a> | <a href="#">删除</a></div>
                                    <input class="address_radio" type="radio" /><label>梁广宇　北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</label> 
                                </div>
                                
                            </li>
                            <li>
                            
                                <div class="operations">
                                    <div class="actions"><a href="#">设为默认</a> | <a href="#">删除</a></div>
                                    <input class="address_radio" type="radio" /><label>梁广宇　北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</label> 
                                </div>
                            
                            </li>
                            
                            <li>
                            
                                <div class="operations">
                                    <div class="actions"><a href="#">设为默认</a> | <a href="#">删除</a></div>
                                    <input class="address_radio" type="radio" /><label>梁广宇　北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</label> 
                                </div>
                            
                            </li>
                            
                            <li>
                            
                                <div class="operations">
                                    <div class="actions"><a href="#">设为默认</a> | <a href="#">删除</a></div>
                                    <input class="address_radio" type="radio" /><label>梁广宇　北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</label> 
                                </div>
                                
                            </li>
                            
                            <li>
                            
                                <div class="operations">
                                    <div class="actions"><a href="#">设为默认</a> | <a href="#">删除</a></div>
                                    <input class="address_radio" type="radio" /><label>梁广宇　北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</label> 
                                </div>
                                
                            </li>
                        
                        </ul>
                        
                        <ul>
                        
                            <li>
                            
                                <div class="operations">
                                    <input class="address_radio" type="radio" /><span>使用新地址</span> 
                                </div>
                                
                                <div class="address_form">
                                
                                    <dl>
                                    
                                        <dt>收货人姓名：</dt>
                                        <dd>
                                        
                                            <input class="address_input" />
                                            <div>*</div>
                                                                                    
                                        </dd>
                                    
                                    </dl>
                                    
                                    <dl>
                                    
                                        <dt>所在地区：</dt>
                                        <dd>
                                        
                                            <select class="province">
                                            
                                            </select>
                                            <label>省</label>
                                            <select class="city">
                                            
                                            </select>
                                            <label>市</label>
                                            <select class="area">
                                            
                                            </select>
                                            <label>区</label>
                                            <div>*</div>
                                        
                                        </dd>
                                    
                                    </dl>
                                    
                                    <dl>
                                    
                                        <dt>街道地址：</dt>
                                        <dd>
                                        
                                            <textarea></textarea>
                                            <div>*<span> 不需要重复填写/市/区</span></div>
                                        
                                        </dd>
                                    
                                    </dl>
                                    
                                    <dl>
                                    
                                        <dt>邮政编码：</dt>
                                        <dd>
                                        
                                            <input class="code_input" />
                                            <div>*<span> 大陆以外地区可不填写</span></div>
                                        
                                        </dd>
                                    
                                    </dl>
                                    
                                    <dl>
                                    
                                        <dt>电话号码：</dt>
                                        <dd>
                                        
                                            <input class="tele_input" />
                                            <input class="tele_input" />
                                            <input class="tele_input" />
                                            <span>区号－电话号码－分机</span>
                                        
                                        </dd>
                                    
                                    </dl>
                                    
                                    <dl>
                                    
                                        <dt>手机号码：</dt>
                                        <dd>
                                        
                                            <input class="phone_input" />
                                        
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
                                        <dd class="buttons"><a class="save_address_button" href="#"></a></dd>
                                    
                                    </dl>
                                
                                </div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                
                </div>
                
                <div class="address_detail">
                
                    <div class="address_left">
                    
                        <dl>
                        
                            <dt>送货上门时间：</dt>
                            <dd>
                                <select>
                                    <option>时间不限</option>
                                </select>
                            </dd>
                        
                        </dl>
                        <dl>
                        
                            <dt>快递备注：</dt>
                            <dd>
                                
                                <textarea></textarea>
                            
                            </dd>
                            
                        </dl>
                    
                    </div>
                    
                    <div class="address_right">
                    
                        <h5 class="actions"><a href="#">发票信息<em></em></a></h5>
                    
                    </div>
                
                </div>
                
                <div class="address_detail">
                    <div class="address_left">
                    
                        <dl>
                        
                            <dt>送货上门时间：</dt>
                            <dd>
                                <select>
                                    <option>时间不限</option>
                                </select>
                            </dd>
                        
                        </dl>
                        <dl>
                        
                            <dt>快递备注：</dt>
                            <dd>
                                
                                <textarea></textarea>
                            
                            </dd>
                            
                        </dl>
                    
                    </div>
                    
                    <div class="address_right">
                    
                        <h5 class="actions"><a class="more_btn" href="#">发票信息<em></em></a></h5>
                        
                        <div class="address_more">
                        
                            <div class="invoice_form">
                            
                                <dl>
                                
                                    <dt>发票抬头：</dt>
                                    <dd><input  /></dd>
                                
                                </dl>
                                
                                <dl>
                                
                                    <dt>发票内容：</dt>
                                    <dd>
                                    
                                        <input />
                                        <a class="yes_button" href="#">确定</a>
                                    
                                    </dd>
                                
                                </dl>
                                
                                <div class="invoice_statement">
                                
                                    <h5>发票说明：</h5>
                                    <p>1、由于存在可能的退换货，如您需要发票，请您在订单此处索取发票，我们将在您收到货物7天后，以平邮的方式寄送到您的地址</p>
                                    <p>2、部分商品供应商可能无法提供发票，品上商城向您保证所有商品均为正品，并建立了500万的品质保证金，承诺假一赔三</p>
                                
                                </div>
                                
                            
                            </div>
                            
                            <div class="shopcar">
                            
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
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                                        <td class="type">普通</td>
                                        <td class="price">20000.00</td>
                                        <td class="scope">84</td>
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                                        <td class="type">普通</td>
                                        <td class="price">20000.00</td>
                                        <td class="scope">84</td>
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                
                                </table>
                                
                                <div class="bottom">
                                
                                    <b>如果您对商品无法提供发票不满意，建议您返回修改</b><a href="#"><em></em>购物车&gt;&gt;</a>
                                
                                </div>
                            
                            </div>
                            
                            
                        
                        </div>
                
                    </div>
                    
                </div>
                
            
            </div>
            
            
            <div class="">
            
                <div class="order_br_box">
                
                    <div class="header"><h3>确认收货人信息</h3><a href="#">[修改]</a></div>
                    <div class="address_card">
                    
                        <p>收货人姓名：梁广宇</p>
                        <p>省　&nbsp;&nbsp; 份：北京昌平区水库/龙水路东,京藏高速西,怀昌路南,京通铁路北</p>
                        <p>地　&nbsp;&nbsp; 址：北京昌平区五环以外东小口镇中难村（立水桥轻九站西南侧）顶秀清溪花园7栋2单元102室</p>
                        <p>手机号码：13381283231</p>
                        <p>固定电话：13381283231</p>
                        <p>电子邮件：13381283231</p>
                        <p>邮　&nbsp;&nbsp; 码：100192</p>
                    
                    </div>
                
                </div>
                
                <div class="address_detail">
                
                    <div class="address_left">
                    
                        <dl>
                        
                            <dt>送货上门时间：</dt>
                            <dd>
                                <select>
                                    <option>时间不限</option>
                                </select>
                            </dd>
                        
                        </dl>
                        <dl>
                        
                            <dt>快递备注：</dt>
                            <dd>
                                
                                <textarea></textarea>
                            
                            </dd>
                            
                        </dl>
                    
                    </div>
                    
                    <div class="address_right">
                    
                        <h5 class="actions"><a href="#">发票信息<em></em></a></h5>
                    
                    </div>
                
                </div>
                
                <div class="address_detail">
                    <div class="address_left">
                    
                        <dl>
                        
                            <dt>送货上门时间：</dt>
                            <dd>
                                <select>
                                    <option>时间不限</option>
                                </select>
                            </dd>
                        
                        </dl>
                        <dl>
                        
                            <dt>快递备注：</dt>
                            <dd>
                                
                                <textarea></textarea>
                            
                            </dd>
                            
                        </dl>
                    
                    </div>
                    
                    <div class="address_right">
                    
                        <h5 class="actions"><a class="more_btn" href="#">发票信息<em></em></a></h5>
                        
                        <div class="address_more">
                        
                            <div class="invoice_form">
                            
                                <dl>
                                
                                    <dt>发票抬头：</dt>
                                    <dd><input  /></dd>
                                
                                </dl>
                                
                                <dl>
                                
                                    <dt>发票内容：</dt>
                                    <dd>
                                    
                                        <input />
                                        <a class="yes_button" href="#">确定</a>
                                    
                                    </dd>
                                
                                </dl>
                                
                                <div class="invoice_statement">
                                
                                    <h5>发票说明：</h5>
                                    <p>1、由于存在可能的退换货，如您需要发票，请您在订单此处索取发票，我们将在您收到货物7天后，以平邮的方式寄送到您的地址</p>
                                    <p>2、部分商品供应商可能无法提供发票，品上商城向您保证所有商品均为正品，并建立了500万的品质保证金，承诺假一赔三</p>
                                
                                </div>
                                
                            
                            </div>
                            
                            <div class="shopcar">
                            
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
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                                        <td class="type">普通</td>
                                        <td class="price">20000.00</td>
                                        <td class="scope">84</td>
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                                        <td class="type">普通</td>
                                        <td class="price">20000.00</td>
                                        <td class="scope">84</td>
                                        <td class="favor">比市场价优惠<b>400.00</b>、比品上价优惠<b>200.00</b></td>
                                        <td class="post"><em class="yes"></em></td>
                                        <td class="num numInput">2</td>
                                    </tr>
                                
                                </table>
                                
                                <div class="bottom">
                                
                                    <b>如果您对商品无法提供发票不满意，建议您返回修改</b><a href="#"><em></em>购物车&gt;&gt;</a>
                                
                                </div>
                            
                            </div>
                            
                            
                        
                        </div>
                
                    </div>
                    
                </div>
                
            
            </div>
            
            <div class="order_br_box">
            
                <div class="header"><h3>确认结算信息</h3></div>
                <div class="account_info_box">
                
                    <div class="price_total">
                    
                        商品总金额:<b>300.00</b>元 + 运费<b>15.00</b>元 - 享金支出<strong>100.00</strong>元 - 礼卷支出<strong>30.00</strong>元 - 积分<strong>1000</strong>分 抵<b>10.00</b>元 = <b>1990</b>元
                        商品总金额:<b>300.00</b>元 + 运费<b>15.00</b>元 - 享金支出<strong>100.00</strong>元 - 礼卷支出<strong>30.00</strong>元 - 积分<strong>1000</strong>分 抵<b>10.00</b>元 = <b>1990</b>元
                    
                    </div>
                    
                    <div class="price_detail">
                    
                        <div class="total">
                            <span><em></em>你现在有享金<b>100</b>元，礼卷<b>50</b>元、积分<b>3000</b>分可以抵消全部或部分消费金额</span><a class="yes_button" href="#">我要消费</a>
                            应付总额：<b>￥1,990.00</b>元
                        </div>
                        
                        <div class="price_edit">
                        
                            <div class="share">
                                
                                你有享金<b>100.00</b>元，此次使用<input value="100" />元<a class="yes_button" href="#">确定</a>
                            
                            </div>
                            <div class="coupons">
                            
                                <h3>您有礼卷<b>50</b>元，最多可使用<b>20</b>元，请选择礼卷</h3>
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
                            
                                你有品上积分<b>5000</b>分，本次最多可以消费<b>1000</b>分，你要使用<input value="1000" />分抵<b>10.00</b>元<a class="yes_button" href="#">确定</a>
                            
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            <div class="btns">
            
                <a class="post_order_button" href="#"></a>
            
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