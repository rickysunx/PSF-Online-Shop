<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
	
	<script type="text/javascript">
		initPsfTypes();
	
		$("#all").click(function(){
			if($(this).is(":checked")){
				$("input[name='userid']").attr("checked",true);
			}else{
				$("input[name='userid']").attr("checked",false);
			}
		});
		
		/*一键删除 type=1*/
		function delGroupFriend(type, param){
			var tip = "";
			if(type == 1){
				param = $("#user_form").serialize();
				tip = "确定将他们踢出圈子?"
			}else{
				param = $.param(param);
				tip = "确定将此人 踢出圈子?"
			}
			if(confirm("确定将踢出圈子?")){
				$.post(
					"/sns/group/manage/del_groupfriend",
					param,
					function(result){
						if(result.success){
							$.psfInfoDialog("删除成功!");
							loadMemberList(-1,null,-1,-1);
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
			param = $.param(param)+"&type="+type;
			$.post(
				"/sns/group/manage/manage_admin",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog("操作成功!");
						loadMemberList(-1,null,-1,-1);
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	</script>
	
	<div class="header">
    	<a href="/sns/group/manage/inviteabout?groupid=${g.groupid}">邀请好友和粉丝</a>
    	共有${(empty g.membercount) ? 0 : g.membercount}位成员(上限1000人),管理员${g.managecount}人(上限10人)
    </div>
    
    <div class="member_table">
        <dl class="actions">
            <dt>
               	 排序：<a class="current" href="javascript:void(0)" onclick="loadMemberList(-1,null,1,-1)">最新加入</a>  
               	 <a href="javascript:void(0)" onclick="loadMemberList(-1,null,2,-1)">最新发言</a>　
               	 <a href="javascript:void(0)" onclick="loadMemberList(-1,null,3,-1)">圈子身份</a>　
               	 <a href="javascript:void(0)" onclick="loadMemberList(-1,null,4,-1)">最多发言</a>
            </dt>
            <dd>
                <ul>
                    <li>
                        <input id="all" type="checkbox"/><label for="all">全选</label>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="delGroupFriend(1)">一键踢人</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <script type="text/javascript">
        	$(".member_managebox .actions dt a:eq("+(params['orderby']-1)+")").addClass("current").siblings().removeClass("current");
        </script>
       
        <form id="user_form">
        	<input type="hidden" name="groupid" value="${g.groupid}"/>
	        <table cellpadding="0">
	        	<tr>
	            	<th class="checkbox"></th>
	                <th class="name">成员</th>
	                <th class="dignity">圈子身份</th>
	                <th class="num">圈子发言数</th>
	                <th class="time">加入时间</th>
	                <th class="time">最后发言时间</th>
	                <th class="operations"></th>
	            </tr>
	           
	            <c:if test="${empty userlist}">
	           		<tr><td colspan="7">当前请求数据为空</td></tr>
	            </c:if>
	            <c:forEach items="${userlist}" var="u">
		            <tr>
		            	<td class="checkbox">
		            		<c:if test="${u.role < g.role}"><input name="userid" type="checkbox" value="${u.uid}"/></c:if>
		            	</td>
		                <td class="name">
		                	<div class="img"><a href="javascript:void(0)" psftype="card" uid="${u.uid}"><img src="/pic/${u.avatarFileName}" alt="" /></a></div>
		                    <p><a href="javascript:void(0)" psftype="card" uid="${u.uid}">${u.username}</a></p>
		                </td>
		                <td class="dignity">${u.roleName}</td>
		                <td class="num">${u.postcount}</td>
		                <td class="time">${u.chnAddtime}</td>
		                <td class="time">${u.chnLasttime}</td>
		                <td class="operations">
		                	<c:if test="${u.uid != loginPsfUid}">
			                	<a id="operation_${u.uid}" href="#">操作<em></em></a>
			                	<script type="text/javascript">
								$("#operation_${u.uid}").psfMenu({
									pos:'over',title:'<a href="#">操作<em></em></a>',items:[
									<c:if test="${u.role < g.role}">
										{name:"踢出圈子",handler:"delGroupFriend(2,{'groupid':${g.groupid},'userid':${u.uid}})"},
										<c:if test="${u.role==1 && g.role==2}">
											{name:"免去管理员",handler:"manageAdmin(0,{'groupid':${g.groupid},'uid':${u.uid}})"}
										</c:if>
										<c:if test="${u.role==0 && g.role==2}">
											{name:"升为管理员",handler:"manageAdmin(1,{'groupid':${g.groupid},'uid':${u.uid}})"}
										</c:if>
									</c:if>
								]});
								</script>
							</c:if>
		                </td>
		            </tr>
	            </c:forEach>
	        </table>
	        <c:if test="${!empty userlist}">
				<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadMemberList(-1,null,-1,#page#);"></psf:page>
			</c:if>
        </form>
    </div>