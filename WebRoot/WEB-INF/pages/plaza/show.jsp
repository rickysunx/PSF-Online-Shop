<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>秀场</title>
	<psf:header/>
	<link href="/css/index.css" rel="stylesheet" type="text/css" />
	<link href="/css/plaza.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<psf:include page="/index_header.jsp"/>
	<psf:include page="/index_menu.jsp"/>
	<div class="index_main index_row s_clear">
		<div class="index_left">
			<psf:include page="/plaza/show_left.jsp"/>
		</div>
		<div class="index_right">
			<psf:include page="/plaza/show_right.jsp"/>
		</div>	
	</div>
</body>
</html>