<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div>
	<div class="sns-statustitle"><h3>你可能喜欢的…</h3></div>
    <div class="sns-statustab tab02">
        <ul>
            <li class="current"><a href="javascript:loadRecommend('sns_index_recommend',1,1,2)">品友</a></li>
            <li><a href="javascript:loadRecommend('sns_index_recommend',2,1,2)">圈子</a></li>
            <li><a href="javascript:loadRecommend('sns_index_recommend',3,1,1)">秀场</a></li>
            <li><a href="javascript:loadRecommend('sns_index_recommend',4,1,1)">体验</a></li>
            <li><a href="javascript:loadRecommend('sns_index_recommend',5,1,1)">指南</a></li>
            <li><a href="javascript:loadRecommend('sns_index_recommend',6,1,7)">商品</a></li>
        </ul>
    </div>

    <div id="sns_index_recommend"></div>
    
</div>