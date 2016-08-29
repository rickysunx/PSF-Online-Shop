<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div id="sns_header" class="s_clear">

	<div class="logo logobox">
      	<h3><a href="/sns/space">${snsUserInfo.username }</a></h3>
    </div>
    
    <div class="searchbox">
        <div class="searchgroup">
            <input id="search" value="秀场、圈子、活动" />
            <div class="select">
                <a class="nowSelect" href="#"><i>秀场</i><em></em></a>
                <div class="selOption">
                    
                    <div><a href="#">秀场</a></div>
                    <div><a href="#">圈子</a></div>
                    <div><a href="#">指南</a></div>
                    <div><a href="#">体验</a></div>
                    <div><a href="#">活动</a></div>
                    
                </div>
            </div>
        </div>
        <a class="searchbtn" href="#"></a>
    </div>
    
</div>