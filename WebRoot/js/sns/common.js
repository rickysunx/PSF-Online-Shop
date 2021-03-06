$(document).ready(function() {
	$("#myinfobutton").psfMenu( {
		pos : "below",
		width : 100,
		items : [ {
			name : "我的私信",
			handler : "window.location.href='/sns/my/msg'"
		}, {
			name : "我的邀请",
			handler : "window.location.href='/sns/my/invite'"
		}, {
			name : "查看品论",
			handler : "window.location.href='/sns/my/comment'"
		}, {
			name : "提到我的评论",
			handler : "window.location.href='/sns/my/about'"
		}, {
			name : "系统通知",
			handler : "window.location.href='/sns/my/notice'"
		}, {
			name : "我收到的引荐",
			handler : "window.location.href='/sns/friend/introducget'"
		}, {
			name : "我发出的引荐",
			handler : "window.location.href='/sns/friend/introducsend'"
		}

		]

	})
	
	//随着鼠标滚动
	
	var scrollTop;
	var wwidth = $(window).width();
	var wheight = $(window).height();
	var upbtn = $('.snsbox-upbtn');
	var sbody = $('.snsbox-scrollbody');
	
	var oheight = upbtn.height();
	var myoffsetpos = $('#html_wrap').offset();
	
	var mheight = $('#html_wrap').height();
	var mwidth = $('#html_wrap').width();
	
	var my_ = myoffsetpos.top;
	var mend = mheight + my_ - oheight;
	
	
	var offsetY = wheight;
	
	sbody.css({top:wheight});
	sbody.hide();
	
	$(window).scroll(windowScroll);
	
	$(window).resize(windowScroll);
	
	function windowScroll(){
		wwidth = $(window).width();
		wheight = $(window).height();
		offsetY = wheight - oheight - 20;
		menuYloc = offsetY;
		scrollTop = $(window).scrollTop();
		offsetTop = menuYloc + scrollTop;
		
		mheight = $('#html_wrap').height();
		my_ = myoffsetpos.top;
		mend = mheight + my_ - oheight;
		
		if(scrollTop > oheight + 20)
		{
			sbody.animate({top : offsetTop + "px" },{ duration:100 , queue:false });
			sbody.show();
		}
		else if(scrollTop < oheight + 20)
		{
			sbody.stop().animate({top :wheight + "px" },{ duration:100 , queue:false });
			sbody.hide();
		}
		if(offsetTop >= mend)
		sbody.stop().animate({top :mend + "px" },{ duration:100 , queue:false });
	}
//初始化页面高度
	//alert($("body")[0].clientHeight+"  "+window.screen.availHeight+" "+$("#html_wrap")[0].offsetHeight);
	if(window.screen.availHeight>$("body")[0].offsetHeight){
		$("#html_wrap").css("min-height",window.screen.availHeight);
		if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
		$("#html_wrap").css("height",window.screen.availHeight);
		}
		//$("#html_wrap").css("_height",window.screen.availHeight);
		//$("body").css("overflow-y","hidden");
	}
});

//add by wanghaifeng
function closeShareDialog(){
	$("#shareDialog").find(".close").click(function(){
		$("#shareDialog").psfDialogClose();
		});
}
function openShareDialog(postid,title,title_gbk) {
	$.each($("#shareDialog > ul > li > a"),function(i,n){
		var _href = $(n).attr("_href");
		if(_href) {
			var href = _href.replace("#postid#",postid);
			href = href.replace("#title#",title.replaceAll("#","%"));
			href = href.replace("#title_gbk#",title_gbk.replaceAll("#","%"));
			$(n).attr("href",href);
		}
	});
	$("#shareDialog").psfDialog({"modal":true,"center":true});
}

function isLeapYear(year) {
	return (year%400==0) || (year%100!=0 && year%4==0);
}

function getDaysByMonth(year,month) {
	var days = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	if(month==2 && isLeapYear(year)) {
		return 29;
	} else {
		return days[month-1];
	}
}

function toggleComment(cmt) {
	var opened = $(cmt).attr("commentOpened");
	if(opened==undefined) opened=0;
	var otype = $(cmt).attr("otype");
	var oid = $(cmt).attr("oid");
	var commentbox = $("#commentbox_"+otype+"_"+oid);
	if(opened==1) {
		commentbox.html("");
	} else {
		commentbox.html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		commentbox.load("/action/sns/get_comment",{"otype":otype,"oid":oid},function(){
			$(".ff_comment_button_hide").hide();
			$(".ff_comment_button_show").mouseover(function(){
				$(this).find(".ff_comment_button_hide").show();
			});
			$(".ff_comment_button_show").mouseout(function(){
				$(this).find(".ff_comment_button_hide").hide();
			});
			$(cmt).attr("commentOpened",1);
		});
	}
	$(cmt).attr("commentOpened",opened==0?1:0);
}

function toggleCommentReply(commentid,replyid,username) {
	var topic = "#comment_topic_"+commentid;
	var replyDivId = "replyCommentInputDiv_"+commentid+(replyid?"_"+replyid:"");
	var opened = $(topic).attr("opened");
	if(opened==undefined) opened = 0;
	if($("#"+replyDivId).length==0) {
		$("li[psftype='replycomment']").remove();		
		$(topic).append("<li psftype='replycomment' commentid='"+commentid+"' id='"+replyDivId+"' class='comment_item'>"+
			"<div class='comment_sub_form'>                                                                                                   "+
			"	<form id='commentSubForm_"+commentid+"' action='/action/sns/add_comment' method='post'>                         "+
			"	<input name='commentid' value='"+commentid+"' type='hidden'/>"+
			(replyid?"<input name='replyid' value='"+replyid+"' type='hidden'/>":"")+
			"	<textarea id='replysmilybutton_text' name='content'></textarea>                                                                        "+
			"	<ul>                                                                                                                   "+
			"		<li><a id='replysmilybutton' ><em></em>表情</a></li>                                                                                                   "+
			
			"		<li><input name='addToBlog' type='checkbox' value='1'/><label>同时转发到我的广播</label></li>                                                                                          "+
			"		<li class='comment_sub_form_right'><a class='comment_button' href='javascript:submitComment(\"commentSubForm_"+commentid+"\");'>发布</a></li>    "+
			"	</ul>                                                                                                                  "+
			"	</form>                                                                                                                "+
			"</div>"+
			"</li>");
		if(username) $("#"+replyDivId).find("textarea").val("@"+username);
			$("#replysmilybutton").psfSmiley({
				target:function(e,m){
				$("#replysmilybutton_text").val($("#replysmilybutton_text").val()+e);
				},
				init:function(){
				}
			});
	} else {
		$("#"+replyDivId).remove();
	}
	
	$(topic).attr("opened",opened==0?1:0);
	
}

