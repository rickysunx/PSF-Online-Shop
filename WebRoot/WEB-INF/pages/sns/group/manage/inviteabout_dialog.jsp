<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$("#all").toggle(
		function(){
			$(".invite_dialog ul input[name='uid']").attr("checked",true);
		},
		function(){
			$(".invite_dialog ul input[name='uid']").attr("checked",false);
		}
	);
	
	$(".nav ol li a").click(function(){
		$(this).addClass("current").parent("li").siblings().find("a").removeClass("current");
		loadInviteUser($(this).attr("type"),null,1);
	});
	
	var invite_param = {
		"groupid" : ${groupid},
		"type" : 3,
		"keyword" : null,
		"page" : 1
	};
	function loadInviteUser(type,keyword,page){
		if(type != -1){
			invite_param["type"] = type;
		}if(keyword != null){
			invite_param["keyword"] = keyword;
		}if(page != -1){
			invite_param["page"] = page;
		}
		$("#user_form").load(
			"/sns/group/manage/invite_userlist",
			invite_param
		);
	}
	$(function(){
		initInput("search_user","输入用户名");
		loadInviteUser(-1,null,-1);
	})

	function submitInviter(){
		var param = $("#user_form").serialize();
		hasInvitedUser(param,1);
		closeInviteDialog();
	}
</script>


<div class="invite_dialog" style="width:641px;border:1px #B5B1B1 solid;">
        
    <div class="layerTop layerTop_gray_big">
    	<a class="close" href="javascript:void(0)" onclick="closeInviteDialog();"></a>
        <div class="searchbox02">
            <input id="search_user"/>
            <a href="javascript:void(0)" class="searchbtn" onclick="loadInviteUser(-1,$('#search_user').val(),1)"></a>
        </div>
       	<span>*</span>目前你共有${itemcount}位可邀请对象
    </div>
    
    <div class="nav">
    	<div class="right"><a id="all" href="javascript:void(0)">全选</a></div>
    	<ol>
    		<li><a class="current" href="javascript:void(0)" type="3"><span><span>全部</span></span></a></li>
            <li>|</li>
            <li><a href="javascript:void(0)" type="1"><span><span>好友</span></span></a></li>
            <li>|</li>
            <li><a href="javascript:void(0)" type="2"><span><span>粉丝</span></span></a></li>
        </ol>
    </div>
    
    <form id="user_form"></form>
</div>