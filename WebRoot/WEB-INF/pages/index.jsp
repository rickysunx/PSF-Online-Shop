<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上丰首页</title>
	<psf:header/>
	<link href="/css/index.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	$(document).ready(function(){
		
		//alert(10*3/2);
		 $("#allright_scroll").jscroll({
		   W:"15px"
		  ,BgUrl:"url()"
		  ,Bg:"none"
		  ,Bar:{Bd:{Out:"#a3c3d5",Hover:"#b7d5e6"}
				,Bg:{Out:"0 0 repeat-y",BgUrl:"url(/images/index/scrollbox.png)",Hover:"-45px 0 repeat-y",Focus:"-45px 0 repeat-y"}}
				,Btn:{btn:true
					  ,uBg:{Out:"0 0",Hover:"0px 0",Focus:"0px 0"}
					  ,dBg:{Out:"0 -8px",Hover:"0px -8px",Focus:"0px -8px"}}
		  ,Fn:function(){}
		 });
		 if($("#loginid").val()==""){$(".defaultid").show();}
		 if($("#loginpwd").val()==""){$(".defaultpwd").show();}
		 $(".defaultid,.defaultpwd").click(function(){
			 $(this).hide();
			 if($(this).attr("className")=="defaultid"){
				 $("#loginid").focus()
				 }
			 else{
				 $("#loginpwd").focus()}
		});
		$("#loginid").focusin(function(){$(".defaultid").hide();}).blur(function(){if($(this).val()==""){$(".defaultid").show();}});
		$("#loginpwd").focusin(function(){$(".defaultpwd").hide();}).blur(function(){if($(this).val()==""){$(".defaultpwd").show();}});
	
		$(".index_topbg .psfhome").mouseenter(function(){$(this).html('<img src="/images/index/psfhome.gif" />')}).mouseleave(function(){$(this).html('')});
		$(".index_topbg .psfmall").mouseenter(function(){$(this).html('<img src="/images/index/psfmall.gif" />')}).mouseleave(function(){$(this).html('')});
		$(".index_all .content .left .item").mouseenter(function(){$(this).addClass("current")}).mouseleave(function(){$(this).removeClass("current")})
	});
	</script>
</head>

