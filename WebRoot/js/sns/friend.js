$(document).ready(function(){
	loadFriendList(-1,'',1);
	loadFansList(null,1);
	loadFollowList(-1,null,1);
	loadPsfFriendList(0,1);
	loadPsfFriendInvite();
});

function loadFriendList(otype,keyword,page) {
	$("a[name='myfriend']").removeClass("current");
	$("#group_"+otype).addClass("current");
	$("#myFriend").load("/action/sns/friend/get_my_friend_items",{"otype":otype,"keyword":keyword,"page":page});
}

function loadFansList(keyword,page) {
	$("#myFans").load("/action/sns/friend/get_my_fans_items",{"keyword":keyword,"page":page});
}


function loadFollowList(otype,keyword,page) {
	$("a[name='follow']").removeClass("current");
	$("#followgroup_"+otype).addClass("current");
	$("#myFollow").load("/action/sns/friend/get_my_follow_items",{"otype":otype,"keyword":keyword,"page":page});
}

function loadPsfFriendList(type,page) {
	$("a[name='psffriend']").removeClass("current");
	$("#psf_friend_"+type).addClass("current");
	$("#psffriend").load("/action/sns/friend/get_psffriend_items",{"type":type,"page":page});
}

function loadPsfFriendInvite(){
	$("#psf_friend_invite").load("/action/sns/friend/get_psffriend_invite");
}

function loadFriendByTypeList(type,page,tab){
	if(tab == 1){
		$("#myFriend").load("/action/sns/friend/get_friendbytype_items",{"type":type,"page":page});
	} else if(tab == 2){
		$("#myFollow").load("/action/sns/friend/get_followbytype_items",{"type":type,"page":page});
	} else if(tab == 3){
		$("#myFans").load("/action/sns/friend/get_fansbytype_items",{"type":type,"page":page});
	}	
}

function findByKeyword(type) {
	if(type == 1) {
		var otype = $("#friendgroup_otype").val();
		$("#myFriend").load("/action/sns/friend/get_my_friend_items",{"otype":otype,"keyword":$("#friend_keyword").val(),"page":1});	
	} else if(type == 2) {
		var otype = $("#followgroup_otype").val();
		$("#myFollow").load("/action/sns/friend/get_my_follow_items",{"otype":otype,"keyword":$("#follow_keyword").val(),"page":1});
	} else if(type == 3) {
		$("#myFans").load("/action/sns/friend/get_my_fans_items",{"keyword":$("#fans_keyword").val(),"page":1});
	}
}
function followAll(){
	$.post(
		"/action/sns/friend/follow_all",
		function(data) {
			if(data.success==1) {
				if(data.flag){
					$.psfInfoDialog("关注成功",2000);
					$("a[name='addfollow']").attr("class","okbtn");
				} else {
					$.psfInfoDialog("已全部关注",2000);
				}
			} else {
				$.psfInfoDialog("关注失败："+data.info,2000);
			}
		},"json"
	);
}
function delFriend(friendid){
	if(confirm('确认删除好友')){
		var param = "friendid="+friendid;
		$.post(
			"/action/sns/friend/del",
			param,
			function(result){
				if(result.success){
					$("#my_friend_"+friendid).remove();
					$.psfInfoDialog("成功删除好友");
				}else{
					$.psfInfoDialog("删除失败"+result.info, 2000);
				}
			},
			"json"
		);
	}
}

function delFans(uid) {
	if(confirm('确认删除粉丝')){
		var param = "uid="+uid;
		$.post(
			"/action/sns/follow/fans_del",
			param,
			function(result){
				if(result.success){
					$("#fans_"+uid).remove();
					$.psfInfoDialog("成功删除粉丝");
				}else{
					$.psfInfoDialog("删除失败"+result.info, 2000);
				}
			},
			"json"
		);
	}
}

function copyURL(divid){
	if(divid == undefined || divid == null){
		divid = "psffriend_invite";
	}
	var text = $("#"+divid).val();
	if(window.clipboardData) {		//ie   
		window.clipboardData.clearData();   
		window.clipboardData.setData("Text", text);
	} else if(navigator.userAgent.indexOf("Opera") != -1) {   	
		window.location = text;   
	} else if (window.netscape) {   //firefox
		try {   
			netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");   
		} catch (e) {   
			//alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");  
			alert("复制失败！请手动按住Ctrl+C进行复制。");
		}   
		var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);   
		if (!clip)   
		    return;   
		var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);   
		if (!trans)   
		     return;   
		trans.addDataFlavor('text/unicode');   
		var str = new Object();   
		var len = new Object();   
		var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);   
		var copytext = text;   
		str.data = copytext;   
		trans.setTransferData("text/unicode",str,copytext.length*2);   
		var clipid = Components.interfaces.nsIClipboard;   
		if (!clip)   
			return false;   
		clip.setData(trans,null,clipid.kGlobalClipboard);   
		    alert("复制成功！")   
	} else {
		document.execCommand('copy',false,text);
	}
}
function delFriendGroup(friendgroupid){
	if(confirm('确认删除分组?组内成员不会被删除，会被添加到未分组')){
		$.post(
			"/action/sns/friend/group_del",
			"friendgroupid="+friendgroupid,
			function(result){
				if(result.success){
				//	$("dl[psftype='myFriendTabItem_"+friendgroupid+"']").remove();
				//	$("#groupline_"+friendgroupid).remove();
					$.psfInfoDialog("成功删除",2000);
					window.location.reload();
				}else{
					$.psfInfoDialog("删除失败："+result.info, 2000);
				}
			},
			"json"
		);
	}
}

