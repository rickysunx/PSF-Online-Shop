<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	var options = {
		"groupid" : ${group.groupid},
		"topictitle" : "${topic.topictitle}",
		"page" : 1,
		"orderby" : 1
	};
	
	$(function(){
		$("#blogContent").val("#${topic.topictitle}#");
		$("#blogSubmitButton1").click(function(){
			submitBlog(reloadTopicPost);
		});
	});
	
	
	function reloadTopicPost(){
		loadPostList(1,1);
	}
	
	function loadPostList(page, orderby){
		if(page != -1){
			options["page"] = page;
		}if(orderby != -1){
			options["orderby"] = orderby;
		}
		
		$('#post_list').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$('#post_list').load(
			"/sns/group/get_topicpost_list",
			options,
			function(){
				$("#blogContent").val("#"+options["topictitle"]+"#");
			}
		);
	}
</script>

<dl class="group_user_mini_box">
	<dt><a href="/sns/group/detail?groupid=${group.groupid}"><img src="/pic/${group.logo}" alt="" /></a></dt>
    <dd>
    	<div class="top">
        	<span class="name"><a href="/sns/group/detail?groupid=${group.groupid}">${group.groupname}</a>（群号：${group.groupid+10000}）</span>
            <span class="data">
            	<a href="javascript:void(0)">圈友</a><b>${group.membercount}</b>
                <a href="javascript:void(0)">品友</a><b>${group.psfFriendCount}</b>
                <a href="javascript:void(0)">话题</a><b>${group.topicCount}</b>
                <a href="javascript:void(0)">发表</a><b>${group.postCount }</b>
            </span>
        </div>
        
        <p>
        	<span><b>类别：</b>${group.groupclass}</span><span><b>地区：</b>${group.zonename}</span>
            <span><b>创建时间：</b>${group.createtime}</span>
        </p>
    </dd>
</dl>

<div class="sns_conwrap">
<div class="mblogheader">
    	<div class="name">
        	<div class="right">返回＂<a href="/sns/group/detail?groupid=${group.groupid}">${group.groupname}</a>＂主页&gt;&gt;</div>
            <h3>话题：<a href="/gt/${topic.topictitle}/${group.groupid}">${topic.topictitle}</a></h3>
        </div>
    	<p>
        	<span class="time">${topic.timepassed} 发起</span>
            <b>发起人：</b><a href="#">${topic.username}</a>
            &nbsp;&nbsp;
           	 发言数：${topic.postcount}
        </p>
    </div>
    <psf:include page="/sns/group/detail/detail_blogForm.jsp"></psf:include>
    <div id="post_list" class="post_list"></div>

</div>