function loadCommentList(otype,oid,page) {
	$("#ff_comment_list").parent().load(
		"/action/sns/get_comment_list",
		{"otype":"" + otype, "oid":"" + oid, "page":"" + page,"seed":""+Math.random()}
	);
}

//删除 品论
function delComment(commentid,otype,oid) {
	if(confirm('确认要删除该项吗？')){
		$.post(
			"/action/sns/del_comment",
			{ 'commentid': commentid },
			function(data) {
				if(data.success==1) {
					$("a[psftype='comment'][otype='" + otype + "'][oid='" + oid + "']").click();
					$("a[psftype='comment'][otype='" + otype + "'][oid='" + oid + "']").click();
					$.psfInfoDialog("删除成功");
				} else {
					$.psfInfoDialog("删除失败："+data.info,2000);
				}
			},"json"
		);
	}
}

//删除 post 
function delPost(postid) {
	if(confirm('确认要删除该项吗？')){
		$.post(
			"/action/sns/del_post",
			{ 'postid': postid },
			function(data) {
				if(data.success==1) {
					//loadPostList(-1,-1,-1,1);
					$("#post_"+postid).remove();
					$.psfInfoDialog("删除成功");
				} else {
					$.psfInfoDialog("删除失败："+data.info,2000);
				}
			},"json"
		);
	}
}

function submitComment(formid) {
	$.post(
		"/action/sns/add_comment",
		$("#"+formid).serialize(),
		function(data) {
			if(data.success==1) {
				if(formid == "likeCommentForm"){
					$("#likeDialog").psfDialogClose();
				}
				var opened = $("a[psftype='comment'][otype='" + data.otype + "'][oid='" + data.oid + "']").attr("commentOpened");
				if(opened==1) {
					$("a[psftype='comment'][otype='" + data.otype + "'][oid='" + data.oid + "']").click();
				}
				$("a[psftype='comment'][otype='" + data.otype + "'][oid='" + data.oid + "']").click();
				$.psfInfoDialog("评论发布成功");
			} else {
				$.psfInfoDialog("发布失败："+data.info,2000);
			}
		},"json"
	);
}

function initPsfTypes() {
	initComment();
	initCardDialog();
	initShare();
	initLike();
	initMsgDialog();
	initAskForFollow();
	initTransmit();
	initAskForFriend();
	initRemarkDialog();
	initCommentReplyDialog();
	initAddFriendGroupDialog();
	initFriendGroup();
	initFollowGroup();
	initUpdateFriendGroupName();
	initUpdateFollowGroupName();
	initAddFollowGroupDialog();
}

function initComment() {
	$("a[psftype='comment']").unbind('click');
	$("a[psftype='comment']").bind('click',function(){
		toggleComment(this);
	});
	$("*[comment='row']").hover(function(){
		$(this).find("a[comment='link']").show();
	},function(){
		$(this).find("a[comment='link']").hide();
	});
}

//分享init
function initShare() {
	if($("#shareDialog").length==0) {
		$("body").append("<div id='shareDialog' style='display:none;width:190px;'>" +
			'<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>' +
		"</div>");
	}
	
	$("*[psftype='share']").psfHoverDialog({"contentid":"shareDialog"},function(target){});
}

//求关注init
function initAskForFollow() {
	if($("#followDialog").length==0) {
		$("body").append("<div id='followDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'<a class="close" href="javascript:void(0)"></a>'+
			'<h5>邀请<span id="followDialogName"></span>关注我</h5>'+
			'</div>'+
			'<div class="ask_for_follow" style="background:#fff;width:403px">' +
			'	<form id="sendAskForFollowForm">' +
			"	<input name='touid' type='hidden' style='display:none;' value=''/>"+
			'	<div class="ask_for_follow_content">' +
			'		<h6><span>*</span> 自我介绍：</h6>' +
			'		<p><textarea name="content"></textarea></p>' +
			'	</div>' +
			'	<div class="ask_for_follow_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:sendAskForFollow();">发送</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#followDialog").find(".close").click(function(){
		$("#followDialog").psfDialogClose();
	});
}

//弹出求关注对话框
//touid 收信人id
//touname 收信人名称【备注名、昵称、登录名】
function openAskForFollowDialog(touid, touname){
	$("#followDialog").find("input[name='touid']").val(touid);
	$("#followDialog").find("#followDialogName").text(touname);
	var dialogId = $("#followDialog").psfDialog({"modal":true,"center":true});
}

//求关注
function sendAskForFollow(){
	$.post(
		"/action/sns/follow/ask_for_follow",
		$("#sendAskForFollowForm").serialize(),
		function(data) {
			if(data.success==1) {
				$("#followDialog").psfDialogClose();
				$.psfInfoDialog("求关注成功");
			} else {
				$.psfInfoDialog("求关注失败："+data.info,2000);
			}
		},"json"
	);
}

//转发init
function initTransmit() {

	if($("#transmitDialog").length==0) {
		$("body").append("<div id='transmitDialog' style='display:none'>" +
			'<div id="forwardPanel" class="forward" style="width:353px;background:#fff;">' +
			'	<div class="layerTop">' +
			'		 <a	href="javascript:void(0)" class="close"></a>' +
			'		 <div class="dialogTab">' +
			'			<ul>' +
			'				<li class="current"><a id="forward_1" href="javascript:void(0)">转发广播</a></li>' +
			'				<li><a id="forward_2" href="javascript:void(0)">转发私信</a></li>' +
			'				<li><a id="forward_3" href="javascript:void(0)">转发圈子</a></li>' +
			'			</ul>' +
			'		</div>' +
			'	</div>' +
			'   <div id="forward_form_div">' +
			'   </div>' +
			'</div>'+
		"</div>");
		/*加入表情*/
			//$("#transmitDialog").click(function(){alert($(this).position().top+"  "+$(this).position().left);});
			/*
			$("#forward_1,#forward_2,#forward_3").psfSmiley({
			target:function(e,m){
			$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
			},
			init:function(){
			}
			});*/
	}
	$("#transmitDialog").find(".close").click(function(){
		$("#transmitDialog").psfDialogClose();
	});
	$(".forward .layerTop .dialogTab ul li").psfTab($(".forward .broadcastCon,.forward .send_msg"));
}

//弹出转发对话框
//id 转发的原文id
//objtype 转发对象类型，默认为广播，1-话题
function openTransmitDialog(id, objtype){
	if(objtype == undefined || objtype == ''){
		objtype=0;
	}
	//给每个tab绑定加载函数
	$("#forwardPanel .dialogTab ul li a").click(function(){
		var index = $(this).attr("id").split("_")[1];
		//alert($(this).attr("id"));	
		loadForwardForm("forward_form_div", index, id, objtype);
	});
	
	//ajax请求数据，初始化转发框信息
	loadForwardForm("forward_form_div", 1, id, objtype);
	var dialogId = $("#transmitDialog").psfDialog({"modal":true,"center":true});
}

