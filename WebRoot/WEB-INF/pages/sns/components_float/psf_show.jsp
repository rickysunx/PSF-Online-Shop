<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="show_popup" style="width:251px;border:0px;">

	<div class="show_card_info">
                            
        <div class="img"><a class="like" href="#"></a><a href="#"><img src="/pic/${show.cover}" alt="${show.title}" /></a></div>
        <h3><a>${show.title}</a></h3>
        <div class="infotable">
        	<div class="left">
            	<table cellpadding="0">
            		<c:forEach items="${show.products}" var="product" begin="0" end="2">
                	<tr>
                    	<th><a href="#">${product.pname}</a></th>
                        <td><span>${product.price}</span>元</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="right">
                                
                <div class="img"><a><img src="/pic/${show.avatarFileName}"></a></div>
                <p><a href="#">${show.displayName}</a></p>
            
            </div>
        </div>
    
    </div>

</div>