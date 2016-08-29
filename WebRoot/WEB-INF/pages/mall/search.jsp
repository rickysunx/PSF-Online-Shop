<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="search_nav">
            <!--测试菜单,可作参考-->
            <script type="text/javascript">
                $(document).ready(function(){
                    
					$(".allsort_menu").mouseenter(function(){
						
						$(this).find('.menu_list').css({'visibility':'visible'});
						
					});
					$(".allsort_menu").mouseleave(function(){
						
						$(this).find('.menu_list').css({'visibility':'hidden'});
						
					});
					
                    var li = $(".allsort").find("li");
                    li.each(function(){
                         $(this).mouseenter(function(){
                            $(this).addClass('hover');
                        });
                         $(this).mouseleave(function(){
                            $(this).removeClass('hover');
                        });
                    });
                    
                });
            
            </script>
            <!--测试菜单,可作参考-->
        
            <div class="allsort allsort_menu">
                <h3>全部分类和品牌<em></em></h3>
                <div class="menu_list">
<ol>
<c:forEach var="cate1" items="${cateTree}">
	<li>
		<h6><span><em></em><i></i>${cate1.cat_name}</span></h6>
		<div class="subitem"><div class="subitem_body">
	        <div class="left">
	            <h5>选择分类</h5>
	            <c:forEach var="cate2" items="${cate1.children}">
	            	<dl>
	            		<dt>${cate2.cat_name}</dt>
	            		<dd>
	            		<c:forEach varStatus="cate3Status" var="cate3" items="${cate2.children}">
	            			<a href="/list?cateid=${cate3.cat_id}">${cate3.cat_name}</a> <c:if test="${!cate3Status.last}">|</c:if>
	            		</c:forEach>
	            		</dd>
	            	</dl>
	            </c:forEach>
	        </div>
	        <div class="right">
	            <h5>热销品牌</h5>
	            <p>
	            	<c:forEach var="brand" items="${cate1.brandList}">
	            		<a href="#">${brand.brand_name }</a>
	            	</c:forEach>
	            </p>
	        </div>
		</div></div>
	</li>
</c:forEach>	
</ol>                          
                   
                
                </div>
            </div>
            <div class="search searchbox">
                <div class="searchgroup">
                    <input id="search" value="秀场、圈子、活动" />
                    <div class="select">
                        <a class="nowSelect" href="#"><i>秀场</i><em></em></a>
                        <div class="selOption">
                            
                            <div><a href="#">秀场</a></div>
                            <div><a href="#">圈子</a></div>
                            <div><a href="#">指南</a></div>
                            <div><a href="#">体验</a></div>
                            <div><a href="#">活动</a></div>
                            
                        </div>
                    </div>
                </div>
                <a class="searchbtn" href="#"></a>
            </div>
            <div class="link">
            
                <span>热门关键词：</span>
                <a href="#">T血</a> |
                <a href="#">连衣裙</a> |
                <a href="#">衬衫</a> |
                <a href="#">光面文胸</a> |
                <a href="#">塑身文胸</a> |
                <a href="#">凉鞋...</a>
            
            </div>
        
        </div>