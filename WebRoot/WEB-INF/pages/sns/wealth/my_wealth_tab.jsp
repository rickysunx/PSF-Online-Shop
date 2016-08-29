<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 我的秀场二级页签 -->
<div class="tab_menu">
	<div class="linkbox">
		<dl>
			<dt><a class="<psf:current key="mywealthTab" value="mywealthlist"/>" href="/sns/wealth"><span><span>财富一览</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a class="<psf:current key="mywealthTab" value="mywealthcoin"/>" href="/sns/wealth/mywealthcoin"><span><span>我的享金</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a class="<psf:current key="mywealthTab" value="mywealthcoupon"/>" href="/sns/wealth/mywealthcoupon"><span><span>我的返券</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a class="<psf:current key="mywealthTab" value="mywealthpoint"/>" href="/sns/wealth/mywealthpoint"><span><span>我的积分</span></span></a></dt>
		</dl>
	</div>
</div>