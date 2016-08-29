<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<ul class="myinfo_tab">
	<li class="<psf:current key="myInfoTab" value="info"/>">
		<a href="/sns/myinfo/info/basic">个人资料</a>
	</li>
	<li class="<psf:current key="myInfoTab" value="private"/>">
		<a href="/sns/myinfo/private">隐私设置</a>
	</li>
	<li class="<psf:current key="myInfoTab" value="blacklist"/>">
		<a href="/sns/myinfo/blacklist">黑名单</a>
	</li>
	<li class="<psf:current key="myInfoTab" value="bankaccount"/>">
		<a href="/sns/myinfo/bankaccount">银行账户</a>
	</li>
	<li class="<psf:current key="myInfoTab" value="address"/>">
		<a href="/sns/myinfo/address">收货地址</a>
	</li>
</ul>