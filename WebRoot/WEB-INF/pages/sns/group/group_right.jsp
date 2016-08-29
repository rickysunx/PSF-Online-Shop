<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript" src="/js/sns/index.js"></script>
<psf:snsUserInfo/>
<psf:include page="/sns/group/invite.jsp"/>
<psf:include page="/sns/group/list.jsp"/>
