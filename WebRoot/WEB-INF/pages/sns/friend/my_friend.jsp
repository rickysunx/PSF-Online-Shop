<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>我的好友</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>

<script type="text/javascript">
	/*推荐 begin*/
	var ids = '';
	var flag = false;
	var frienduid= '';
	
	function opentuijianFriendDialog(uid,username){
		ids = '';
		if($("#tuijianFriendDialog").length==0) {
			$("body").append("<div id='tuijianFriendDialog' style='display:none;width:607px;'></div>");
		}
		var options = {"width": "607px", center: true, modal: true};
		var dialogId = $("#tuijianFriendDialog").psfDialog(options,function(target){
			$("#tuijianFriendDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#tuijianFriendDialog").load("/action/sns/friend/tuijian",{"friendid":uid,"username":username},function(data){
				$("#psfDialog_"+dialogId).psfCenter();
			});
		});
	}
	//关闭对话框
	function closeSelectPorductDialog(divid){
		$("#"+divid).psfDialogClose();
	}
	function tuijian(friendid,username,type,keyword,page){
		var fuids = ids;
		$("#tuijianFriendDialog").load("/action/sns/friend/tuijian",{"friendid":friendid,"username":username,"type":type,"keyword":keyword,"page":page,"fuids":fuids});
	}
	function search(friendid,username,type){
		$("#tuijianFriendDialog").load("/action/sns/friend/tuijian",{"friendid":friendid,"username":username,"type":type,"keyword":$("#tuijiankeyword").val(),"page":1});
	}
	function selectFriend(friendid){
		if($("#tuijianFriendid_"+friendid).attr("checked") == true){
			ids += $("#tuijianFriendid_"+friendid).val();
			ids += ",";
		} else {
			 var s = $("#tuijianFriendid_"+friendid).val()+",";
			 var offset = ids.indexOf(s);
			 var str1 = ids.substr(0,offset);
			 var str2 = ids.substr(offset+s.length,ids.length);
			 ids = str1+str2;

			 if( $("#recomAll_"+frienduid).attr("checked") == true ){
			 	$("#recomAll_"+frienduid).attr("checked",false);
				flag = false;
			}
		}	
	}
	function selectAll(type,friendid){
		frienduid = friendid;
		$.post(
			"/action/sns/friend/allCheck","type="+type+"&friendid="+friendid,
			function(data){
				if(data.success == 1){
					ids = ''
					for(var i=0;i<data.list.length;i++){
						ids += data.list[i];
						ids += ",";
						if( $("#recomAll_"+friendid).attr("checked") == true ){
							flag = true;
							$("#tuijianFriendid_"+data.list[i]).attr("checked",true);
						} else {
							ids = "";
							flag = false;
							$("#tuijianFriendid_"+data.list[i]).attr("checked",false);
						}	
					}
				}
			},"json"
		);

	}
	function saveTuijian(){
		var fuids = ids;
		var content = $("#content").val();
		var friendid = $("#friendid").val();
		if(fuids == ''){
			$.psfInfoDialog("选择推荐的人",2000);
		} else if(content.length == 0) {
			$.psfInfoDialog("填写推荐内容",2000);
		} else {
			$.post(
				"/action/sns/friend/save_tuijian","fuids="+fuids+"&content="+content+"&friendid="+friendid,
				function(data){
					if(data.success == 1){
						$("#tuijianFriendDialog").psfDialogClose();
						$.psfInfoDialog("推荐成功",2000);	
					} else {
						$.psfInfoDialog("推荐失败",2000);
					}
				},"json"
			);
		}
	}
	/*推荐 end*/
	/*引荐 begin*/
	var uids = '';
	var sign = false;
	var fid = '';
	
	function openIntroduceFriendDialog(uid,username){
		uids = '';
		if($("#introduceFriendDialog").length==0) {
			$("body").append("<div id='introduceFriendDialog' style='display:none;width:607px;'></div>");
		}
		var options = {"width": "607px", center: true, modal: true};
		var dialogId = $("#introduceFriendDialog").psfDialog(options,function(target){
			$("#introduceFriendDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#introduceFriendDialog").load("/action/sns/friend/introduce",{"friendid":uid,"username":username},function(data){
				$("#psfDialog_"+dialogId).psfCenter();
			});
		});
	}
	function introduce(friendid,username,type,keyword,page){
		var fuids = uids;
		$("#introduceFriendDialog").load("/action/sns/friend/introduce",{"friendid":friendid,"username":username,"type":type,"keyword":keyword,"page":page,"fuids":fuids});
	}
	function searchIntroduce(friendid,username,type){
		$("#introduceFriendDialog").load("/action/sns/friend/introduce",{"friendid":friendid,"username":username,"type":type,"keyword":$("#introducekeyword").val(),"page":1});
	}
	function selectIntroduceFriend(friendid){
		if(friendid != 0){
			if($("#introduceFriendid_"+friendid).attr("checked") == true){
				uids += $("#introduceFriendid_"+friendid).val();
				uids += ",";
			} else {
				 var s = $("#introduceFriendid_"+friendid).val()+",";
				 var offset = uids.indexOf(s);
				 var str1 = uids.substr(0,offset);
				 var str2 = uids.substr(offset+s.length,uids.length);
				 uids = str1+str2;

				 if( $("#introAll_"+fid).attr("checked") == true ){
				 	$("#introAll_"+fid).attr("checked",false);
					sign = false;
				}
			}	
		} else {

		}
	}
	function selectIntroAll(type,friendid){
		fid = friendid;
		$.post(
			"/action/sns/friend/allCheck","type="+type+"&friendid="+friendid,
			function(data){
				if(data.success == 1){
					uids = ''
					for(var i=0;i<data.list.length;i++){
						uids += data.list[i];
						uids += ",";
						if( $("#introAll_"+friendid).attr("checked") == true ){
							$("#introduceFriendid_"+data.list[i]).attr("checked",true);
							sign = true;
						} else {
							uids = "";
							sign = false;
							$("#introduceFriendid_"+data.list[i]).attr("checked",false);
						}	
					}
				}
			},"json"
		);
	}
	function saveIntroduce(){
		var fuids = uids;
		var content = $("#introcontent").val();
		var friendid = $("#introfriendid").val();
		if(fuids == ''){
			$.psfInfoDialog("选择推荐的人",2000);
		} else if(content.length == 0) {
			$.psfInfoDialog("填写推荐内容",2000);
		} else {
			$.post(
				"/action/sns/friend/save_introduce","fuids="+fuids+"&content="+content+"&friendid="+friendid,
				function(data){
					if(data.success == 1){
						$("#introduceFriendDialog").psfDialogClose();
						$.psfInfoDialog("推荐成功",2000);	
					} else {
						$.psfInfoDialog("推荐失败",2000);
					}
				},"json"
			);
		}
	}
	/*引荐 end*/
	
	
	/*搜索好友
	
	var searchUid = "";
	function openSearchFriendDialog(type){
		searchUid = "";
		if($("#searchFriendDialog").length==0) {
			$("body").append("<div id='searchFriendDialog' style='display:none;width:432px;'></div>");
		}
		var options = {"width": "607px", center: true, modal: true};
		var dialogId = $("#searchFriendDialog").psfDialog(options,function(target){
			$("#searchFriendDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#searchFriendDialog").load("/action/sns/friend/search_friend",{"type":type},function(data){
				$("#psfDialog_"+dialogId).psfCenter();
			});
		});
	}
	function closeSelectPorductDialog(divid){
		$("#"+divid).psfDialogClose();
	}
	function searchFriend(type,keyword,page){
		$("#searchFriendDialog").load("/action/sns/friend/search_friend",{"type":type,"keyword":keyword,"page":page,"searchUid":searchUid});
	}
	function searchFriendByKeyword(type){
		var keyword = $("#search01").val();
		if(keyword.length == 0 || keyword == ''){
			$.psfInfoDialog("请输入搜索信息");	
		} else {
			$("#searchFriendDialog").load("/action/sns/friend/search_friend",{"type":type,"keyword":keyword});
		} 
	}
	
	function selectSearchUser(uid,type){
		var num = 0;
		if( $("#searchUser_"+uid).attr("checked") == true){
			searchUid += uid;
			searchUid += ",";
			$("input[name='searchUser']").each(function(){
				 if($(this).attr("checked") == true){
					 num ++;
				 }
			});
			if(num == $("#pageSizeNum_"+type).val()){					//当前每页显示个数
				$("#recomAllSearch_"+type).attr("checked",true);
			}	
		} else {
			 var s = uid + ",";
			 var offset = searchUid.indexOf(s);
			 var str1 = searchUid.substr(0,offset);
			 var str2 = searchUid.substr(offset+s.length,searchUid.length);
			 searchUid = str1+str2;
			 if( $("#recomAllSearch_"+type).attr("checked") == true){
				 $("#recomAllSearch_"+type).attr("checked",false);
			 }
		}
	}
	function followSearchUser(){
		if(searchUid.length == 0){
			$.psfInfoDialog("请选择要关注的人");	
		}else {
			var ids = searchUid.split(",");
			for(var i=0;i<ids.length;i++){
				if(ids[i] != null && ids[i].length > 0){
					addFollow(ids[i],addFollowHandle4);
				}				
			}
			$("#searchFriendDialog").psfDialogClose();
		}	
	}
	function selectAllToSearch(type){
		if( $("#recomAllSearch_"+type).attr("checked") == true){
			$("input[name='searchUser']").attr("checked",true);
			$("input[name='searchUser']").each(function(){
				 if($(this).attr("checked") == true){
					 searchUid += $(this).val();
					 searchUid += ",";
				 }
			});
		} else {
			$("input[name='searchUser']").attr("checked",false);
			$("input[name='searchUser']").each(function(){
				 if($(this).attr("checked") == false){
					 var s = $(this).val() + ",";
					 var offset = searchUid.indexOf(s);
					 var str1 = searchUid.substr(0,offset);
					 var str2 = searchUid.substr(offset+s.length,searchUid.length);
					 searchUid = str1+str2;
				 }
			});
		}
	}
	*/
</script>
</head>

<body>

<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="friend"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
        <psf:include page="/sns/friend/friend_tab.jsp"/>
        <psf:include page="/sns/friend/my_friend_tab.jsp"/>   

        <div class="infolist" id="myFriend"></div>
	</div>
	
	<div id="sns_right">
		
		<psf:include page="/sns/friend/friend_right.jsp"/>
		
	</div>
	
</div>
<psf:tail/>
	<!--<psf:include page="/sns/components/recommend.jsp"/>  -->	
		<div id="tuijianDialog"></div>
	<!-- <psf:include page="/sns/components/search_friend.jsp"/>-->
</div>
</body>
</html>