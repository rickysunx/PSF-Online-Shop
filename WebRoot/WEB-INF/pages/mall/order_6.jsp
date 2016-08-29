<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城购物车购买页－支付返回v2.0</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
	<script src="/js/jquery.js" type="text/javascript"></script>
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
    
    <div class="order_success_box">
    
        <div class="header"><em></em></div>
        <div class="piclist">
        
            <div class="actions">
            
                <a class="button01" href="#"><span><em></em><b>一键关注</b></span></a>
            
            </div>
        
            <ul>
              
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                      <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                
                <li>
                    <div class="picborder">
                        <table class="pictable">
                            <tbody><tr>
                                <td class="t_l"> </td>
                                <td class="t_m">
                                    <div></div>
                                    <b></b>
                                    <em></em>
                                </td>
                                <td class="t_r"> </td>
                            </tr>
                            <tr>
                                <td class="m_l"> </td>
                                <td class="m_m">
                                    <div class="pic_card">
                                        <div class="card_infowrap">
                                            <div class="img">
                                                <a href="#"><img src="/images/mall/photo/photo01.png" alt=""></a>
                                            </div>
                                            <div class="name_card">
                                                <div class="namebox">
                                                    <div class="row">
                                                        
                                                        
                                                        
                                                        <div class="name">
                                                            <a href="#"><b>jinyan</b></a>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <span class="sex xin"></span>
                                                        <div class="name">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="friend">
                                                <a id="psfFriend_4" href="javascript:void(0);" psfmenuid="2"><b>0</b>个共同好友</a>
                                                    
                                            </div>
                                            
                                            <div class="buttons">
                                                <a onclick="openAskForFriendDialog('4','jinyan',this);" class="addbtn02 addbtn02_ok" href="javascript:void(0);"><em></em>好友</a>
                                                
                                                  
                                                  
                                                <a name="addfollow" id="psf_friend_add_follow_4" class="addbtn02 addbtn02_ok" href="javascript:addFollow(4,addFollowHandle4);">
                                                          <em></em>关注
                                                      </a>
                                                  
                                                
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="m_r"> </td>
                            </tr>
                            
                            <tr>
                                <td class="b_l"> </td>
                                <td class="b_m">
                                    <em></em>
                                    <b></b>
                                    <div></div>
                                </td>
                                <td class="b_r"> </td>
                            </tr>
                        </tbody></table>
                        <div class="shadow"></div>
                    </div>
                </li>
                 
            </ul>
            
            
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