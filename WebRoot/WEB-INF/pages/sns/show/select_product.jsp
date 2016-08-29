<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">	
	function load_product(cateid, page, keyword){
		var option = {"cateid":cateid,"page":page,"keyword":keyword};
		$("#load_product").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#load_product").load(
			"/sns/show/get_product",
			option
		);
	}
	function search_show_product(){
		var keyword = $.trim($("#keyword").val());
		var cateid = $("#product_cate_list ul li.current").attr("id").split("_")[1];
		load_product(cateid, 1, keyword);
	}
	
</script>

<div class="photoselect_dialog">
	<div style="border:1px gray solid;width:696px;background:#fff">
	
		<div class="layerTop layerTop_big">
		
			<a class="close" href="javascript:closeSelectPorductDialog('select_product_dialog')"></a>
			<div class="searchbox02">
			
				<input id="keyword" name="keyword" value=""/>
				<a class="searchbtn" href="javascript:search_show_product()"></a>
				<script type="text/javascript">
					initInput("keyword", "商品搜索");
				</script>
			</div>
			<h6><span>*</span>选择发布商品与品有一起分享，玩赚生活吧</h6>
		
		</div>
		
		
		<c:choose>
			<c:when test="${!empty catelist}">
				<div class="tab tab03" id="product_cate_list">
					<ul>
						<c:forEach items="${catelist}" var="cate">
							<li id="cate_${cate.cateid}"><a href="javascript:void(0)">${cate.catename}</a></li>
						</c:forEach>
					</ul>
					<script type="text/javascript">
						$("#product_cate_list ul li:eq(0)").addClass("current");
						$("#product_cate_list ul li").click(function(){
							$(this).addClass("current").siblings().removeClass("current");
							var cateid = $(this).attr("id").split("_")[1];
							var keyword = $.trim($("#keyword").val());
							load_product(cateid, 1, keyword);
						});
						
						load_product(${catelist[0].cateid},1, null);	//初始加载，没有关键搜索词
					</script>
				</div>
				
				<div id="load_product"></div>
				
			</c:when>
			<c:otherwise>
				<div style="text-align:center">
					<p>亲，当前你还没有购买任何商品哦！赶紧去商城看看吧！</p>
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>
