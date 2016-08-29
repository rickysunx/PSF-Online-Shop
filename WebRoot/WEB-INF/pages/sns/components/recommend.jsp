<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
$(document).ready(function(){
	var fuid = $("#callBackFuidlist").val();
	var fuids = fuid.split(",");
	for(var i=0;i<fuids.length;i++){
		if($("#tuijianFriendid_"+fuids[i]).val() == fuids[i]){
			$("#tuijianFriendid_"+fuids[i]).attr("checked",true);
		}
	}

});
</script>
<div class="layerBoxCon3">
        <input type="hidden" id="friendid" value="${friendid }" />
		<input type="hidden" id="callBackFuidlist" value="${fuids }" />
        <dl class="tab03" style="background-color:#FEFBF1;">
			<dd style="float:left;"><h4 style="margin-top:5px;">推荐<a href="#" id="tuijianFriend"><b>${username }</b></a>给你的好友、粉丝</h4></dd>
			<dt class="layerClose">
			<a class="close" href="javascript:closeSelectPorductDialog('tuijianFriendDialog');"></a>
			</dt>
		</dl>
        <div class="dialogRecomCon">
        
        		<div class="recomHeader">
              
              	<table class="center"><tr><td>
                      <h4>写两句推荐的话吧</h4>
                      <textarea id="content" class="textarea"></textarea>
                  </td></tr></table>
              
              </div>
              
              <div>
              
              	<div class="dialogTab tab03">
                  
                  	<div class="ckgroup">
                      	<input id="recomAll_${friendid }" type="checkbox" onclick="selectAll(${type},${friendid })"/><label for="recomAll">全选</label>
              
						<script type="text/javascript">
							if(flag){
							 	$("#recomAll_"+frienduid).attr("checked",true);
							} else {
								 $("#recomAll_"+frienduid).attr("checked",false);
							}
						</script>
                      </div>
                  	<ul>
                      
                      	<li id="type1"><a href="javascript:tuijian(${friendid },'${username }',1,'${ keyword}',1);">好友</a></li>
                        <li id="type2"><a href="javascript:tuijian(${friendid },'${username }',2,'${ keyword}',1);">粉丝</a></li>
                      <script type="text/javascript">
                      	$("#type"+${type}).attr("class","current");
					  </script>
                      </ul>
                  
                  </div>
                  
                  <div class="imggrouplist s_clear">
                  
                  	<ul>
					  <c:choose>
					  	<c:when test="${empty userList}">没有符合条件的好友或粉丝</c:when>
						<c:otherwise>
							<c:forEach items="${userList}" var="user">
		                      	<li>
		                          
		                          	<div class="img imgborder"><a href="#"><img src="/pic/${user.avatarFileName }" alt="" /></a><input type="checkbox" name="tuijianFriendid" id="tuijianFriendid_${user.fuid }" value="${user.fuid }" onclick="selectFriend(${user.fuid})"/></div>
		                             <p><a href="#">${user.username }</a></p>
		                          
		                         </li>
                       		</c:forEach>
						</c:otherwise>
					  </c:choose>

                      
                      </ul>
                  
                  </div>
                  
                  <div class="buttons">
                  
                  	<div class="right">
                    	<c:choose>
							<c:when test="${pageCount > 1}">
								<c:if test="${curPage == pageCount}">
									<a href="javascript:tuijian(${friendid },'${username }',${type },'${keyword }',${curPage }-1);">上一组</a>
									<a href="javascript:void(0)" style="visibility: hidden">下一组</a>
								</c:if>
								<c:if test="${curPage == 1}">
									<a href="javascript:void(0)" style="visibility: hidden">上一组</a>
									<a href="javascript:tuijian(${friendid },'${username }',${type },'${keyword }',${curPage }+1);">下一组</a>
								</c:if>
								<c:if test="${curPage>1 && curPage<pageCount}">
									<a href="javascript:tuijian(${friendid },'${username }',${type },'${keyword }',${curPage }-1);">上一组</a> <a href="javascript:tuijian(${friendid },'${username }',${type },'${keyword }',${curPage }+1);">下一组</a>
								</c:if>	
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" style="visibility: hidden">上一组</a>
								<a href="javascript:void(0)" style="visibility: hidden">下一组</a>
							</c:otherwise>
						</c:choose>	
                     </div>
                      
                      <div class="searchbox">
                      	<div class="fldlabel">
                          	<label for="search01">找人</label>
                          </div>
                          <div class="searchgroup">
                              <div class="textfield">
								  <c:choose>
								  	<c:when test="${empty keyword}"><input type="text" id="tuijiankeyword" value="用户名、备注名" onclick="javascript:this.value=''"/></c:when>
								  	<c:otherwise><input type="text" id="tuijiankeyword" value="${keyword }" onclick="javascript:this.value=''"/></c:otherwise>
								  </c:choose>
                                  
                              </div>
                          </div>
                          <input class="searchbtn" type="button" value="" onclick="search(${friendid},'${username }',${type })">
                  	</div>
                      
                  	<a class="button11" href="javascript:void(0)" onclick="saveTuijian()">确认</a>
                  
                  </div>
              
              </div>
        
        </div>
    
    </div>

                  