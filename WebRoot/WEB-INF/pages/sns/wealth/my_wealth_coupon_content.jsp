<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(document).ready(function(){
		initData();
	});
	function initData(){
		$("#tab"+${type}).attr("class","hover");
	}
	function changeTab(type){
		window.location.href="/sns/wealth/mywealthcoupon?type="+type;
	}
</script>
<!-- 我的返券内容 -->
		<div class="pagenav"></div>
        <div class="warningbox">
			<c:choose>
				<c:when test="${empty validCoupon}"><span>您当前无可用礼券</span></c:when>
				<c:otherwise>
					您当前可用礼券:
						<c:forEach items="${validCoupon}" var="valid" begin="1" end="4">
							<span>${valid.amountType }元券 <b>${valid.count }</b> 张</span>
						</c:forEach>
						<c:if test="${validCouponCount > 3}"> ...</c:if>
							<span>共累计余额：<b>${validCouponSumAmount }</b> 元</span>
				</c:otherwise>
			</c:choose>
		</div>
        <div>
        	<div id="Coupon">
                <ul>
                	<li id="tab1" onclick="changeTab(1)" class="">我的优惠券</li>
                    <li id="tab2" onclick="changeTab(2)" >未使用的优惠券</li>
                    <li id="tab3" onclick="changeTab(3)">已使用的优惠券</li>   
                    <li id="tab4" onclick="changeTab(4)">过期优惠券</li> 
                </ul>
             </div>
             <div class="lib_Contentbox lib_tabborder">  
                 <div class="lib_Contentbox lib_tabborder">  
                      <div id="con_four_1" > 
                           <div id="couponbox">
                                <table width="100%" border="0">
                                      <thead>
                                      <tr>
                                      	<td width="20%">编号</td>
                                        <td width="15%">类型</td>
                                        <td width="35%">有效期</td>
                                        <td width="15%">适用范围</td>
                                      </tr>
                                      </thead>
									<c:forEach items="${couponList}" var="coupon">
                                      <tr>
                                        <td>${coupon.couponid } </td>
                                        <td>${coupon.amount }元优惠券 </td>
                                        <td>${coupon.startTime }至${coupon.endTime }</td>
                                        <td>${coupon.summary }</td>
                                      </tr>
									</c:forEach>
                                </table>
                           </div>
                      </div>

				<c:if test="${pageCount > 1}">
					<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/wealth/mywealthcoupon?type=${type}&page=#page#"></psf:page>
			    </c:if>
                                                                                     
                                                                                       
                   </div>
             </div>
     </div>
