<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

	<script type="text/javascript">
		$("ul li dl").click(function(){
			var input = $(this).find("dt input[name='uid']");
			if($(input).is(":checked")){
				$(input).attr("checked",false);
			}else{
				$(input).attr("checked",true);
			}
		});	
		$("ul li dl").hover(function(){
			$(this).addClass("current");
		},function(){
			$(this).removeClass("current");
		});
		$("ul li dl input").click(function(){
			if($(this).is(":checked")){
				$(this).attr("checked",false);
			}else{
				$(this).attr("checked",true);
			}
		});
		
	</script>
	
    <ul>
    	<c:if test="${empty userlist}">
    		<li><p style="text-align:center">你还没有好友喔，赶紧去加好友吧!</p></li>
    	</c:if>
    	<c:forEach items="${userlist}" var="user">
        <li>
        	<dl>
                <dt>
                    <input type="checkbox" name="uid" value="${user.uid}"/>
                    <a href="javascript:void(0)" psftype="cart" uid="${user.uid}"><img src="/pic/${user.avatarFileName}" alt=""/></a>
                </dt>
                <dd><a href="javascript:void(0)">${user.username}</a></dd>
            </dl>
        </li>
        </c:forEach>
    </ul>
    
     <script type="text/javascript">
     		var selected_uids = "";
     		$("#selected_userform input[name='selected_uid']").each(function(){
     			selected_uids += $(this).val()+",";
     		});
     		
     		$("ul li").each(function(){
     			var uid = $(this).find("dl dt input[name='uid']").val();
     			uid = $.trim(uid)+",";
     			if(selected_uids.indexOf(uid)>=0){
     				$(this).find("dl dt input[name='uid']").attr("checked", true);
     			}
     		});
     </script>
    
    <div class="bottom">
        <div class="right">
            <psf:simplepage pageCount="${pageCount}" action="javascript:loadInviteUser(-1,null,#page#);" page="${page}"></psf:simplepage>
        </div>
        <a class="button" href="javascript:void(0)" onclick="submitInviter();">确定</a>
        <a class="button" href="javascript:void(0)" onclick="closeInviteDialog();">取消</a>
    </div>


	<script type="text/javascript">
		initPsfTypes();
	</script>