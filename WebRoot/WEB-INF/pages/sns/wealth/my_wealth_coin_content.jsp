<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(document).ready(function(){
		initData();
	});
	function initData(){
		$("select[name='Industry']").val(${type});
	}
	function changeType(){
		window.location.href="/sns/wealth/mywealthcoin?type="+$("select[name='Industry']").val();
	}
</script>
<!-- 我的享金 -->
						<div class="pagenav"></div>
               			<div class="warningbox"><span>享金:<b>${balanceCoin }</b>元</span><span>累计:<b>${sumCoin }</b>元</span></div>
                           <div id="mywealth">
                           <table width="100%" border="0">
                           <thead>
                           	<tr>
                               <td width="40%">商品名称</td>
                               <td width="18%">购买数量</td>
                               <td width="18%">
                               	<select name="Industry" style="clear:right;" onchange="changeType();" >
									<option value="1"  selected="selected">全部类型</option>
									<option value="2" >收入</option>
									<option value="3" >支出</option>
								</select>
                               </td>
                               <td width="12%">发生额</td>
                               <td width="12%">余额</td>
                             </tr>
                           </thead>
							<c:forEach items="${coinList}" var="coin">
                             <tr>
                               <td height="60">
                               	<img src="/pic/${coin.productPic }" class="proimg" />
                                   <div class="protext"><a href="#">${coin.pname }</a> </div>
                               </td>
                               <td>
                               	<p><img src="images/user_header.gif" class="user_header" alt="userName" /></p>
                                   <p><a href="#">5</a></p>
                               </td>
                               <td><span class="mode_balance">${coin.type }</span></td>
                               <td><span class="mode_payments">${coin.amount }元</span></td>
                               <td><span class="mode_payments">${coin.balance }元</span></td>
                             </tr>
                           </c:forEach>                                          
                           </table>

						<c:if test="${pageCount > 1}">
							<psf:page pageCount="${pageCount}" page="${curPage}" action="" href="/sns/wealth/mywealthcoin?type=${type}&page=#page#"></psf:page>
						</c:if>
                    </div>
                           