<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	//品牌logo单击选择
	$("div.img").each(function(){
		var img_div = this;
		$(this).find("div img").click(function(){
			
			if($(img_div).find("div input[name='brandid']").is(":checked")){
				$(img_div).find("div input[name='brandid']").attr("checked",false);
			}else{
				$(img_div).find("div input[name='brandid']").attr("checked",true);
			}
			
			if($("#brand_form input[name='brandid']:checked").length>3){
				$.psfInfoDialog("最多只能选择3个品牌哦!");
				$(img_div).find("div input[name='brandid']").attr("checked",false);
			}
			
		});
	});
	
	//验证选择品牌数量
	function validate(brandid){
		if($("#brand_form input[name='brandid']:checked").length>3){
			$.psfInfoDialog("最多只能选择3个品牌哦!");
			$("#brand_form input[value='"+brandid+"']").attr("checked", false);
		}
	}
</script>

<form id="brand_form">
    <div class="list">
    	<ul>
        	<c:if test="${empty brands.list}">
        		<p style="text-align:center;size:12px;">您尚未购买该类产品，不妨无<a href="#">商城</a>看看吧！</p>
        	</c:if>
        	<c:forEach items="${brands.list}" var="brand">
        	<li>
            	<div class="imgsdborder01">
                    <div class="img">
                        <div>
                        	<img height="84px" width="124px" src="/ecimage/${brand.brandlogo}"/>
                            <input type="checkbox" name="brandid" value="${brand.brandid}" onchange="validate(${brand.brandid})"/>
                        </div>
                    </div>
                    <div class="shadow"></div>
                </div>
                <p><a href="#">${brand.brandname}</a></p>
            </li>
            </c:forEach>
        </ul>
    	
    	<script type="text/javascript">
    		
    		$("#brand_form input[name='brandid']").each(function(){
    			var brandid = $.trim($(this).val());
    			if(selected_brandids.indexOf(brandid)>=0){
    				$(this).attr("checked",true);
    			}
    		});
    	</script>
    	
    	<div class="bottom">
    		<c:if test="${brands.pageCount > 1 }">
        		<div class="right">
        			<c:if test="${page eq 1}">
        				<a style="color:gray;">上一组</a> <a href="javascript:loadbrand(${cateid},${(empty keyword)? 'null':keyword},${page+1})">下一组</a>
        			</c:if>
        			<c:if test="${page>1 && page<brands.pageCount}">
        				<a href="javascript:loadbrand(${cateid},${(empty keyword)? 'null':keyword},${page-1})">上一组</a> <a href="javascript:loadbrand(${cateid},${(empty keyword)? 'null':keyword},${page+1})">下一组</a>
        			</c:if>
        			<c:if test="${page eq brands.pageCount}">
        				<a href="javascript:loadbrand(${cateid},${(empty keyword)? 'null':keyword},${page-1})">上一组</a> <a style="color:gray;">下一组</a>
        			</c:if>
        		</div>
        	</c:if>
        	<a class="button11" href="javascript:submit_brand()">确定</a>
            <a class="button11" href="javascript:closeSelectBrandDialog('select_brand_dialog')">取消</a>
        </div>
    
    </div>
</form>