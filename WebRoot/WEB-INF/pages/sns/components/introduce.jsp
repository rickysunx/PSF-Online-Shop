<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
$(document).ready(function(){
	var fuid = $("#callBackIntroduceFuidlist").val();
	var fuids = fuid.split(",");
	for(var i=0;i<fuids.length;i++){
		if($("#introduceFriendid_"+fuids[i]).val() == fuids[i]){
			$("#introduceFriendid_"+fuids[i]).attr("checked",true);
		}
	}
});
</script>
<div class="layerBoxCon3">
        <input type="hidden" id="introfriendid" value="${friendid }" />
		<input type="hidden" id="callBackIntroduceFuidlist" value="${fuids }" />
        <dl class="tab03" style="background-color:#FEFBF1;">
			<dd style="float:left;"><h4 style="margin-top:5px;">为<a href="#" id="tuijianFriend"><b>${username }</b></a>引荐你的好友、关注</h4></dd>
			<dt class="layerClose">
			<a class="close" href="javascript:closeSelectPorductDialog('introduceFriendDialog');"></a>
			</dt>
		</dl>
        <div class="dialogRecomCon">
        
        		<div class="recomHeader">
              
              	<table class="center"><tr><td>
                      <h4>写两句引荐的话吧</h4>
                      <textarea id="introcontent" class="textarea"></textarea>
                  </td></tr></table>
              
              </div>
              
              <div>
              
              	<div class="dialogTab tab03">
                  
                  	<div class="ckgroup">
                      
                      	<input id="introAll_${friendid }" type="checkbox" onclick="selectIntroAll(${type},${friendid })"/><label for="recomAll">全选</label>
                      	<script type="text/javascript">
							if(sign){
							 	$("#introAll_"+fid).attr("checked",true);
							} else {
								 $("#introAll_"+fid).attr("checked",false);
							}
						</script>
                      </div>
                  	<ul>
                      
                      	<li id="type_1"><a href="javascript:introduce(${friendid },'${username }',1,'${ keyword}',1);">好友</a></li>
                        <li id="type_3"><a href="javascript:introduce(${friendid },'${username }',3,'${ keyword}',1);">关注</a></li>
                      <script type="text/javascript">
                      	$("#type_"+${type}).attr("class","current");
					  </script>
                      </ul>
                  
                  </div>
                  
                  <div class="imggrouplist s_clear">
                  
                  	<ul>
					  <c:choose>
					  	<c:when test="${empty userList}">没有符合条件的好友或关注</c:when>
						<c:otherwise>
							<c:forEach items="${userList}" var="user">
		                      	<li>
		                          
		                          	<div class="img imgborder"><a href="#"><img src="/pic/${user.avatarFileName }" alt="" /></a><input type="checkbox" name="introduceFriendid" id="introduceFriendid_${user.fuid }" value="${user.fuid }" onclick="selectIntroduceFriend(${user.fuid})"/></div>
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
									<a href="javascript:introduce(${friendid },'${username }',${type },'${keyword }',${curPage }-1);">上一组</a>
									<a href="javascript:void(0)" style="visibility: hidden">下一组</a>
								</c:if>
								<c:if test="${curPage == 1}">
									<a href="javascript:void(0)" style="visibility: hidden">上一组</a>
									<a href="javascript:introduce(${friendid },'${username }',${type },'${keyword }',${curPage }+1);">下一组</a>
								</c:if>
								<c:if test="${curPage>1 && curPage<pageCount}">
									<a href="javascript:introduce(${friendid },'${username }',${type },'${keyword }',${curPage }-1);">上一组</a> <a href="javascript:introduce(${friendid },'${username }',${type },'${keyword }',${curPage }+1);">下一组</a>
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
								  	<c:when test="${empty keyword}"><input type="text" id="introducekeyword" value="用户名、备注名" onclick="javascript:this.value=''"/></c:when>
								  	<c:otherwise><input type="text" id="introducekeyword" value="${keyword }" onclick="javascript:this.value=''"/></c:otherwise>
								  </c:choose>
                                  
                              </div>
                          </div>
                          <input class="searchbtn" type="button" value="" onclick="searchIntroduce(${friendid},'${username }',${type })">
                  	</div>
                      
                  	<a class="button11" href="javascript:void(0)" onclick="saveIntroduce()">确认</a>
                  
                  </div>
              
              </div>
        
        </div>
    
    </div>

                  