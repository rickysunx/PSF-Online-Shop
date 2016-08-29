<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
$(document).ready(function(){
	<c:if test="${pub != -1}">
		$("#exp_"+${pub}).addClass("current");
	</c:if>
});
</script>


<div class="photoselect_dialog">
	<div style="border:1px #ff0 solid;width:696px;background:#fff">
	
		<div class="layerTop layerTop_big">
		
			<a class="close" href="javascript:closeSelectPorductDialog('select_product_dialog')"></a>
			<div class="searchbox02">
				<c:choose>
					<c:when test="${empty keyword}"><input name="keyword" id="keyword" value="商品搜索" /></c:when>
					<c:otherwise><input name="keyword" id="keyword" value="${keyword }" /></c:otherwise>
				</c:choose>
				
				<a class="searchbtn" href="javascript:search(${cateid},${pub },1);"></a>
			
			</div>
			<h6><span>*</span>选择发布商品与品有一起分享，玩赚生活吧</h6>
		
		</div>
		
		<div class="tab tab03" id="exp_pub_tab">
			<ul>
				<li id="exp_0" type="selectProduct"><a href="javascript:selectProductByChoose(0,0,1,'${keyword }');" >尚未发表</a></li>
				<li id="exp_1" type="selectProduct"><a href="javascript:selectProductByChoose(0,1,1,'${keyword }');" >已发表</a></li>
			</ul>

		</div>
		<div class="edit_exp_tab">
			<a href="javascript:selectProductByChoose(0,${pub },1,'${keyword }');" id="productcate_0">全部</a>
			<c:forEach items="${productcates}" var="productcate" >
				<a href="javascript:selectProductByChoose(${productcate.cateid },${pub },1,'${keyword }');" id="productcate_${productcate.cateid }">${productcate.catename }</a>
			</c:forEach>
		</div>
		<div class="item s_clear">
			<c:choose>
				<c:when test="${empty productList.list}">
					没有商品
				</c:when>
				<c:otherwise>
					<c:forEach items="${productList.list}" var="product">
						<dl class="current">
							<dt class="imgborder01"><a href="javascript:selectProduct('${product.pname }',${product.pid },${product.price },'${product.picname}');"><img src="/pic/${product.picname}"/></a></dt>
							<dd class="info">
								<h6>${product.pname }</h6>
								<p>商品号:<br /><span>${product.pcode }</span></p>
							</dd>
						</dl>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="bottom">
				<c:choose>
					<c:when test="${pageCount > 1}">
						<c:if test="${curPage == pageCount}">
							<div class="right"><a href="javascript:selectProductByChoose(${cateid },${pub },${curPage }-1,'${keyword }');">上一组</a></div>
						</c:if>
						<c:if test="${curPage == 1}">
							<div class="right"><a href="javascript:selectProductByChoose(${cateid },${pub },${curPage }+1,'${keyword }');">下一组</a></div>
						</c:if>
						<c:if test="${curPage>1 && curPage<pageCount}">
							<div class="right"><a href="javascript:selectProductByChoose(${cateid },${pub },${curPage }-1,'${keyword }');">上一组</a> <a href="javascript:selectProductByChoose(${cateid },${pub },${curPage }+1,'${keyword }');">下一组</a></div>
						</c:if>	
					</c:when>
				</c:choose>	
		</div>
</div>
</div>