<body id="pagebody">
	<psf:include page="/index_brand.jsp"/>
	<psf:include page="/index_header.jsp"/>
	<div class="index_banner s_clear">
		<div class="index_row index_topbg">
		<a class="psfhome" href="/sns"></a>
		<a class="psfmall" href="/mall"></a>
		</div>
	</div>
	<psf:include page="/index_login.jsp"/>
	<div class="index_row index_sign_">

	</div>
	<div class="index_row index_all s_clear">
		<div class="">
			<div class="title_img"></div>
			<div class="index_sign">
				<a href="javascript:void(0)" class="show"></a>
				<a href="javascript:void(0)" class="exp"></a>
				<a href="javascript:void(0)" class="guide"></a>
			</div>
		</div>
		<div class="content">
			<div class="left">
			<%for(int x=0;x<6;x++){%>
				<div class="item">
					<a class="imglink"><img src="/images/index/photo/indexphoto0<%=(x+1)%>.png" /></a>
					<p>新款潮牌陈冠希亲笔签名..</p>
					<div class="bottom">
						<img src="/images/index/photo/indexphotomini01.png" />
						<h5>阿甘正传里的小恶魔saree</h5>
					</div>
				</div>
			<%}%>
			<div class="left_button s_clear"><a href="javascript:void(0)" class="next" ></a><a href="javascript:void(0)" class="pre" ></a></div>
			</div>
			<div id="allright_scroll" class="right">
				<div class="jscroll-c">
				<%for(int x=0;x<30;x++){%>
					<div class="item s_clear">
						<div class="itemleft">
						
						</div>
						<div class="content">
							<div class="itemtop">
								<a><img/></a>
								<h4>铁蛋飞车</h4>
								<p class="name">阿郎的发挥</p>
								<p><span>体验:</span>阿斯顿发撒旦法的说东方旦法的说法发大厦东方</p>
							</div>
							<div class="itembottom s_clear">
								<span class="comments">最后品论:<a>欢乐的夏天</a></span>
								<span class="commentstime">今天:<a>50分钟前</a></span>
							</div>
						</div>
						<div class="itemright">
							<a class="num" href="javascript:void(0)">300</a>
							<a class="linkin" href="javascript:void(0)">指南<br/>进入>></a>
						</div>
					</div>
					<%} %>
				</div>
				<div class="jscroll-e" unselectable="on" style="-moz-user-select:none">
					<div class="jscroll-h" unselectable="on" style="-moz-user-select:none">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="index_row index_hot s_clear">
		<div class="empty"></div>
		<div class="title_img"></div>
		<div class="content">
		<%for(int x=0;x<12;x++){%>
			<a><img src="/images/index/photo/indexphotomini<%=(x+1)%>.png" /></a>
		<%}%>
		</div>
	</div>
	<div class="index_row index_empty1"></div>
	<div class="index_row index_brand">
		<a><img src="/images/index/photo/brand1.png" /></a>
		<a><img src="/images/index/photo/brand2.png" /></a>
		<a><img src="/images/index/photo/brand3.png" /></a>
	</div>
	<div class="index_row index_grouptalk s_clear">
		<div class="empty"></div>
		<div class="content s_clear">
			<div class="hotgroup">
				<div class="title_img"></div>
				<ul class="hotgroup_content s_clear">
					<li class="current s_clear">
					<div class="avatar">
						<a class="imglink"><img src="/images/index/photo/indexphotonormal02.png" /></a>
						<a class="join">我要加入</a>
					</div>
					<div class="info">
						<h5>设计时尚交流</h5>
						<p>创建者:无边的次罗</p>
						<p>成员:<span>20000</span></p>
						<p>圈子简介:提高研发英语水平研发英语</p>
					</div>
					</li>
					<%for(int x=0;x<7;x++){%>
					<li class="s_clear">
					<div class="avatar">
						<a class="imglink"><img src="/images/index/photo/indexphotonormal02.png" /></a>
						<a class="join">我要加入</a>
					</div>
					<div class="info">
						<h5>设计时尚交流</h5>
						<p>创建者:无边的次罗</p>
						<p>成员:<span>20000</span></p>
						<p>圈子简介:提高研发英语水平研发英语</p>
					</div>
					</li>
					<%}%>
					
				</ul>
				<div class="group_page">
					<div class="psf_page">
						<span class="prev_next prev disabled">
							<em></em>
							<i>上一页</i>
						</span>
						<span class="current">1</span>
						<a onclick="javascript:loadPostList(-1,-1,-1,2);" href="#index_tab">2</a>
						<a onclick="javascript:loadPostList(-1,-1,-1,3);" href="#index_tab">3</a>
						<span class="dots">…</span>
						<a onclick="javascript:loadPostList(-1,-1,-1,26);" href="#index_tab">26</a>
						<a class="prev_next next" onclick="javascript:loadPostList(-1,-1,-1,2);" href="#index_tab">
							<i>下一页</i>
							<em></em>
						</a>
					</div>
				</div>
			</div>
			<div class="talk">
				<div class="title_img"></div>
				<div class="talk_content post_list">
				<%for(int x=0;x<3;x++){ %>
					<div class="post_item">
						<div class="post_left">
							<div class="post_avatar" uid="11" psftype="card">
								<a href="javascript:void(0)"><img src="/pic/193.jpg"></a>
							</div>
							<div class="post_counts">
								<p>秀场：<span>1</span></p>
								<p>体验：<span>0</span></p>
								<p>指南：<span>1</span></p>
							</div>
						</div>
						<div class="post_main" style="width:390px;">
							<div class="post_header s_clear">
								<div class="post_displayName">
									<a class="avatar" uid="11" psftype="card" href="javascript:void(0)">x</a>
								</div>
								<em class="post_postIcon icon_blog"></em>
								<div class="post_title">
									<a target="_blank" href="/post/433"></a>
								</div>
								<div class="post_addTime" style="margin-right: 10px;">49分钟前</div>
							</div>
							<div class="post_content">
								##在首页发的话题#试试试试##在首页发的话题#试试试试##在首页发的话题#试试试试##在首页发的话题#试试试试
								<div class="imglist"></div>
							</div>
							<div class="post_operations">
								<a class="post_operations_left" href="javascript:void(0)">来自：大熊</a><a class="post_operations_right" href="javascript:void(0)"></a>
							</div>
						</div>
					</div>
					<%} %>
				</div>
				<div class="talk_page">
					<a class="pre"></a>
					<a class="next"></a>
				</div>
			</div>
		</div>
	</div>
	<div class="index_row index_brand index_brand2">
		<a><img src="/images/index/photo/brand1.png" /></a>
		<a><img src="/images/index/photo/brand2.png" /></a>
		<a><img src="/images/index/photo/brand3.png" /></a>
	</div>
	<div class="index_row index_business s_clear">
		<div class="left">
			<div class="title"><span></span><a>更多>></a></div>
			<ul class="content">
				<%for(int x=0;x<16;x++){%>
				<li></li>
				<%}%>
			</ul>
		</div>
		<div class="right">
			<div class="title"><span></span><a>更多>></a></div>
			<ul class="content">
				<%for(int x=0;x<16;x++){%>
				<li></li>
				<%}%>
			</ul>
		</div>
	</div>
	<div id="footer">
		<div class="container">

			<div class="footer_help_list">
		    
		    	<dl class="guide">
		        
		        	<dt><em></em></dt>
		            <dd>
		                <h5><a href="#">新手指南</a></h5>
		                <p><a href="#">注册新用户</a></p>
		                <p><a href="#">网站订购流程</a></p>
		                <p><a href="#">网站地图</a></p>
		            </dd>
		        
		        </dl>
		        <dl class="pay">
		        
		        	<dt><em></em></dt>
		            <dd>
		                <h5><a href="#">如何付款与退款</a></h5>
		                <p><a href="#">支付方式</a></p>
		                <p><a href="#">如何办理腿退款</a></p>
		                <p><a href="#">发票制度说明</a></p>
		            </dd>
		        
		        </dl>
		        <dl class="distribution">
		        
		        	<dt><em></em></dt>
		            <dd>
		                <h5><a href="#">配送方式</a></h5>
		                <p><a href="#">支付方式</a></p>
		                <p><a href="#">如何办理腿退款</a></p>
		                <p><a href="#">发票制度说明</a></p>
		            </dd>
		        
		        </dl>
		        <dl class="service">
		        
		        	<dt><em></em></dt>
		            <dd>
		                <h5><a href="#">售后服务</a></h5>
		                <p><a href="#">退换货政策</a></p>
		                <p><a href="#">如何办理退换货</a></p>
		            </dd>
		        
		        </dl>
		        <dl class="help">
		        
		        	<dt><em></em></dt>
		            <dd>
		                <h5><a href="#">帮助中心</a></h5>
		                <p><a href="#">常见热点问题</a></p>
		                <p><a href="#">联系我们</a></p>
		                <p><a href="#">投诉与建议</a></p>
		            </dd>
		        
		        </dl>
		    
		    </div>
		    
		    <div class="bottom">
		    
		    	<center><img src="/images/mall/kefu.png" alt="" /></center>
		    
		    </div>

		</div>
	</div>
</body>
</html>