<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	function loadbrand(cateid, keyword, page){
		var options = {"cateid":cateid, "keyword":keyword, "page":page};
		
		$("#brand_list").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#brand_list").load(
			"/sns/guide/get_brand",
			options
		);
	}

	function search_brand(){
		var keyword = $.trim($("#brand_search").val());
		var cateid = $(".sellistbox ol li.current").attr("cateid");
		loadbrand(cateid, keyword, 1);
	}
	
	
</script>

<div class="logoselect_dialog">
    <div style="border:1px gray solid;width:684px;background:#fff">
    
        <div class="layerTop layerTop_big">
        
        	<a class="close" href="javascript:closeSelectBrandDialog('select_brand_dialog')"></a>
        	<div class="searchbox02">
            
            	<input id="brand_search" name="keyword"/>
                <a class="searchbtn" href="javascript:search_brand()"></a>
            	<script type="text/javascript">
            		initInput("brand_search", "品牌搜索");
            	</script>
            </div>
            <h6><span>*</span> 最多选择同一分类的三个品牌</h6>
        
        </div>
        
        <div class="sellistbox">
        
            <ol>
            	<c:forEach items="${catelist}" var="cate">
            	<li cateid="${cate.cateid}">${cate.catename}</li>
            	</c:forEach>
            	<!--  
                 <li cateid="7">妈妈宝宝</li>
               	 <li cateid="6">数码家电</li>
               	 <li cateid="8">美食美酒</li>
               	 <li cateid="1">时尚女装</li>
               	 <li cateid="4">户外运动</li>
               	 <li cateid="3">美妆护理</li>
               	 <li cateid="2">潮流男装</li>
               	 <li cateid="5">鞋包配饰</li>
               	 <li cateid="9">优质奢品</li>
               	 <li cateid="10">家具家居</li>
               	-->
            </ol>
           	<script type="text/javascript">
           		$(".sellistbox ol li[cateid='${first}']").addClass("current");
           		loadbrand(${first},null,1);
           		
           		$(".sellistbox ol li").click(function(){
           			$(this).addClass("current").siblings().removeClass("current");
           			var cateid = $(this).attr("cateid");
           			var keyword = $.trim($("#brand_search").val());
           			loadbrand(cateid, keyword, 1);
           		});
           	</script>
            
            <div id="brand_list"></div>
        </div>
    
    </div>
</div>
