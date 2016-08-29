<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(function(){
		loadRecommend('group_joined',2,1,1);
		loadRecommend('group_recommend',2,1,2);
		loadRecommend('group_hot',2,1,3);
		loadRecommend('group_new',2,1,4);
	});
</script>


<div class="hor3-list">
	<div class="sns-statustitle"><h3>我参加的圈子</h3></div>
	<div id="group_joined"></div>
	
	<div class="sns-statustitle"><h3>猜您喜欢的圈子</h3></div>
	<div id="group_recommend"></div>
	
	<div class="sns-statustitle"><h3>热门圈子</h3></div>
	<div id="group_hot"></div>
	
	<div class="sns-statustitle"><h3>新建圈子</h3></div>
	<div id="group_new"></div>
	
	<!--
	<div class="group_right_list_normal">
		<div class="group_right_item">
			<div class="group_right_pic">
			<a href="#">
			<img title="想唱就唱" src="/pic/2.jpg">
			</a>
			</div>
			<div class="group_right_name">
			<a title="想唱就唱" href="#">想唱就唱</a>
			</div>
			<div class="group_right_user">
			<a title="lgyu" href="#">lgyu</a>
			</div>
			<div class="group_right_friend_count">
			圈友
			<span>50</span>
			</div>
			<div class="group_right_opic_count">
			话题
			<span>2</span>
			</div>
		</div>
	</div>
	<div class="product_right_right_prev_and_next">
		<span>上一组</span>
		<a href="javascript:loadRecommend('hot_product_list',6,2,3)">下一组</a>
	</div>
	-->
</div>
