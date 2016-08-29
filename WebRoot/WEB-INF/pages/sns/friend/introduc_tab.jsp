<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<dl class="tab03">
	<dd>
		<ul>
			<li class="<psf:current key="introducTab" value="get"/>"><a href="/sns/friend/introducget">我收到的引荐</a></li>
			<li class="<psf:current key="introducTab" value="send"/>"><a href="/sns/friend/introducsend">我发送的引荐</a></li>
		</ul>
	</dd>
	<dt>
		<a href="javascript:void(0)">设置谁可以为我引荐品友</a>
	</dt>
</dl>
