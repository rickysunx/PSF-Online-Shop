<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(".announ_btn").click(function(){
		var param = $("#announ_form").serialize();
		$.post(
			"/sns/group/manage/save_annnouncement",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("公告发布成功!");
					loadManagePage(3);
				}else{
					$.psfInfoDialog(result.message);
					return;
				}
			},
			"json"
		);
	});
	initPsfTypes();
	function delAnnounce(divid){
		var postid = $.trim(divid.split("_")[2]);
		$.post(
			"/sns/group/manage/del_annnouncement",
			"postid="+postid,
			function(result){
				if(result.success){
					$.psfInfoDialog("公告删除成功!");
					loadManagePage(3);
				}else{
					$.psfInfoDialog(result.message);
					return;
				}
			},
			"json" 
		);
	}
</script>

<div class="announ_editbox">
	<form id="announ_form">
		<input type="hidden" name="groupid" value="${groupid}"/>
		<h4><span>还可以输入<b id="word_left_count">200</b>个字</span>公告内容：</h4>
	    <textarea id="blogContent" name="announcement" onkeyup="blogContentChanged()"></textarea>
	    <div class="txtarea_bottom">
	    	<div class="face">
	        	<a class="smileybutton" href="javascript:void(0)"><em></em>表情</a>
	        </div>
	        <a class="announ_btn" href="javascript:void(0)">发布公告</a>
	    </div>
	</form>
</div>

<div class="announ_history_table">

	<h6>公告历史</h6>
    <table id="announce_list" cellpadding="0">
    
    	<tr>
        	<th>日期</th>
            <th>公告内容</th>
            <th>发布人</th>
        </tr>
        <c:if test="${empty announs}">
        	<tr><td colspan="3">当前该圈子尚未发布公告！</td></tr>
        </c:if>
        
        <c:forEach items="${announs}" var="announ">
        <tr id="announce_content_${announ.postid}">
        	<td>${announ.chnTime}</td>
            <td>${announ.content}</td>
            <td><a psftype="card" uid="${announ.uid}">${announ.userName}</a>  <a href="javascript:void(0)">复制</a>　<a href="javascript:void(0)" onclick="delAnnounce('announce_content_${announ.postid}')">删除</a></td>
        </tr>
        </c:forEach>
        
    </table>
</div>