<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<form id="index_tab_form" style="display:none;">
<input name="otype" value="0"/>
<input name="order" value="1"/>
<input name="range" value="1"/>
<input name="page" value="1"/>
</form>
<a name="index_tab"></a>
<dl id="index_tab" class="tab02 sns_posttab">
	<dd>
        <ul id="index_tab_type">
            <li class="current"><a href="javascript:loadPostList(0,-1,-1,1);" hidefocus="true"><span></span>全部</a></li>
            <li><a href="javascript:loadPostList(1,-1,-1,1);" hidefocus="true"><span class="broad"></span>广播</a></li>
            <li><a href="javascript:loadPostList(2,-1,-1,1);" hidefocus="true"><span class="show"></span>秀场</a></li>
            <li><a href="javascript:loadPostList(3,-1,-1,1);" hidefocus="true"><span class="exp"></span>体验</a></li>
            <li><a href="javascript:loadPostList(4,-1,-1,1);" hidefocus="true"><span class="guide"></span>指南</a></li>
            <li><a href="javascript:loadPostList(5,-1,-1,1);" hidefocus="true"><span class="activity"></span>活动</a></li>
            <li><a href="javascript:loadPostList(6,-1,-1,1);" hidefocus="true" class="picbox"><span class="pic"></span>图片库</a></li>
        </ul>
    </dd>

</dl>

