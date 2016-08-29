<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(function(){
		loadGroupFriends(${group.groupid},"newmember_list",3,1);
	});
</script>

<div class="group_right_list">

	<div class="group_body">
    
        <h5>新人报道</h5>
        <div id="newmember_list"></div>  
    </div>

</div>