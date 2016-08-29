<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function selectAll(divid){
		var content = $.trim($("#"+divid).val());
		$("#"+divid).selectTextRange(0,content.length);
	}
</script>

<div class="group_invite_form">

	<h3 class="title">向你的朋友发送邀请链接吧！</h3>
    
    <!-- 
    <div class="rows">
    	<em></em>
        <div class="invite_right">
            <h3>站内邀请</h3>
            <p>邀请相互关注的劝圈友加入该圈子</p>
            <div class="buttons"><a class="button" href="#">查找圈友并邀请</a></div>
        </div>
    </div>
     -->
     
    <div class="rows">
    	<em class="icon_link"></em>
        <div class="invite_right">
            <h3>链接邀请</h3>
            <p>通过QQ、MSN、电子邮件发送邀请链接给你的</p>
            <p>朋友成功邀请来的成员将自动成为你的粉丝</p>
            <dl>
                <dt>链接地址：</dt>
                <dd>
                    <input id="inviteURL" class="invite_input" name="url" value="${url}" onfocus="selectAll('inviteURL')"/>
                    <a class="button" href="javascript:void(0)" onclick="copyURL('inviteURL')">复制地址</a>
                </dd>
            </dl>
        </div>
    </div>
    
    <div class="rows">
    	<em class="icon_mail"></em>
        <div class="invite_right">
            <h3>邮箱联系人邀请</h3>
            <p>把你的圈子告诉你的好友让他们一起来玩吧</p>
            <p>品上丰100承诺：会对你的帐号和密码绝对保密！</p>
            <dl>
                <dt>邮箱地址：</dt>
                <dd>
                    <input class="mail_input" />
                    <i>@</i>
                    <select>
                        <option>请选择邮箱类型</option>
                    </select>
                    <ul class="mail_select">
                        
                        <li class="current"><a href="#"><img src="/images/sns/photo/mail01.png" alt=""></a></li>
                        <li><a href="#"><img src="/images/sns/photo/mail02.png" alt=""></a></li>
                        <li><a href="#"><img src="/images/sns/photo/mail03.png" alt=""></a></li>
                        <li><a href="#"><img src="/images/sns/photo/mail04.png" alt=""></a></li>
                        <li><a href="#"><img src="/images/sns/photo/mail01.png" alt=""></a></li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>邮箱密码：</dt>
                <dd><input class="mail_input" type="password" /></dd>
            </dl>
            <div class="buttons"><a class="button" href="#">查找圈友并邀请</a></div>
        </div>
    </div>
</div>