function delFollowGroup(followgroupid) {
	if(confirm('确认删除分组?组内成员不会被删除，会被添加到未分组')){
		$.post(
			"/action/sns/follow/follow_group_del",
			"followgroupid="+followgroupid,
			function(result){
				if(result.success){
					$.psfInfoDialog("成功删除",2000);
					window.location.reload();
				}else{
					$.psfInfoDialog("删除失败："+result.info, 2000);
				}
			},
			"json"
		);
	}
}

//创建好友分组
function initAddFriendGroupDialog() {
	if($("#addFriendGroupDialog").length==0) {
		$("body").append("<div id='addFriendGroupDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'	<a class="close" href="javascript:void(0)"></a>'+
			'	<h5>创建分组</h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:200px">' +
			'	<form id="addFriendGroupForm">' + "分组名:"+
			"	<input name='friendgroupname' id='friendgroupname' type='text'/>"+
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:saveFriendGroup(\'addFriendGroup\');">确定</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#addFriendGroupDialog").find(".close").click(function(){
		$("#addFriendGroupDialog").psfDialogClose();
	});
}
//修改分组名
function initUpdateFriendGroupName() {
	if($("#updateFriendGroupNameDialog").length==0) {
		$("body").append("<div id='updateFriendGroupNameDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'	<a class="close" href="javascript:void(0)"></a>'+
			'	<h5>修改分组名</h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:200px">' +
			'	<form id="updateFriendGroupNameForm">' + "分组名:"+
			"	<input name='newfriendgroupname' id='newfriendgroupname' type='text' value='' />"+
			"   <input type='hidden' name='friendgroupid' id='friendgroupid' value='' />"+
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:updateFriendGroupName(\'updateFriendGroupName\');">确定</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#updateFriendGroupNameDialog").find(".close").click(function(){
		$("#updateFriendGroupNameDialog").psfDialogClose();
	});
}
function initAddFollowGroupDialog() {
	if($("#addFollowGroupDialog").length==0) {
		$("body").append("<div id='addFollowGroupDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'	<a class="close" href="javascript:void(0)"></a>'+
			'	<h5>创建分组</h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:200px">' +
			'	<form id="addFollowGroupForm">' + "分组名:"+
			"	<input name='followgroupname' id='followgroupname' type='text'/>"+
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:saveFollowGroup(\'addFollowGroup\');">确定</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#addFollowGroupDialog").find(".close").click(function(){
		$("#addFollowGroupDialog").psfDialogClose();
	});
}
function initUpdateFollowGroupName() {
	if($("#updateFollowGroupNameDialog").length==0) {
		$("body").append("<div id='updateFollowGroupNameDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'	<a class="close" href="javascript:void(0)"></a>'+
			'	<h5>修改分组名</h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:200px">' +
			'	<form id="updateFollowGroupNameForm">' + "分组名:"+
			"	<input name='newfollowgroupname' id='newfollowgroupname' type='text' value='' />"+
			"   <input type='hidden' name='followgroupid' id='followgroupid' value='' />"+
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:updateFollowGroupName(\'updateFollowGroupName\');">确定</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#updateFollowGroupNameDialog").find(".close").click(function(){
		$("#updateFollowGroupNameDialog").psfDialogClose();
	});
}
//打开创建分组对话框
function openAddFriendGroupDialog() {
	var dialogId = $("#addFriendGroupDialog").psfDialog({"modal":true,"center":true});
}
function openAddFollowGroupDialog() {
	var dialogId = $("#addFollowGroupDialog").psfDialog({"modal":true,"center":true});
}
//打开修改分组名对话框
function openUpdateFriendGroupNameDialog(friendgroupid){
	$("#newfriendgroupname").attr("value",$("#fg_"+friendgroupid).text());
	$("#friendgroupid").attr("value",friendgroupid);
	var dialogId = $("#updateFriendGroupNameDialog").psfDialog({"modal":true,"center":true});
}
function openUpdateFollowGroupNameDialog(followgroupid) {
	$("#newfollowgroupname").attr("value",$("#followgroup_"+followgroupid).text());
	$("#followgroupid").attr("value",followgroupid);
	var dialogId = $("#updateFollowGroupNameDialog").psfDialog({"modal":true,"center":true});
}

function saveFollowGroup(formid){
	$.post(
		"/action/sns/follow/follow_group_add",
		$("#" + formid + "Form").serialize(),
		function(data) {
			if(data.success) {
				$("#" + formid + "Dialog").psfDialogClose();
				$.psfInfoDialog("创建成功");
				window.location.reload();
			} else {
				$.psfInfoDialog("创建失败："+data.info,2000);
			}
		},"json"
	);
}
function changeGroup(friendid,friendgroupid,friendgroupname){
	var groupname = $("b[id='friendGroup_"+friendid+"']").text();
	if($("#friendGroup_"+friendgroupid).is(":checked")){
		if(groupname.length < 7){
			var str = "";
			if(groupname == "未分组"){
				str = friendgroupname;
			} else {
				str = groupname+" "+friendgroupname;
			}
			if(str.length > 7){
				$("b[id='friendGroup_"+friendid+"']").text(str.substr(0,8)+"..");
			} else {
				$("b[id='friendGroup_"+friendid+"']").text(str);
			}
		}
	} else {
		if($("input[name='friendgroupid']").is(":checked")){
			var str = groupname.replace(friendgroupname,"");
			$("b[id='friendGroup_"+friendid+"']").text(str);
		} else {
			$("b[id='friendGroup_"+friendid+"']").text("未分组");
		}
	}
}

function changeFollowGroup(followuid,followgroupid,followgroupname){
	var groupname = $("b[id='followGroup_"+followuid+"']").text();
	if($("#followGroup_"+followgroupid).is(":checked")){
		if(groupname.length < 7){
			var str = "";
			if(groupname == "未分组"){
				str = followgroupname;
			} else {
				str = groupname+" "+followgroupname;
			}
			if(str.length > 7){
				$("b[id='followGroup_"+followuid+"']").text(str.substr(0,8)+"..");
			} else {
				$("b[id='followGroup_"+followuid+"']").text(str);
			}
		}
	} else {
		if($("input[name='followgroupid']").is(":checked")){
			var str = groupname.replace(followgroupname,"");
			$("b[id='followGroup_"+followuid+"']").text(str);
		} else {
			$("b[id='followGroup_"+followuid+"']").text("未分组");
		}
	}
}
//更新分组名
function updateFriendGroupName(formid){
	var fgid = $("#friendgroupid").val();
	var fgname =  $("#newfriendgroupname").val();
	$.post(
			"/action/sns/friend/group_update",
			$("#updateFriendGroupNameForm").serialize(),
			function(data) {
				if(data.success) {
			//		$("#" + formid + "Dialog").psfDialogClose();
			//		$("#gname_"+fgid).text(fgname);
					$.psfInfoDialog("修改成功");
					window.location.reload();
				} else {
					$.psfInfoDialog("修改失败："+data.info,2000);
				}
			},"json"
		);
}

function updateFollowGroupName(formid){
	var fgid = $("#followgroupid").val();
	var fgname =  $("#newfollowgroupname").val();
	$.post(
			"/action/sns/follow/follow_group_update",
			$("#updateFollowGroupNameForm").serialize(),
			function(data) {
				if(data.success) {
					$.psfInfoDialog("修改成功");
					window.location.reload();
				} else {
					$.psfInfoDialog("修改失败："+data.info,2000);
				}
			},"json"
		);
}


function showMore(friendid){
	var newpost = $("#newpost_"+friendid).val();
	var subnewpost = $("#subnewpost_"+friendid).val()+"...[查看更多]";
	if($("#showMore_"+friendid).attr("class") == "extMsgbox"){
		$("#showMore_"+friendid).attr("class","extMsgbox extMsgbox_on");
		$("a[psftype='showMore_"+friendid+"']").html(newpost);
	} else {
		$("#showMore_"+friendid).attr("class","extMsgbox");
		$("a[psftype='showMore_"+friendid+"']").html(subnewpost);
	}
	
}

function initFollowGroup() {
	if($("#followGroupDialog").length==0) {
		$("body").append("<div id='followGroupDialog'></div>");
	}
	$("*[psftype='followGroup']").psfHoverDialog({"contentid":"followGroupDialog"},function(target){
		var followuid = $(target).attr("friendid");
		$("#followGroupDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#followGroupDialog").load("/action/sns/follow/get_follow_group",{"followuid":followuid});
	},function(target){
		var dataChanged = $("#followGroupChangeForm").attr("dataChanged");
		if(dataChanged=="1") {
			$.post("/action/sns/follow/change_group",$("#followGroupChangeForm").serialize(),
				function(data){
					
				},"json"
			);
		}
		
	});
}


/*搜索好友*/
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