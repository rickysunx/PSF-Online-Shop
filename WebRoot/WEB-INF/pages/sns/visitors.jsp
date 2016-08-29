<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(document).ready(function(){
		loadRecommend('vistor_list',1,1,3);
	});
</script>

<div class="hor3-list">
	<div class="sns-statustitle">
		<h3>那些人看过我…</h3>
	</div>
	
	<div id="vistor_list"></div>
	<!--  
	<div class="listbox s_clear">
		<ul>
			<li>
				<div class="img imgborder">
					<a href="#"><img src=""/></a>	
				</div>
				<p><a href="#">test</a></p>
				<div class="btns">
					<a class="button02" href="#" ><span><em></em>加关注</span></a>
				</div>
			</li>
            <li>
				<div class="img imgborder">
					<a href="#"><img src=""/></a>	
				</div>
				<p><a href="#">test</a></p>
				<div class="btns">
					<a class="okbtn"><em></em>已关注</a>
				</div>
			</li>
		</ul>
		<div class="more"><a href="#">下一组</a></div>
	</div>
	-->
</div>
