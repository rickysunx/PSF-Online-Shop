<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(function(){
		loadRecommend("recommendlist",1,1,10,{"uid":${posterInfo.uid}});
		loadRecommend("friendlist",1,1,7,{"uid":${posterInfo.uid}});
		loadRecommend("fanslist",1,1,8,{"uid":${posterInfo.uid}});
		loadRecommend("followlist",1,1,9,{"uid":${posterInfo.uid}});
		loadRecommend("expproductlist",6,1,9,{"uid":${posterInfo.uid}});
		loadRecommend("grouplist",2,1,5,{"uid":${posterInfo.uid}});
	});
</script>

<psf:include page="/sns/detail_post_userinfo.jsp"/>
<!-- <psf:include page="/sns/user_info_self.jsp"/> -->
<div class="sns-statustitle"><h3>关注TA的还关注</h3></div>
<div id="recommendlist"></div>

<div class="sns-statustitle"><h3>TA的好友</h3></div>
<div id="friendlist"></div>

<div class="sns-statustitle"><h3>TA的粉丝</h3></div>
<div id="fanslist"></div>

<div class="sns-statustitle"><h3>TA的关注</h3></div>
<div id="followlist"></div>

<div class="sns-statustitle"><h3>TA发布的体验商品</h3></div>
<div id="expproductlist"></div>

<div class="sns-statustitle"><h3>TA感兴趣的圈子</h3></div>
<div id="grouplist"></div>
