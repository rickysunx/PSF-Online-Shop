<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function fastQuitGroup(groupid){
		var param = "quit=1&groupid="+groupid;
		if(confirm("确定退出该圈子?")){
			$.post(
				"/sns/group/manage/del_groupfriend",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog(result.message);
						getMyGroup(1,-1,null,1);
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}
</script>

<c:if test="${empty grouplist}">
	<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
</c:if>

<c:forEach items="${grouplist}" var="group">
	<div class="group_item">
        <div class="book_border"><div class="book_body">
            
            <div class="group_left">
                <dl>
                    <dt><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo} alt="" /></a></dt>
                    <dd>
                        
                        <h3><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a></h3>
                        <p><span>(群号:${10000+group.groupid})</span></p>
                        <p><b>类别:</b>${group.groupclass}</p>
                        <p><b>地区:</b>${group.zonename}</p>
                        <p><b>圈主:</b>${group.displayName}</p>
                        <p><b>创建:</b><span>2011-05-02</span></p>
                        <c:if test="${group.role != 2}">
                        	<p class="statusbox"><a>已加入</a> | <a href="javascript:void(0)" onclick="fastQuitGroup(${group.groupid})">退出</a></p>
                    	</c:if>
                    	<c:if test="${group.role eq 2}">
                        	<p class="statusbox"><a href="javascript:void(0)" onclick="dismiss(${group.groupid})">解散圈子</a></p>
                    	</c:if>
                    </dd>
                </dl>
                <div class="data">
                    <a href="#">圈友</a><b>${group.membercount}</b> | <a href="#">品友</a><b>${group.psfFriendCount}</b> | <a href="#">发言</a><b>${group.postCount}</b> | <a href="#">话题</a><b>${group.topicCount}</b>
                </div>
                
                <div class="bottom">
                
                    <div class="info"><b>圈子简介:</b>${group.intro}</div>
                    <div class="btns">
                    	<c:if test="${(group.role eq 1) || (group.role eq 2)}"><a class="manage" href="/sns/group/manage?groupid=${group.groupid}"><em></em>圈子管理</a></c:if>
                        <a href="/sns/group/manage/inviteabout?groupid=${group.groupid}"><em></em>邀请品友</a>
                        <c:if test="${group.grouptype != 4}">
                        	<a class="recom" href="javascript:void(0)" onclick="promoteGroup(${group.groupid})"><em></em>推荐到广播</a>
                        </c:if>
                    </div>
                
                </div>
                
            </div>
            
            <div class="group_right">
            
            	<div class="header"><a class="topic" href="#"></a></div>
                <ul>
                	<c:if test="${empty group.hottopic}">
                		<li>暂时该圈子没有话题</li>
                	</c:if>
                	<c:forEach items="${group.hottopic}" var="topic">
                	<li>
                    	<dl>
                        	<dt>
                            	<a href="#"><img src="/pic/${topic.avatarFileName}" alt="" /></a>
                            </dt>
                            <dd>
                            	<p><a href="#">@${topic.username}：</a>${topic.topictitle}</p>
                                <p class="time">${topic.timepassed}</p>
                            </dd>
                        
                        </dl>
                    	<b class="num">${topic.postcount}</b>
                    </li>
                    </c:forEach>
                </ul>
                
                <div class="header"><a class="topic newtopic" href="#"></a></div>
                <ul>
                	<c:if test="${empty group.latesttopic}">
                		<li>暂时该圈子没有话题</li>
                	</c:if>
                	<c:forEach items="${group.latesttopic}" var="topic">
                	<li>
                    	<dl>
                        	<dt>
                            	<a href="#"><img src="/pic/${topic.avatarFileName}" alt="" /></a>
                            </dt>
                            <dd>
                            	<p><a href="#">@${topic.username}：</a>${topic.topictitle}</p>
                                <p class="time">${topic.timepassed}</p>
                            </dd>
                        
                        </dl>
                    	<b class="num">${topic.postcount}</b>
                    </li>   
                	</c:forEach>
                </ul>
            </div>
        
        </div></div>
    </div> 
</c:forEach>

<c:if test="${!empty grouplist}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:getMyGroup(-1,-1,null,#page#);"></psf:page>
</c:if>