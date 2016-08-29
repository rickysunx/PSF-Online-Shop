<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<ul class="myinfo_tab2">
	<li class="<psf:current key="infoTab" value="basic"/>">
		<a href="/sns/myinfo/info/basic">基本信息</a>
	</li>
	<li><b>|</b></li>
	<li class="<psf:current key="infoTab" value="avatar"/>">
		<a href="/sns/myinfo/info/avatar">设置头像</a>
	</li>
	<li><b>|</b></li>
	<li class="<psf:current key="infoTab" value="job"/>">
		<a href="/sns/myinfo/info/job">工作经历</a>
	</li>
	<li><b>|</b></li>
	<li class="<psf:current key="infoTab" value="edu"/>">
		<a href="/sns/myinfo/info/edu">教育经历</a>
	</li>
	<li><b>|</b></li>
	<li class="<psf:current key="infoTab" value="mylabel"/>">
		<a href="/sns/myinfo/info/mylabel">个人标签</a>
	</li>
</ul>