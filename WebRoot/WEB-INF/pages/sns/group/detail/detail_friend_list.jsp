<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function delGroupFriend(param){
		var uid = param["userid"];
		if(confirm("确定将此人踢出圈子?")){
			$.post(
				"/sns/group/manage/del_groupfriend",
				$.param(param),
				function(result){
					if(result.success){
						$.psfInfoDialog("删除成功!");
						$("#groupfriend_"+uid).remove();
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}
		
	/*管理员管理：0-普通圈友，1-管理员*/
	function manageAdmin(type,param){
		var uid = param["uid"];
		param = $.param(param)+"&type="+type;
		$.post(
			"/sns/group/manage/manage_admin",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("操作成功!");
					if(type == 0){
						$(".upgrade_"+uid).removeClass("hide");
						$(".admin_"+uid).addClass("hide");
						$(".degrade_"+uid).addClass("hide");
						$(".groupfriend_"+uid).removeClass("hide");
					}else if(type == 1){
						$(".upgrade_"+uid).addClass("hide");
						$(".admin_"+uid).removeClass("hide");
						$(".degrade_"+uid).removeClass("hide");
						$(".groupfriend_"+uid).addClass("hide");
					}
				}else{
					$.psfInfoDialog(result.message);
					return false;
				}
			},
			"json"
		);
	}
</script>
    
<c:forEach items="${userlist}" var="user">   
<div id="groupfriend_${user.uid}" class="post_item">
	<div class="post_status">
		<div class="name groupfriend_${user.uid} ${(user.role eq 0) ? '' : 'hide'}"><em class="icon_friend"></em>圈友</div>
		<div class="name admin_${user.uid} ${(user.role eq 1) ? '' : 'hide'}""><em class="icon_admin"></em>管理员</div>
		<div class="name ${(user.role eq 2) ? '' : 'hide'}""><em></em>圈主</div>
		<c:if test="${cur_role > user.role}">
        <div class="list">
        	<p><a href="javascript:void(0)" onclick="delGroupFriend({'groupid':${groupid},'userid':${user.uid}})">踢出圈子</a></p>
       		<p class="degrade_${user.uid} ${(cur_role eq 2 && user.role eq 1)?'':'hide'}"><a href="javascript:void(0)" onclick="manageAdmin(0,{'groupid':${groupid},'uid':${user.uid}})">免去管理员</a></p>
       		<p class="upgrade_${user.uid} ${(cur_role eq 2 && user.role eq 0)?'':'hide'}"><a href="javascript:void(0)" onclick="manageAdmin(1,{'groupid':${groupid},'uid':${user.uid}})">升为管理员</a></p>
            <!-- <p><a href="#">转移群主</a></p> -->
        </div>
        </c:if>
    </div>

	<dl class="post_infobox">
        <dt class="post_left">
            <div class="post_avatar" psftype="card" uid="${user.uid}">
                <a href="#"><img src="/pic/${user.avatarFileName}"/></a>
            </div>
        </dt>
        <dd class="post_main">
            <div class="post_header">
                <div class="post_displayName">
                    <a href="#" class="avatar" psftype="card" uid="${user.uid}" href="#">${user.username}</a>
                </div>
                <!-- 
                <div class="post_name">
                    <a href="#">@${user.username}</a>
                </div>
                -->
            </div>
            <c:if test="${!empty user.lastpost}">
            <div class="post_conbox">
            	<div class="content"><em class="icon_book"></em>${user.lastpost.listContent}</div>
                <div class="bottom">
                	<span>${user.lastpost.timepassed}</span>
                    <a href="#">评论(${user.lastpost.commentCount})</a>
                </div>
            </div>
            </c:if>
        </dd>
    </dl>
</div>
</c:forEach>
<script type="text/javascript">
initPsfTypes();
</script>