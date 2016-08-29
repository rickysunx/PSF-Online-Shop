<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
$(document).ready(function(){	
	var fuid = searchUid;
	var fuids = fuid.split(",");
	for(var i=0;i<fuids.length;i++){
		$("#searchUser_"+fuids[i]).attr("checked",true);
	}
/*

*/
});
</script>


<div class="layerBoxCon3">
		<dl class="tab03" style="background-color:#FEFBF1;">
			<dd style="float:left;"><h4><b>快速寻找您的好友，一起品，一起玩赚生活</b></h4></dd>
			<dt class="layerClose">
			<a class="close" href="javascript:closeSelectPorductDialog('searchFriendDialog');"></a>
			</dt>
		</dl>
        <div class="dialogRecomCon">
              <p style="height: 38px;line-height: 38px;color:#DD450C">我们根据您的个人资料，帮您找到${count }个
			  <c:if test="${type eq 1}">同事</c:if>
			  <c:if test="${type eq 2}">同学</c:if>
			  <c:if test="${type eq 3}">同行业</c:if>
			  <c:if test="${type eq 4}">你可能喜欢的人</c:if></p>
              <div>
              
              	<div class="dialogTab tab02" style="height:38px;padding-bottom: 10px;background:none;border-bottom:1px #A69E80 solid;">
                  
                  	<div class="ckgroup">
                        <input type="hidden" id="pageSizeNum_${type}" value="${num }"/>
                      	<input id="recomAllSearch_${type }" name="recomAllSearch" type="checkbox" onclick="selectAllToSearch(${type})"/><label for="recomAll">全选</label>
					<script type="text/javascript">
						var type = ${type};
						var num = 0;
						if(type != "undefined"){
							$("input[name='searchUser']").each(function(){
								 if($(this).attr("checked") == true){
									 num ++;
								 }
							});
							if(num == ${num}){					//当前每页显示个数
								$("#recomAllSearch_"+type).attr("checked",true);
							}				
						}
					
					</script>                      



                    </div>
                  	 <div class="searchbox" style="width:256px;">
                          <div class="searchgroup" style="width:213px;">
                              <div class="textfield">
								  <c:if test="${type eq 1}">
										<c:choose>
											<c:when test="${empty keyword}"><input id="search01" value="输入你想查找的公司名" style="width:207px;" onclick="this.value=''"/></c:when>
											<c:otherwise><input id="search01" value="${keyword }" style="width:207px;" onclick="this.value=''"/></c:otherwise>									
										</c:choose>
								  </c:if>
     							  <c:if test="${type eq 2}">
										<c:choose>
											<c:when test="${empty keyword}"><input id="search01" value="输入你想查找的学校名" style="width:207px;" onclick="this.value=''"/></c:when>
											<c:otherwise><input id="search01" value="${keyword }" style="width:207px;" onclick="this.value=''"/></c:otherwise>									
										</c:choose>
								 </c:if>
								  <c:if test="${type eq 3}">
									<c:choose>
										<c:when test="${empty keyword}"><input id="search01" value="输入你想查找的行业名" style="width:207px;" onclick="this.value=''"/></c:when>
										<c:otherwise><input id="search01" value="${keyword }" style="width:207px;" onclick="this.value=''"/></c:otherwise>									
									</c:choose>
								 </c:if>
								  <c:if test="${type eq 4}">
								     <c:choose>
										<c:when test="${empty keyword}"><input id="search01" value="输入你想查找的用户名" style="width:207px;" onclick="this.value=''"/></c:when>
										<c:otherwise><input id="search01" value="${keyword }" style="width:207px;" onclick="this.value=''"/></c:otherwise>									
									</c:choose>
								 </c:if>
                              </div>
                          </div>
                          <input class="searchbtn" type="button" value="" onclick="searchFriendByKeyword(${type});" >
                  	</div>
                  
                  </div>

				 <c:choose>
					<c:when test="${empty friendList}">找到更多的好友，先去完善资料吧</c:when>
                    <c:otherwise>
                  <div class="imggrouplist s_clear">
                  
                  	<ul>
					
					   <c:forEach items="${friendList}" var="friend">
                      
                      	 <li style=" padding: 4px 4px 5px;">
                          
                          	<div class="img imgborder">
								<a href="#"><img src="/pic/${friend.avatarFileName }" alt="" /></a>
								<input type="checkbox" name="searchUser" id="searchUser_${friend.uid }" value="${friend.uid }" onclick="selectSearchUser(${friend.uid},${type })"/>
	
							</div>
                              <p><a href="#">${friend.username }</a></p>
						<!--  <p><c:if test="${type eq 1}">${friend.companyname }</c:if></p>-->
						<!--  <p><c:if test="${type eq 2}">${friend.schoolname }</c:if></p>-->
						<!--  <p><c:if test="${type eq 3}">${friend.industryname }</c:if></p>-->
                          
                          </li>
						</c:forEach>

                      </ul>
                  
                  </div>
				  </c:otherwise>
                  </c:choose>
                  <div class="buttons">
                  
                  	<div class="right">
                      	 <c:choose>
							<c:when test="${pageCount > 1}">
								<c:if test="${curPage == pageCount}">
									<a href="javascript:searchFriend(${type },'${keyword }',${curPage }-1);">上一组</a>
									<a href="javascript:void(0)" style="visibility: hidden">下一组</a>
								</c:if>
								<c:if test="${curPage == 1}">
									<a href="javascript:void(0)" style="visibility: hidden">上一组</a>
									<a href="javascript:searchFriend(${type },'${keyword }',${curPage }+1);">下一组</a>
								</c:if>
								<c:if test="${curPage>1 && curPage<pageCount}">
									<a href="javascript:searchFriend(${type },'${keyword }',${curPage }-1);">上一组</a> <a href="javascript:searchFriend(${type },'${keyword }',${curPage }+1);">下一组</a>
								</c:if>	
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" style="visibility: hidden">上一组</a>
								<a href="javascript:void(0)" style="visibility: hidden">下一组</a>
							</c:otherwise>
						</c:choose>	
                      </div>
                      
                     
                      
                  	<a class="button11" href="javascript:followSearchUser();">一键关注</a>
                  
                  </div>
              
              </div>
        
        </div>
    
    </div>

                  