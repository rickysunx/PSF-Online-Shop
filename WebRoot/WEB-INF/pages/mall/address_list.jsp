<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	addressList = ${jsonAddressList};
</script>

<c:forEach var="addr" items="${addressList}">
	<li id="addressItem_${addr.address_id}">
		<div class="operations">
			<div class="actions">
				<c:if test="${addr.isdefault==1}">默认地址</c:if>
				<c:if test="${addr.isdefault==0}"><a href="javascript:setDefaultAddress(${addr.address_id});">设为默认</a></c:if>
				| <a href="#">删除</a>
			</div>
			<input name="userAddress" onclick="checkAddressRadio(${addr.address_id});" class="address_radio" type="radio" value="${addr.address_id}"/>
			<label>${addr.consignee} ${(addr.province_name eq addr.city_name)?"":addr.province_name} ${addr.city_name} ${addr.district_name} ${addr.address}</label>
		</div>
	</li>
	
	<c:if test="${addr.isdefault==1}">
<script type="text/javascript">
	$(document).ready(function(){
		$("#orderForm").find("input[name='userAddress'][value='"+${addr.address_id}+"']").attr("checked",true);
		checkAddressRadio(${addr.address_id});
	});
</script>
	</c:if>
</c:forEach>


<script type="text/javascript">
	$(document).ready(function() {
		currAddressPage = ${currPage};
		$("#addrPrev").hide();
		$("#addrNext").hide();
		<c:if test="${showPrev}">$("#addrPrev").show();</c:if>
		<c:if test="${showNext}">$("#addrNext").show();</c:if>
	});
</script>
