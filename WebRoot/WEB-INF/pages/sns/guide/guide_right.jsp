<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(document).ready(function() {
		rank('rankers', 1, 3);
	});
</script>

<psf:snsUserInfo/>
<psf:include page="/sns/guide/coins_guide_help.jsp"/>
<div class="hor3-list" id="rankers"></div>
<psf:include page="/sns/hot_product.jsp"/>
<psf:include page="/sns/maybe_product.jsp"/>