<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
</script>

<psf:include page="/sns/brand/brand_info.jsp"></psf:include>
 
    <div>
    	<dl id="index_tab" class="tab02 sns_posttab">
			 <dd style="float:right;width:200px;" class="s_clear">
		    	<div class="searchbox">
					<div class="searchgroup">
						<input id="search" value="输入您想找的东东">
					</div>
					<a class="searchbtn" href="#"></a>
				</div>
		    </dd>
		    <dt id="index_tab_range">    
		        <a class="current" href="javascript:void(0);" hidefocus="true">最新</a>
		        <a href="javascript:void(0);" hidefocus="true">最热</a>

		    </dt>
		   
			<dd>
		        <ul id="index_tab_type">
		            <li class="current"><a href="javascript:loadPostList(1,-1,-1,1);" hidefocus="true"><span class="broad"></span>广播</a></li>
		            <li><a href="javascript:void(0)" hidefocus="true"><span class="show"></span>商品</a></li>
		            <li><a href="javascript:void(0)" style="width:60px" hidefocus="true"><span class="exp"></span>品牌故事</a></li>
		        </ul>
		    </dd>
		
		</dl>

		<div class="post_tab_menu">
		    <ul>
		    	<li>
		        	<a class="current" href="javascript:void(0)" onclick="loadGroupPost(0,null,-1,1)"><span><span>广播</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(2,null,-1,1)"><span><span>相关秀场</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(3,null,-1,1)"><span><span>相关体验</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(4,null,-1,1)"><span><span>相关指南</span></span></a>
		        </li>
		    </ul>
		</div>
		
		<div id="post_list" class="post_list">
			
		</div>
</div>