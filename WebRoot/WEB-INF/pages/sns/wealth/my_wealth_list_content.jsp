<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 我的财富内容 -->
<script language="javascript" src="/js/sns/jscharts.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		initData();
	});

	function initData(){
		var ap = ${ap_wealth};
		$("select[name='Industry']").val(ap);
	}
	function updateAp_wealth(){
		$.post(
			"/sns/wealth_update","ap="+$("select[name='Industry']").val(),
			function(data){
				if(data.success == 1){
					$("select[name='Industry']").val($("select[name='Industry']").val());
				} else {

				}
			},"json"
		);
	}
</script>
<script>
<!--
function setTab(name,cursel,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  menu.className=i==cursel?"hover":"";
  con.style.display=i==cursel?"block":"none";
 }
}
//-->
</script>

            			<div class="wealthbox">
                       <div class="wealthtitle"> <span class="title left">我的财富</span>
                                <select name="Industry" onchange="updateAp_wealth()">
									<option value="1"  selected="selected">完全公开</option>
									<option value="2" >对好友公开</option>
									<option value="3" >关注的公开</option>
									<option value="4" >完全隐藏</option>
								</select>
                              </div>
                               <div class="wealthshow">
                              	  <table width="100%" border="0">
                               	  <tr>
                               	    <td width="25%" height="35">享金：<span class="waelthmoney">${balanceCoin }</span>元</td>
                               	    <td width="25%">累计：<span class="waelthmoney">${sumCoin }</span>元</td>
                               	    <td width="24%"><a href="#">去商城购物 &gt;&gt;</a></td>
                               	    <td width="26%"><a href="#">我要提现 &gt;&gt;</a></td>
                             	    </tr>
                               	  <tr>
                               	    <td height="35">积分:<span class="waelthIntegral"><a href="#">${balancePoint }</a></span>分</td>
                               	    <td>累计:<span class="waelthIntegral"><a href="#">${sumPoint }</a></span>分</td>
                               	    <td>&nbsp;</td>
                               	    <td>&nbsp;</td>
                             	    </tr>
                               	  <tr>
                               	    <td height="35">礼券:<span class="waelthIntegral"><a href="#">${balanceCoupon }</a></span>元</td>
                               	    <td>累计:<span class="waelthIntegral"><a href="#">${sumCoupon }</a></span>元</td>
                               	    <td>&nbsp;</td>
                               	    <td>&nbsp;</td>
                             	    </tr>
                             	  </table>
                               </div>
                                             
                            </div>
                            <div class="chart">
                            <div class="charttab">
                        		  <ul>
                                 	<li id="three1" onclick="setTab('three',1,3)" class="hover">享金走势图</li>
                           			<li id="three2" onclick="setTab('three',2,3)" >积分走势图</li>
                           			<li id="three3" onclick="setTab('three',3,3)">礼券走势图</li>   
                          		 </ul>
                           </div>
                               <div class="lib_Contentbox lib_tabborder">  
    								 <div id="con_three_1" class="charttabbox" > 
                                    		<div id="wealth_list">Loading...</div>

										<script type="text/javascript">					
											var myData = new Array();
											<c:forEach items="${coinList}" var="coin">
												var array = ["${coin.date}",${coin.amount}];
												myData.push(array);
											</c:forEach>
											var myChart = new JSChart('wealth_list', 'line');
											myChart.setDataArray(myData);
											myChart.setTitle('');
											myChart.setTitleColor('#000');
											myChart.setTitleFontSize(11);
											myChart.setAxisNameX('');
											myChart.setAxisNameY('');
											myChart.setAxisColor('#8D8B8B');
											myChart.setAxisValuesColor('#343434');
											myChart.setAxisPaddingLeft(30);
											myChart.setAxisPaddingRight(20);
											myChart.setAxisPaddingTop(40);
											myChart.setAxisPaddingBottom(40);
											myChart.setAxisValuesNumberX(12);
											myChart.setGraphExtend(false);
											myChart.setGridColor('#c2c2c2');
											myChart.setLineWidth(4);
											myChart.setLineColor('#9F0505');
											myChart.setSize(620, 321);
											myChart.setBackgroundImage('');
											myChart.draw();
										</script>
                                    </div>
                                    <div id="con_three_2" style="display:none;" class="charttabbox" > 
                                    	<div id="Integral">Loading...</div>

										<script type="text/javascript">
									//		var myData = new Array(["2010.12", 260], ["2011.01", 407], ["2011.02", 145], ["2011.03", 260], ["2011.04", 150], ["2011.05", 210], ["2011.06", 113], ["2011.07", 311], ["2011.08", 138], ["2011.09", 119],["2011.10", 251],["2011.11", 145]);
											var myData = new Array();
											<c:forEach items="${pointList}" var="point">
												var array = ["${point.date}",${point.amount}];
												myData.push(array);
											</c:forEach>
											var myChart = new JSChart('Integral', 'line');
											myChart.setDataArray(myData);
											myChart.setTitle('');
											myChart.setTitleColor('#000');
											myChart.setTitleFontSize(11);
											myChart.setAxisNameX('');
											myChart.setAxisNameY('');
											myChart.setAxisColor('#8D8B8B');
											myChart.setAxisValuesColor('#343434');
											myChart.setAxisPaddingLeft(30);
											myChart.setAxisPaddingRight(20);
											myChart.setAxisPaddingTop(40);
											myChart.setAxisPaddingBottom(40);
											myChart.setAxisValuesNumberX(12);
											myChart.setGraphExtend(false);
											myChart.setGridColor('#c2c2c2');
											myChart.setLineWidth(4);
											myChart.setLineColor('#9F0505');
											myChart.setSize(620, 321);
											myChart.setBackgroundImage('');
											myChart.draw();
										</script>
                                    </div>
                                     <div id="con_three_3" style="display:none;" class="charttabbox" >  
                                     <div id="Coupon">Loading...</div>

										<script type="text/javascript">
										//	var myData = new Array(["2010.12", 60], ["2011.01", 100], ["2011.02", 45], ["2011.03", 60], ["2011.04", 50], ["2011.05", 56], ["2011.06", 133], ["2011.07", 102], ["2011.08", 78], ["2011.09", 63],["2011.10", 51],["2011.11", 95]);
											var myData = new Array();
											<c:forEach items="${couponList}" var="coupon">
												var array = ["${coupon.date}",${coupon.amount}];
												myData.push(array);
											</c:forEach>
											var myChart = new JSChart('Coupon', 'line');
											myChart.setDataArray(myData);
											myChart.setTitle('');
											myChart.setTitleColor('#000');
											myChart.setTitleFontSize(11);
											myChart.setAxisNameX('');
											myChart.setAxisNameY('');
											myChart.setAxisColor('#8D8B8B');
											myChart.setAxisValuesColor('#343434');
											myChart.setAxisPaddingLeft(30);
											myChart.setAxisPaddingRight(20);
											myChart.setAxisPaddingTop(40);
											myChart.setAxisPaddingBottom(40);
											myChart.setAxisValuesNumberX(12);
											myChart.setGraphExtend(false);
											myChart.setGridColor('#c2c2c2');
											myChart.setLineWidth(4);
											myChart.setLineColor('#9F0505');
											myChart.setSize(620, 321);
											myChart.setBackgroundImage('');
											myChart.draw();
										</script>
                                     
                                     </div>
                                </div>
                      </div>
                      <div class="chart">
                      <p><span class="title">享金累计柱形图</span></p>
                      <div class="pagenav"></div>
                      <div style="background:#fff;">
                       <div id="Accumulative">Loading...</div>

								<script type="text/javascript">
							//		var myData = new Array(['2011.11', 437], ['2011.12', 322], ['2012.01', 233], ['2012.02', 110], ['2012.03', 287], ['2012.04', 290], ['2012.05', 199], ['2012.06', 198], ['2012.07', 334], ['2012.08', 234], ['2012.09', 275], ['2012.10', 354]);
									var myData = new Array();
										<c:forEach items="${coinSumList}" var="coin">
											var array = ["${coin.date}",${coin.amount}];
											myData.push(array);
										</c:forEach>
									var colors = ['#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616', '#931616'];
									var myChart = new JSChart('Accumulative', 'bar');
									myChart.setDataArray(myData);
									myChart.colorizeBars(colors);
									myChart.setTitle('');
									myChart.setTitleColor('#8E8E8E');
									myChart.setAxisNameX('');
									myChart.setAxisNameY('');
									myChart.setAxisColor('#C4C4C4');
									myChart.setAxisNameFontSize(16);
									myChart.setAxisNameColor('#999');
									myChart.setAxisValuesColor('#777');
									myChart.setAxisColor('#B5B5B5');
									myChart.setAxisWidth(1);
									myChart.setBarValuesColor('#931616');
									myChart.setBarOpacity(0.5);
									myChart.setAxisPaddingTop(30);
									myChart.setAxisPaddingBottom(40);
									myChart.setAxisPaddingLeft(45);
									myChart.setTitleFontSize(11);
									myChart.setBarBorderWidth(0);
									myChart.setBarSpacingRatio(70);
									myChart.setBarOpacity(0.9);
									myChart.setFlagRadius(12);
									myChart.setSize(650, 348);
									myChart.setBackgroundImage('');
									myChart.draw();
								</script>
								</div>
                               </div>
                               <div class="pageFAQ">
                               		<p class="title">常见问题</p>
                                    <p class="hongse">1、什么是享金？</p>
                                    <p>答：品友在品上丰100购买商品后，分享商品评价及使用心得，更好的方式是通过秀场秀出您的商品或搭配；不购买商品的品友也可收集品牌或商品的相关信息，发表指南。其他品友购买商品时参考了您的分享，您即可获得享金。</p>
                                    <p class="hongse">2、享金能做什么？</p>
									<p>答：享金等同于现金，能在品上丰100上直接消费；如您不想消费，享金金额超过800元时，可申请提现，款项可直接打到您的银行卡上；提现时需要按照国家税务规定，帮您代缴个人所得税。</p>
                               </div>