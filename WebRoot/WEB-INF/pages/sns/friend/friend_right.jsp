<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script src="/js/sns/index.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		loadRecommend('hot_user_list',1,1,1);
		loadRecommend('recommend_user_list',1,1,2);
	});
</script>
<psf:snsUserInfo/>
<psf:include page="/sns/friend/recommend_friend.jsp"/>
<psf:include page="/sns/friend/hot_friend.jsp"/>
<psf:include page="/sns/bad_report.jsp"/>