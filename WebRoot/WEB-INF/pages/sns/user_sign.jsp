<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sgin_header">
	 <div class="sgin_left">
    	<div class="avatar"><a href="#"><img src="/pic/${postItem.avatarFileName}" alt="" /></a></div>
        <div class="sgin_info">
        	<h3><a href="#">${postItem.userName}</a></h3>
            <p>${postItem.signature}</p>
        </div>
    </div>
	<!-- 
    <div class="right">
    	<a class="sgin_share" href="#">分享</a><a class="sgin_forward" href="#">转发</a><a class="sgin_like" href="#">已喜欢</a>
    </div>
    -->
</div>