function loadForwardForm(divid, type, id, objtype){
	var url = "/action/sns/get_forward_form";
	$("#forwardPanel .dialogTab ul li:eq("+(type-1)+")").addClass("current").siblings().removeClass("current");
	if(type == 1){
	}else if(type == 2){
		url = "/action/sns/get_message_form";
	}else if(type == 3){
		url = "/action/sns/get_group_form";
	}
	var param = "type="+type+"&id="+id+"&objtype="+objtype;
	$("#"+divid).html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
	$("#"+divid).load(
		url,
		param
	);
}

//转发
function sendTransmit(){
	$.post(
		"/action/sns/add_blog",
		$("#sendTransmitForm").serialize(),
		function(data) {
			if(data.success==1) {
				$("#transmitDialog").psfDialogClose();
				$.psfInfoDialog("转发成功");
			} else {
				$.psfInfoDialog("转发失败："+data.info,2000);
			}
		},"json"
	);
}


//加友init
function initAskForFriend() {
	if($("#friendDialog").length==0) {
		$("body").append("<div id='friendDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'<a class="close" href="javascript:void(0)"></a>'+
			'<h5>申请<span id="friendDialogName"></span>加我为好友</h5>'+
			'</div>'+
			'<div class="ask_for_follow" style="background:#fff;width:403px">' +
			'	<form id="sendAskForFriendForm">' +
			"	<input name='touid' type='hidden' style='display:none;' value=''/>"+
			'	<div class="ask_for_follow_content">' +
			'		<h6><span>*</span> 自我介绍：</h6>' +
			'		<p><textarea name="content"></textarea></p>' +
			'	</div>' +
			'	<div class="ask_for_follow_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:sendAskForFriend();">发送</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#friendDialog").find(".close").click(function(){
		$("#friendDialog").psfDialogClose();
	});
}

//弹出加友对话框
//touid 收信人id
//touname 收信人名称【备注名、昵称、登录名】
function openAskForFriendDialog(touid, touname){
	$("#friendDialog").find("input[name='touid']").val(touid);
	$("#friendDialog").find("#friendDialogName").text(touname);
	var dialogId = $("#friendDialog").psfDialog({"modal":true,"center":true});
}

//求加友
function sendAskForFriend(){
	$.post(
		"/action/sns/friend/ask_for_friend",
		$("#sendAskForFriendForm").serialize(),
		function(data) {
			if(data.success==1) {
				$("#friendDialog").psfDialogClose();
				$.psfInfoDialog("申请发送成功<br/>等待回复...");
			} else {
				$.psfInfoDialog("申请失败："+data.info,2000);
			}
		},"json"
	);
}

/**
 * 肖慧，关注用户
 */
function addFollow(uid, callback){
	var param = "uid="+uid;
	$.post(
		"/action/sns/follow/add",
		param,
		function(result){
			if(result.success){
				$.psfInfoDialog("关注成功");
				callback(uid);
			}else{
				$.psfInfoDialog("关注失败"+result.msg, 2000);
			}
		},
		"json"
	);
}

/**
 * 处理右侧人气品友、可能喜欢的品友等
 * @param {Object} uid
 */
function addFollowHandle1(uid){
	$("*[psftype='addfollow'][uid='"+uid+"'] a").remove();
	$("*[psftype='addfollow'][uid='"+uid+"']").removeClass().addClass("btns").css("text-align","center");
	$("*[psftype='addfollow'][uid='"+uid+"']").html("<a href='javascript:delFollow("+uid+",delFollowHandle1)' class='okbtn'><em></em>已关注<a>")
	$("*[psftype='addfollow'][uid='"+uid+"']").attr("psftype", "delfollow");
}

/**
 * 处理秀场、体验、指南排行榜
 * @param {Object} uid
 */
function addFollowHandle2(uid){
	$("*[psftype='addfollow'][uid='"+uid+"'] a").remove();
	$("*[psftype='addfollow'][uid='"+uid+"']").removeClass().addClass("coins_rank_hasfollow");
	$("*[psftype='addfollow'][uid='"+uid+"']").html("<a href='javascript:delFollow("+uid+",delFollowHandle2)'>已关注</a>")
	$("*[psftype='addfollow'][uid='"+uid+"']").attr("psftype", "delfollow");
}
/**
 * 好友模块粉丝页加关注
 * @param uid
 * @return
 */
function addFollowHandle3(uid) {
	$("#fans_add_follow_"+uid).remove();
}
/**
 * 品友的好友加关注
 * @param uid
 * @return
 */
function addFollowHandle4(uid) {
	$("#psf_friend_add_follow_"+uid).attr("class","okbtn");
	$("#psf_friend_add_follow_"+uid).attr("href","javascript:delFollow("+uid+",delFollowHandle4);");
	$("#psf_friend_add_follow_"+uid).attr("id","psf_friend_del_follow_"+uid);
}
/**
 * 肖慧，取消关注
 */
function delFollow(uid, callback){
	if(confirm("确定取消关注该用户？")){
		var param = "uid="+uid;
		$.post(
			"/action/sns/follow/del",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("取消成功");
					callback(uid);
				}else{
					$.psfInfoDialog(result.msg, 2000);
				}
			},
			"json"
		);
	}
}

/**
 * 处理右侧人气品友、可能喜欢的品友等
 * @param {Object} uid
 */
function delFollowHandle1(uid){
	$("*[psftype='delfollow'][uid='"+uid+"'] a").remove();
	$("*[psftype='delfollow'][uid='"+uid+"']").removeClass().addClass("psf_friend_addfollow");
	$("*[psftype='delfollow'][uid='"+uid+"']").html("<a href='javascript:addFollow("+uid+",addFollowHandle1)'>加关注</a>");
	$("*[psftype='delfollow'][uid='"+uid+"']").attr("psftype","addfollow");
}
/**
 * 处理秀场、体验、指南排行榜
 * @param {Object} uid
 */
function delFollowHandle2(uid){
	$("*[psftype='delfollow'][uid='"+uid+"'] a").remove();
	$("*[psftype='delfollow'][uid='"+uid+"']").removeClass().addClass("coins_rank_addfollow");
	$("*[psftype='delfollow'][uid='"+uid+"']").html("<a href='javascript:addFollow("+uid+",addFollowHandle2)'>加关注</a>")
	$("*[psftype='delfollow'][uid='"+uid+"']").attr("psftype", "addfollow");
}
/**
 * 好友页删除关注
 * @param uid
 * @return
 */
function delFollowHandle3(uid) {
	$("#follow_"+uid).remove();
}
/**
 * 品友的好友页取消关注
 * @param uid
 * @return
 */
