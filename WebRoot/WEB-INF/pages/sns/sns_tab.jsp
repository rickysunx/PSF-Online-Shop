<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="snsbox-scrollbody"><a class="snsbox-upbtn" href="#"></a></div>
<div class="tab01">
	<div class="hold"><img class="icon" src="/images/temp/pricewrap.png" alt="" /><a href="#"><img src="/images/temp/small-banner.png" alt="" /></a></div>
   
	<ul>
		<li class="<psf:current key="snsTab" value="index"/>"><div><div><a href="/sns">首页</a></div></div></li>
		<li class="<psf:current key="snsTab" value="friend"/>"><div><div><a href="/sns/friend">好友</a></div></div></li>
		<li class="<psf:current key="snsTab" value="group"/>"><div><div><a href="/sns/group">圈子</a></div></div></li>
		<li class="<psf:current key="snsTab" value="money"/>"><div><div><a href="/sns/wealth">财富</a></div></div></li>
		<li class="<psf:current key="snsTab" value="show"/>"><div><div><a href="/sns/show">秀场</a></div></div></li>
		<li class="<psf:current key="snsTab" value="exp"/>"><div><div><a href="/sns/exp">购物体验</a></div></div></li>
		<li class="<psf:current key="snsTab" value="guide"/>"><div><div><a href="/sns/guide">购物指南</a></div></div></li>
	</ul>
</div>
