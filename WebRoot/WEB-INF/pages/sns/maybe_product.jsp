<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		if(${!empty showTab}){
			loadRecommend('recommend_product_list',6,1,2);
		}else if(${!empty expTab}){
			loadRecommend('recommend_product_list',6,1,4);
		}else if(${!empty guideTab}){
			loadRecommend('recommend_product_list',6,1,6);
		}
	});
</script>

<div class="hor3-list">

	<div class="sns-statustitle"><h3>猜你喜欢的${(!empty showTab)?'秀场':((!empty expTab)?'体验':((!empty guideTab)?'指南':''))}商品</h3></div> 
	<div id="recommend_product_list"></div>    
    <!--                 
    <div class="listbox listbox01 s_clear">
        <ul>
            <li>
                <div class="img imgborder01" >
                    <a href="#"><img src="/images/sns/photo/photo01.png" alt="" /></a>
                </div>
                <p><a href="#">时尚男士秋冬款式短抽万发分...</a></p>
                <p class="price"><b>品上价</b>￥225</p>
            </li>
        </ul>
        <div class="more"><a href="#">上一组</a><a href="#">下一组</a></div>
    </div>
    -->                
</div>