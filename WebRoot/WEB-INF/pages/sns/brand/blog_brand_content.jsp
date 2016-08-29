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
			<div class="post_item" id="post_287">
				<div class="post_left" style="padding:6px 0px 0px 10px;">
					<em class="post_postIcon icon_show"></em>
				</div>
				<div class="post_main" style="width:630px">
					<div class="post_header">
						<div class="post_title"><a target="_blank" href="/post/287">【是否】</a></div>
						<div style="display: none;" class="hor3-list" id="product_list_287">
							<div class="listbox listbox01 s_clear">
						        <ul>
						        	
						            <li>
						                <div class="img imgborder01">
						                    <a href="#"><img width="81px" height="81px" alt="" src="/pic/21.jpg"></a>
						                </div>
						                <p><a href="#">KD876</a></p>
						                <p class="price"><b>品上价</b>￥1388</p>
						            </li>
						            
						            <li>
						                <div class="img imgborder01">
						                    <a href="#"><img width="81px" height="81px" alt="" src="/pic/28.jpg"></a>
						                </div>
						                <p><a href="#">飞利浦9@9v</a></p>
						                <p class="price"><b>品上价</b>￥399</p>
						            </li>
						            
						        </ul>
			   				 </div>
			   			</div>
						<div class="post_addTime">2011-11-13 19:45</div>
					</div>
					<div class="post_content01">
						<p class="p">水电费等是否水电费等是否水电费等是否水电费等是否</p>
					</div>	
					<div class="imglist" id="imglist_287">
						<a href="javascript:void(0)" id="1032"><img alt="" src="/pic/1032-1.jpg"></a>
						<a href="javascript:void(0)" id="1031"><img alt="" src="/pic/1031-1.jpg"></a>
						<a href="javascript:void(0)" id="1030"><img alt="" src="/pic/1030-1.jpg"></a>
						<a href="javascript:void(0)" id="1033"><img alt="" src="/pic/1033-1.jpg"></a>
					</div>
				
					<div class="post_operations">
						<div class="post_actions">
			                <a href="javascript:openShareDialog(0,'','');">分享(0)</a> |
			                <a onclick="openTransmitDialog(287);" href="javascript:void(0);">转发(1)</a> |
			                <a oid="287" otype="2" psftype="comment" href="javascript:void(0);">品论(2)</a> |
			                <a id="ff_gd_2_287" psfmenuid="2">更多<em></em></a>
			            </div>
			            <div class="post_like"><a href="javascript:void(0);" oid="287" otype="2" psftype="like" liked="0">喜欢(0)</a></div>
					</div>
					<div class="commentbox" id="commentbox_2_287"></div>
					<!-- 没有粉丝则不显示 -->
					<div class="likeUserList" id="like_user_list_287">
						
					</div>
					
				</div>
			</div>
		</div>
</div>