function delFollowHandle4(uid) {
	$("#psf_friend_del_follow_"+uid).attr("class","addbtn02 addbtn02_ok");
	$("#psf_friend_del_follow_"+uid).attr("href","javascript:addFollow("+uid+",addFollowHandle4);");
	$("#psf_friend_del_follow_"+uid).attr("id","psf_friend_add_follow_"+uid);
}
//加入黑名单
function addBlacklist(uid, uname){
	if(confirm('确认把' + uname + '加入黑名单吗？')){
		var param = "uid="+uid;
		$.post(
			"/action/sns/add_blacklist",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("加入黑名单成功");
				}else{
					$.psfInfoDialog("加入黑名单失败"+result.msg, 2000);
				}
			},
			"json"
		);
	}
}

//发信init
function initMsgDialog() {
	if($("#sendMsgDialog").length==0) {
		$("body").append("<div id='sendMsgDialog' style='display:none'>" +
			'<div class="layerTop">'+
			'<a class="close" href="javascript:void(0)"></a>'+
			'<h5>发信息</h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:403px">' +
			'	<form id="sendMsgToTa">' +
			"	<input name='msgtouid' type='hidden' value=''/>"+
			'	<div class="send_msg_title"><h6>发信息给：</h6><p><input type="text" name="touname" readonly /></p></div>' +
			'	<div class="send_msg_content">' +
			'		<h6>信息内容：</h6>' +
			'		<p><textarea name="content"></textarea></p>' +
			'	</div>' +
			'	<div class="send_msg_info">' +
			'    	<p>您还可以输入300个字</p>' +
			'		<a href="#"><em></em>表情</a>' +
			'	</div>' +
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:sendMsg();">发送</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#sendMsgDialog").find(".close").click(function(){
		$("#sendMsgDialog").psfDialogClose();
	});
}

//弹出发信对话框
//touid 收信人id
//touname 收信人名称【备注名、昵称、登录名】
function openSendMsgDialog(touid, touname){
	$("#sendMsgDialog").find("input[name='msgtouid']").val(touid);
	$("#sendMsgDialog").find("input[name='touname']").val('@' + touname);
	var dialogId = $("#sendMsgDialog").psfDialog({"modal":true,"center":true});
}

//发信
function sendMsg(divid){
	if(divid == undefined || divid == null){
		divid = "sendMsgToTa";
	}
	$.post(
		"/action/sns/send_msg",$("#"+divid).serialize(),
		function(data) {
			if(data.success==1) {
				if($("#transmitDialog").length > 0){
					$("#transmitDialog").psfDialogClose();
				}
				$("#sendMsgForm").psfDialogClose();
				$.psfInfoDialog("发信成功");
			} else {
				$.psfInfoDialog("发信失败："+data.info,2000);
			}
		},"json"
	);
}

function closeMsgDialog(dialogId) {
	if($("#psfDialog_"+dialogId).attr("canClose")==1) {
		$("#likeDialog").psfDialogClose();
	}
}

//修改备注
function initRemarkDialog() {
	if($("#remarkDialog").length==0) {
		$("body").append("<div id='remarkDialog' style='display:none;width:350px;'>" +
			'<div class="layerTop">'+
			'<a class="close" href="javascript:void(0)"></a>'+
			'<h5>修改备注：@<span id="remarkDialogName"></span></h5>'+
			'</div>'+
			'<div class="send_msg" style="background:#fff;width:300px">' +
			'	<form id="updateRemarkForm">' +
			"	<input name='remarkuid' type='hidden' style='display:none;' value=''/>"+
			'	<div class="send_msg_title"><h6>请填写备注：</h6><p><input type="text" name="remarkname" /></p></div>' +
			'	<div class="send_msg_buttons">' +
			'		<a class="psf_dialog_button" href="javascript:updateRemark();">修改</a>' +
			'		&nbsp;&nbsp;&nbsp;&nbsp;<a class="psf_dialog_button" href="javascript:closeRemarkDialog();">取消</a>' +
			'	</div>' +
			'	</form>' +
			'</div>' +
		"</div>");
	}
	$("#remarkDialog").find(".close").click(function(){
		closeRemarkDialog();
	});
}

//弹出修改备注对话框
//remarkuid 收信人id
//remarkname 收信人名称【备注名、昵称、登录名】
function openRemarkDialog(remarkuid, remarkname, username){
	$("#remarkDialog").find("input[name='remarkuid']").val(remarkuid);
	$("#remarkDialog").find("input[name='remarkname']").val(remarkname);
	$("#remarkDialog").find("#remarkDialogName").text(username);
	var dialogId = $("#remarkDialog").psfDialog({"modal":true,"center":true});
}

//修改备注名
function updateRemark(){
	var fuid = $("input[name='remarkuid']").val();
	var remarkname = $("input[name='remarkname']").val();
	var username = $("#remarkDialogName").text();
	$.post(
		"/action/sns/update_remark",
		$("#updateRemarkForm").serialize(),
		function(data) {
			if(data.success==1) {
				$.psfInfoDialog("修改备注成功");
//				$("*[psftype='card']").each(function(){
//					if($(this).attr("uid") == uid && $(this).text() == psfValue){
//						$(this).text(remarkname);
//					}
//				});
				$("#oname_"+fuid).text("");
				var str = "";
				if(remarkname == null || remarkname == ""){
					str += "<a href=\"javascript:openRemarkDialog("+fuid+",\'\',\'"+username+"\');\">[设置备注]</a>";
					$("#oname_"+fuid).html(str);
				} else {
					str += "("+remarkname+")<a href=\"javascript:openRemarkDialog("+fuid+",\'"+remarkname+"\',\'"+username+"\');\">[修改备注]</a>";
					$("#oname_"+fuid).html(str);
				}
				closeRemarkDialog();
			} else {
				$.psfInfoDialog("修改备注失败："+data.info,2000);
			}
		},"json"
	);
}

function closeRemarkDialog() {
	$("#remarkDialog").psfDialogClose();
}

//品论详细 Reply
function initCommentReplyDialog() {
	if($("#commentReplyDialog").length==0) {
		$("body").append("<div id='commentReplyDialog' style='display:none;width:580px;'>" +
		"</div>");
	}
	$("#commentReplyDialog").find(".close").click(function(){
		closecommentReplyDialog();
	});
}

//弹出品论详细 Reply对话框
//remarkuid 收信人id
//remarkname 收信人名称【备注名、昵称、登录名】
function openCommentReplyDialog(commentid){
	getCommentReply(commentid, 1);
	var dialogId = $("#commentReplyDialog").psfDialog({"modal":true,"center":true});
}

function getCommentReply(commentid, page){
	$("#commentReplyDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
	$("#commentReplyDialog").load("/action/sns/get_comment_reply",{"commentid":commentid, "page":page},function(){
		var dialogId = $("#commentReplyDialog").psfDialog({"modal":true,"center":true});
	});
}

function closeCommentReplyDialog() {
	$("#commentReplyDialog").psfDialogClose();
}

function initCardDialog() {
	if($("#cardDialog").length==0) {
		$("body").append("<div id='cardDialog' style='display:none;width:300px;height:160px;'></div>");
	}
	/**
	$.each($("*[psftype='card']"),function(i,n){
		$(n).psfDirectoryDialog({"contentid":"cardDialog","arrow":true,"arrowauto":false,"arrowdirection":"right","arrowpos":0},function(target){
			var uid = $(target).attr("uid");
			$("#cardDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#cardDialog").load("/action/sns/get_card",{"uid":uid});
		});
	});*/
	
	$("*[psftype='card']").psfHoverDialog({"contentid":"cardDialog","arrow":true,"arrowauto":false,"arrowdirection":"top","arrowpos":20},function(target){
		var uid = $(target).attr("uid");
		$("#cardDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#cardDialog").load("/action/sns/get_card",{"uid":uid});
	});
}

function closeLikeDialog(dialogId) {
	if($("#psfDialog_"+dialogId).attr("canClose")==1) {
		$("#likeDialog").psfDialogClose();
	}
}

function initFriendGroup() {
	if($("#friendGroupDialog").length==0) {
		$("body").append("<div id='friendGroupDialog'></div>");
	}
	$("*[psftype='friendGroup']").psfHoverDialog({"contentid":"friendGroupDialog"},function(target){
		var friendid = $(target).attr("friendid");
		$("#friendGroupDialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#friendGroupDialog").load("/action/sns/friend/get_friend_group",{"friendid":friendid});
	},function(target){
		var dataChanged = $("#friendGroupChangeForm").attr("dataChanged");
		if(dataChanged=="1") {
			$.post("/action/sns/friend/change_group",$("#friendGroupChangeForm").serialize(),
				function(data){
					
				},"json"
			);
		}
		
	});
}

function initLike() {
	
	if($("#likeDialog").length==0) {
		$("body").append("<div id='likeDialog' style='display:none;'>                                "+
			"	<form id='likeCommentForm'>                                               "+
			"	<div><textarea id='likeCommentContent' name='content'></textarea> </div>  "+
			"	<div class='likeDialogBottom'>                                            "+
			"		<em></em>                                                               "+
			"		<span>表情</span>                                                       "+
			"		<b><a href=\"javascript:submitComment('likeCommentForm');\" class='psf_dialog_button'>提交</a></b>                   "+
			"	</div>                                                                    "+
			"	<input name='otype' type='hidden' style='display:none;' value=''/>"+
			"	<input name='oid' type='hidden' style='display:none;' value=''/>"+
			"	</form>                                                                   "+
			"</div>                                                                     ");
	}
	
	
	$("#likeCommentContent").unbind();
	$("#likeCommentContent").bind("focusin",function(){
		if($(this).val()=="稀饭就留个话吧")
			$(this).val("");
	});
	$("#likeCommentContent").bind("focusout",function(){
		if($.trim($(this).val()).length==0)
			$(this).val("稀饭就留个话吧");
	});
	
	var oid = $(this).attr("oid");
	var otype = $(this).attr("otype");
	$("*[psftype='like']").unbind('click');
	$("*[psftype='like']").bind('click',function(event){
		var liked = $(this).attr("liked");
		$(this).find("a").html("<img style='top:5px;position:relative;' src='/images/loading.gif'/>");
		$.post(
			"/action/sns/update_like",
			{"oid":$(this).attr("oid"),"otype":$(this).attr("otype"),"action":liked==1?0:1},
			function(data) {
				if(data.success==1) {
					var likeDiv = "*[psftype='like'][oid='"+data.oid+"'][otype='"+data.otype+"']";
					if(data.likedByMe) {
						$(likeDiv).parent().addClass("post_liked");
						$(likeDiv).attr("liked",1);
						$(likeDiv).html("喜欢 "+data.likeCount);
						
						var top = $(likeDiv).scrollTop()+$(likeDiv).offset().top;
						var left = $(likeDiv).scrollLeft()+$(likeDiv).offset().left;
						var width = $(likeDiv).outerWidth();
						$("#likeDialog").find("textarea").val("稀饭就留个话吧");
						$("#likeDialog").find("input[name='oid']").val(data.oid);
						$("#likeDialog").find("input[name='otype']").val(data.otype);
						var dialogId = $("#likeDialog").psfDialog({"top":top,"left":left+width,"openAnimate":800});
						
						$("#psfDialog_"+dialogId).attr("canClose",1);
						$(likeDiv).hover(function(){},function(){
							setTimeout("closeLikeDialog("+dialogId+");",500);
						});
						
						$("#psfDialog_"+dialogId).hover(function() {
							$("#psfDialog_"+dialogId).attr("canClose",0);
						},function(){
							$("#psfDialog_"+dialogId).attr("canClose",1);
							setTimeout("closeLikeDialog("+dialogId+");",500);
						});
						
					} else {
						$(likeDiv).parent().removeClass("post_liked");
						$(likeDiv).attr("liked",0);
						$(likeDiv).html("喜欢 "+data.likeCount+"");
					}
					
					var fans_content = '';
					$.each(data.fans, function(i,fan){
						fans_content += "<a uid='"+fan.uid+"' psftype='card' href='#' style='padding-right:5px;'><img src='/pic/"+fan.avatarFileName+"'/></a>";
					});
					$('#like_user_list_'+data.oid).html(fans_content);
				} else {
					$.psfInfoDialog("加喜欢出错："+data.info);
				}
			},"json"
		);
	});
}

/**
 * 秀场、体验、指南排行榜
 * @param {Object} divid
 * @param {Object} typeid	1:秀场排行榜、2：体验排行榜、3：指南排行榜
 * @param {Object} page
 */
function rank(divid, page, typeid) {
	var param = "divid="+divid+"&typeid="+typeid+"&page="+page;
	$("#"+divid).load(
			"/action/sns/right/coins_rank",
			param
		);
}
/**
 * 指南、体验图片显示
 * @param {Object} width
 * @param {Object} height
 */
function initFloatPic(width,height){
	if($("#floatPic").length==0) {
		$("body").append("<div id='floatPic' style='display:none;width:"+width+"px;height:"+height+"px'></div>");
	}
	$.each($("*[psftype='pic']"),function(i,n){
		$(n).psfDirectoryDialog({"contentid":"floatPic"},function(target){
			var postid = $(target).attr("postid");
			var pics = $("#pics_"+postid).html();
			$("#floatPic").html(pics);
		});
	});
	/*
	$("*[psftype='pic']").psfDirectoryDialog({"contentid":"floatPic"},function(target){
		var postid = $(target).attr("postid");
		var pics = $("#pics_"+postid).html();
		$("#floatPic").html(pics);
	});*/
}

/**
 * 品牌LOGO
 * @param {Object} width
 * @param {Object} height
 */
function initBrandPic(width, height){
	if($("#brandPic").length==0){
		$("body").append("<div id='brandPic' style='display:none;width:"+width+"px;height:"+height+"px'></div>");
	}
	$.each($("*[psftype='brand_pic']"),function(i,n){
		$(n).psfDirectoryDialog({"contentid":"brandPic"},function(target){
			var postid = $(target).attr("postid");
			var brand_pics = $("#brand_list_"+postid).html();
			$("#brandPic").html(brand_pics);
		});
	});
	/*
	$("*[psftype='brand_pic']").psfDirectoryDialog({"contentid":"brandPic"},function(target){
		var postid = $(target).attr("postid");
		var brand_pics = $("#brand_list_"+postid).html();
		$("#brandPic").html(brand_pics);
	});*/
}

/**
 * 文本框初始化
 * @param {Object} divid 待初始化对象ID
 * @param {Object} msg 初始化文本
 * @memberOf {TypeName} 
 */
function initInput(divid, msg){
	$("#"+divid).val(msg);
	$("#"+divid).focus(function() {
		var val = $(this).val();
		if(val == msg){
			$(this).val("");
		}
	});
	$("#"+divid).blur(function() {
		var msg1 = $(this).val();
		if(msg1 == undefined || $.trim(msg1) == ''){
			$(this).val(msg);
		}
	});
}
/**
 * 单个秀场展开对象
 * @param {Object} id 图片id(图片名称的前缀)
 * @param {Object} list 相关秀场图片列表
 * 例
 * new showobject("photo71",[
	{imgurl:"/images/sns/photo/photo81.png",
	title:"羊毛大衣",	//商品名
	imghref:"#",		//图片以及商品名的链接地址
	price:"679.00",		//原价价
	psfprice:"127",		//品上价
	buyhref:"#"}		//购买地址
	])
 */
function showobject(id,list,suf){
	//<img src='/pic/"+this.id+(suf || "")+".png' style='width:100%' />
	this.id=id;
	this.list=list;
	this.listhtml="";
	var obj=this;
	this.htmlText=function(){
		return "<div class='post_imgviewer'><div class='imgview'>"+
				"<a id='"+this.id+"hash' class='imglink' href='javascript:void(0)' style='display:block;'>"+"<img src='/pic/"+this.id+(suf || "")+".png' />"+"</a>"+
				/*	"<div class='viewerbar'></div>"+*/
				"<div id='"+this.id+"hashcontrol' class='control'><a class='prev' href='javascript:void(0)'><em></em>向左转</a>"+
				" | "+
				"<a class='next' href='javascript:void(0)'><em></em>向右转</a></div>"+	
				"</div></div>"
	}
	this.addtoStatic=function(){	
		allshow[id]=this;
		return this;
	}
	this.loadData=function(){
	$.each(this.list,function(i,n){
		obj.listhtml="<li>"+
		"<div class='img'><a href='#'><img src='"+n["imgurl"]+"' /></a></div>"+
		"<p><a href='"+n["imghref"]+"'>"+n["title"]+"</a></p>"+
		"<p class='price'>市场价<span>"+n["price"]+"</span></p>"+
		"<p>品上价:<b>"+n["psfprice"]+"</b></p>"+
		"<div class='bottom'><em></em><a href='"+n["buyhref"]+"'>去购买</a></div>"+
		"</li>"+obj.listhtml;
		
	})
	//alert(obj.listhtml);
	if(obj.listhtml!=""){
		obj.listhtml="<div class='post_imglist' style='bottom:-206px;' ><ul>"+obj.listhtml+"</ul></div>";
		}
		return this;
	};
	this.init=function(){
		//alert("xx");
		$("#"+this.id).click(function(){
			$.each($(this).siblings("a").andSelf(),function(i,n){
				
				$(this).parent().before(allshow[n.id].htmlText());
				$("#"+n.id+"hash img")[0].onload=function(){
					//alert($("#"+n.id+"hash img")[0].offsetHeight);
					if(allshow[n.id].listhtml!="" && $("#"+n.id+"hash img")[0].offsetHeight>200){
						$("#"+n.id+"hash").parent().after(allshow[n.id].listhtml)
						$("#"+n.id+"hash").parent().parent().find(".post_imglist").css("bottom",-206);	
						$("#"+n.id+"hash").parent().parent().mouseenter(function(){
						$("#"+n.id+"hash").parent().parent().find(".post_imglist").stop(true).animate( {bottom:0}, 200 )
						}).mouseleave(function(){
						$("#"+n.id+"hash").parent().parent().find(".post_imglist").stop(true).animate( {bottom:-206}, 200 )
						});
					}
					//图片转动
					var rotate = new Rotate($("#"+n.id+"hash img")[0]);
					//$("#leftbutton").click(function(){rotate.runLeft();});
					//$("#rightbutton").click(function(){rotate.runRight();});
					$("#"+n.id+"hash").siblings(".control").find(".prev").click(function(){
					rotate.runLeft();
					});
					$("#"+n.id+"hash").siblings(".control").find(".next").click(function(){
					rotate.runRight();
					});
					
				};
				
				//图片旋转结束
				
				
				
				$("#"+n.id+"hash").parent().parent().find(".imgview .control").css("top",-43);
				$("#"+n.id+"hash").parent().parent().mouseenter(function(){
					$("#"+n.id+"hash").parent().parent().find(".imgview .control").stop(true).animate( {top:14}, 200 ).mouseenter(function(){
					$("#"+n.id+"hash").parent().parent().find(".post_imglist").stop(true).animate( {bottom:-206}, 200 )}).mouseleave(function(){
					$("#"+n.id+"hash").parent().parent().find(".post_imglist").stop(true).animate( {bottom:0}, 200 )
					});
				}).mouseleave(function(){
					$("#"+n.id+"hash").parent().parent().find(".imgview .control").unbind("mouseenter").unbind("mouseleave").stop(true).animate( {top:-43}, 200 )
				});
			})
			var imglist=$(this).parent().hide();
			$(this).parent().parent().find(".post_imgviewer .imgview .imglink").click(function(){
				$(this).parents(".post_imgviewer").siblings(".post_imgviewer").andSelf().remove();
				imglist.show();
				window.location.hash ="post_"+(imglist.attr("id").split("_"))[1];
			});
			window.location.hash = $(this).attr("id")+"hashcontrol";
		});
	};

this.addtoStatic().loadData().init();	
}

/**
 * 
 * @param {Object} id
 * @param {Object} groups
 *      id
 *      name
 * 
 */
function GroupTab(id,groups,showeditmenu) {
	this._id = id;
	this._groups = groups;
	this._showeditmenu=showeditmenu;
	this._selected = "all";
	this._menus = new Array();
	this._reloadTab();
}

GroupTab.prototype._onGroupTabItemClick = function(selectid) {
	this._selected = selectid;
	this._reloadTab();
	onGroupTabChanged(selectid);
};

GroupTab.prototype._reloadTab = function() {
	var i;
	//释放原有菜单
	if(this._menus) {
		for(i=0;i<this._menus.length;i++) {
			var menuid = this._menus[i];
			$("#psfmenu_"+menuid).remove();
		}
		this._menus = new Array();
	}
	
	var s = "";
	s+="<dl><dt><a id='fg_all' psftype='fgTabItem' href='javascript:loadFriendList(-1,\"\",1);'><span><span>全部</span></span></a></dt></dl>";
	s+="<dl><dt>|</dt></dl>";
	s+="<dl><dt><a id='fg_none' psftype='fgTabItem' href='javascript:loadFriendList(0,\"\",1);'><span><span>未分组</span></span></a></dt></dl>";
	s+="<dl><dt>|</dt></dl>";
	
	
	
	var tabCount = 3;
	
	var newGroups = new Array();
	for(i=0;i<this._groups.length;i++) {
		newGroups.push(this._groups[i]);
	}
	
	
	var selectedByBefore = (this._selected=='all'||this._selected=='none');
	if(!selectedByBefore) {
		for(i=0;i<tabCount;i++) {
			var fg = this._groups[i];
			if(this._selected==fg.id) {
				selectedByBefore = true;
				break;
			}
		}
	}
	
	if(!selectedByBefore) {
		for(i=tabCount;i<this._groups.length;i++) {
			var fg = this._groups[i];
			if(this._selected==fg.id) {
				var temp = newGroups[tabCount-1];
				newGroups[tabCount-1] = newGroups[i];
				newGroups[i] = temp;
				break;
			}
		}
	}
	
	for(i=0;i<newGroups.length;i++) {
		if(i>=tabCount) break;
		var fg = newGroups[i];
		s+="<dl id='dl_fg_"+fg.id+"' psftype='groupTabItem'><dt><a psftype='fgTabItem' id='fg_"+fg.id+"' href='javascript:void(0);'><span><span>"+fg.name+"</span></span></a></dt></dl>";
		s+="<dl><dt>|</dt></dl>";
	}
	
	s+="<dl id='dl_fg_more' class='dropmenu'><dt><a class='morebtn'><i>更多</i><span></span></a></dt></dl>";
	
	$("#"+this._id).html(s);
	
	if(this._showeditmenu){
		for(i=0;i<newGroups.length;i++) {
			if(i>=tabCount) break;
			var fg = newGroups[i];
			this._menus.push($("#dl_fg_"+fg.id).psfIconMenu({pos:'below',items:[
				{'name':'删除该分组','handler':"onDelGroup("+fg.id+")",'icon':"icon_del"},
				{'name':'修改分组名称','handler':"onUpdateGroupName("+fg.id+")","icon":"icon_mod"}
			]}));
		}
		
		var moreMenuItems = new Array();
		for(i = tabCount;i<newGroups.length;i++) {
			var fg = newGroups[i];
			moreMenuItems.push({'name':"<div psftype='fgTabItem' id='fg_"+fg.id+"'>"+fg.name+"</div>",'handler':'void(0)'});
		}
		moreMenuItems.push({'type':'line'});
		moreMenuItems.push({'name':'创建分组','handler':'onAddGroup()','icon':'icon_add'});
		moreMenuItems.push({'name':'调整分组顺序','handler':'onChangeOrder();','icon':'icon_ad'});
		var moreMenuId = $("#dl_fg_more").psfIconMenu({pos:'below',items:moreMenuItems});
		this._menus.push(moreMenuId);
	}
	var _this = this;
	
	$("*[psftype='fgTabItem']").click(function(){
		var id = $(this).attr("id");
		var fgid = id.split("_")[1];
		_this._onGroupTabItemClick(fgid);
	});
	
	$("#fg_"+this._selected).addClass("current");
	
};


/**
 * 视频发布相关
 */


/**
 * 图片旋转类
 * */
function Rotate(img){
	this.init(img);
}
Rotate.prototype = {
	constructor : Rotate,
	init : function(img){
		this.img = img;
			this.initWidth = this.img.width;
			this.initHeight = this.img.height;		
		if(!document.all || window.opera){
			var canvas = document.createElement("canvas");
			this.ctx = canvas.getContext('2d');
			canvas.setAttribute("width", this.img.width);
			canvas.setAttribute("height", this.img.height);		
			this.ctx.drawImage(this.img,0,0);
			this.ghost = this.img;
			this.img.parentNode.replaceChild(canvas,this.img);
			this.img = canvas;
		}
		
		this.direction = 0;
	},
	run : function(){					
		if(document.all && !window.opera){
			this.img.style.filter = 'progid:DXImageTransform.Microsoft.BasicImage(Rotation=' + this.direction + ')';
			var rate = this.initWidth / this.initHeight;
			if(this.direction % 2 != 0){
			//	this.img.width = this.initHeight;//Math.min(rate * this.initWidth , this.initWidth);
			//	this.img.height = this.initWidth;
			}else{
				this.img.width = this.initWidth;
				this.img.height = this.initHeight;					
			}	
		}else{
			var w = h = dx = dy = a = 0;
			switch (this.direction){
				case 0:
					w = this.ghost.width;
					h = this.ghost.height;	
					dx = 0;
					dy = 0;								
					a = 0;
					break;
				case 1:
					w = this.ghost.height;
					h = this.ghost.width;
					dx = 0;
					dy = - this.ghost.height;								
					a = 90 * Math.PI / 180;				
					break;
				case 2:
					w = this.ghost.width;
					h = this.ghost.height;
					dx = - this.ghost.width;
					dy = - this.ghost.height;
					a = 180 * Math.PI / 180;					
					break;
				case 3:
					w = this.ghost.height;
					h = this.ghost.width;
					dx = - this.ghost.width;
					dy = 0;			
					a = 270 * Math.PI / 180;					
					break;
			}	
			console.log(this.direction);	
			this.img.setAttribute('width', w);
			this.img.setAttribute('height', h);
			this.ctx.rotate(a);
			this.ctx.drawImage(this.ghost, dx, dy);	
			if(this.direction === 1 || this.direction === 3 ){
			//	this.img.style.width = Math.min(this.ghost.width, this.initHeight) + "px";
			}
		}
	},
	runLeft : function(){	
		this.direction--;
		if(this.direction < 0){
			this.direction = 3;
		}
		
		if(this.direction >= 4){
			this.direction = 0;
		}
		this.run();
		
	},
	runRight : function(){	
		this.direction++;	
		if(this.direction < 0){
			this.direction = 3;
		}
		
		if(this.direction > 3){
			this.direction = 0;
		}
		this.run();
			
	}
};

/**
 * 获取秀场、体验的相关品牌
 * @param {Object} divid 加载点
 * @param {Object} postid
 * @param {Object} page
 */
function getPostBrand(divid, postid, page){
	var param = "divid="+divid+"&postid="+postid+"&page="+page;
	$("#"+divid).load(
		"/action/sns/right/post_brand",
		param
	);
}

function psfVideoShowSwf(id) {
	var swfId = "psfSwf_"+id;
	var psfSwf = $("#"+swfId);
	var swfTitle = psfSwf.attr("_title");
	var opened = psfSwf.attr("_opened");
	if(opened=='1') return;
	psfSwf.attr("oldHtml",psfSwf.html());
	var sHtml = 
		"<div class='swfOperations'><em></em><a href='javascript:void(0);' onclick=\"psfVideoHideSwf('"+id+"');\">收起</a>" +
		" | " + swfTitle + "</div>" + "<div class='swfWrapper'><div id='swfContainer_"+id+"'></div></div>";
	psfSwf.html(sHtml);
	swfobject.embedSWF(psfSwf.attr("_swf"),"swfContainer_"+id,'500','400','9.0.0');
	psfSwf.attr("_opened",'1');
}

function psfVideoHideSwf(id) {
	var swfId = "psfSwf_"+id;
	var psfSwf = $("#"+swfId);
	var oldHtml = psfSwf.attr("oldHtml");
	psfSwf.attr("_opened",'0');
	psfSwf.html(oldHtml);
}

/*	解散圈子 */
function dismiss(groupid){
	if(confirm("确定要解散该圈子？")){
		if(groupid == undefined || groupid == ''){
			$.psfInfoDialog("参数错误");
			return false;
		}
		var param = "groupid="+groupid;
		$.post(
			"/sns/group/dismiss_group",
			param,
			function(result){
				if(result.success){
					window.location.href = "/sns/group/mygroup";
				}else{
					$.psfInfoDialog(result.message);
					return false;
				}
			},
			"json"
		);
	}
}

/**
 * 推荐圈子到广播
 * @param {Object} groupid
 * @return {TypeName} 
 */
function promoteGroup(groupid){
	var param = "groupid="+groupid;
	$.post(
		"/sns/group/promote",
		param,
		function(result){
			if(result.success){
				$.psfInfoDialog("推广成功!");
			}else{
				$.psfInfoDialog(result.message);
				return false;
			}
		},
		"json"
	);
}


/**
 *  发信图片
 */

	function blog_image_onSwfLoaded() {
		alert("loaded");
	}

	function blog_image_upload_next() {
		var item = $(".blogUploadImgItem[state='0']").first();
		var fileObjectId = $(item).attr("fileObjectId");
		this.startUpload(fileObjectId);
	}

	function blog_image_onPicSelected(fileObject) {
		$("#blog_image_upload_swf_div").before("<div psftype='blogUploadImageItem' id='blogUploadImgItem_"+fileObject.id+
			"' fileObjectId='"+fileObject.id+
			"' class='blogUploadImgItem' state='0'>"+fileObject.name+"</div>");
		this.setButtonText("<span class='info'>点击添加第"+$("#blog_image_upload_list").children().length+"张图片</span>");
	}

	function blog_image_onFileDialogComplete(nSelected,nQueued,nAllQueued) {
		if(nSelected>0) {
			blog_image_upload_next.call(this);
		}
	}

	function blog_image_onPicUploadProgress (fileObject,bytesComplete,totalBytes) {
		$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"("+Math.round(bytesComplete*100/totalBytes)+"%)");
	}

	function blog_image_onPicUploadError () {
		
	}

	function blog_image_del_pic(fileObjectId) {
		if(confirm('真的要删除图片吗？')) {
			var picid = $("#blogUploadImgItem_"+fileObjectId).attr("picid");
			$("#blogUploadImgItem_"+fileObjectId).remove();
			$("input[name='picid'][value='"+picid+"']").remove();
			blog_image_swf_uploader.setButtonText("<span class='info'>点击添加第"+$("#blog_image_upload_list").children().length+"张图片</span>");
		}
	}

	function blog_image_onPicUploadSuccess (fileObject,serverData,response) {
		var result = $.parseJSON(serverData);
		if(result.success==1) {
			$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"(完成)");
			$("#blogUploadImgItem_"+fileObject.id).attr("state","1");
			$("#blogUploadImgItem_"+fileObject.id).removeClass('blogUploadImgItem');
			$("#blogUploadImgItem_"+fileObject.id).css("float","left");
			$("#blogUploadImgItem_"+fileObject.id).attr("picid",result.picid);
			$("#blogUploadImgItem_"+fileObject.id).html(
				"<div style='margin:0 0 5px 0;float:left;'><img width='370px' src='/pic/"+result.picFileName+"'/></div>"+
				"<div class='blogUploadImgDel' onclick=\"blog_image_del_pic('"+fileObject.id+"');\"><img src='/images/deluploadpic.png'/></div>");
			$(".sennewsBox").append("<input type='hidden' name='picid' value='"+result.picid+"'/>");
		} else {
			$("#blogUploadImgItem_"+fileObject.id).text(fileObject.name+"(出错)");
			$("#blogUploadImgItem_"+fileObject.id).attr("state","2");
			alert(result.info);
		}
	}

	function blog_image_onPicUploadComplete (fileObject) {
		blog_image_upload_next.call(this);
	}

	function blog_image_Ok () {
		$("#dialog_uploadimg").psfDialogClose();
	}

	function blog_image_Cancel() {
		if(confirm('选择取消，将删除当前上传的图片，是否继续？')) {
			blog_image_clear();
		}
	}

	function blog_image_clear() {
		$("#dialog_uploadimg").psfDialogClose();
		$("input[name='picid']").remove();
		$("div[psftype='blogUploadImageItem']").remove();
	}

	var blog_image_swf_uploader = null;

	function delMsgByUid(uid,type){
		if(confirm("确认删除所有对话？")){
			$.post(
				"/action/sns/del_user_msg","uid="+uid,
				function(data) {
					if(data.success == 1){
						if(type == 1){
							$("#msgInfo_"+uid).remove();
							var count = $("#userCount").text() - 1;
							$("#userCount").text(count);
						} else{
							window.location.href = "/sns/my/msg";  
						}
						$.psfInfoDialog("删除成功",2000);
					} else {
						$.psfInfoDialog("删除失败",2000);
					}
				},"json"
			);
		}
	}

	/**
	*type 信件类型 1-好友发来的 2-我发出去的
	flag 1-msg页面 2-详细页
	*/
	function delMsgByMsgid(msgid,type,uid,flag) {
		if(confirm("确认删除信息?")){
			$.post(
					"/action/sns/del_msg","msgid="+msgid,
					function(data) {
						if(data.success == 1){
							if(flag == 1){
								if(type == 1){
									$("#friendMsg_"+msgid).remove();
									$("#friendMsgClear_"+msgid).remove();
								} else {
									$("#selfMsg_"+msgid).remove();
									$("#selfMsgClear_"+msgid).remove();
								}
							} else {
								if(type == 1){
									$("#msgDetailFromFriend_"+msgid).remove();
								} else {
									$("#msgDetailFromMyself_"+msgid).remove();
								}
							}
							$.psfInfoDialog("删除成功",2000);
						} else {
							$.psfInfoDialog("删除失败",2000);
						}
					},"json"
				);
		}
	}

