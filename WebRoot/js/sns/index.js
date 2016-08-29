$(document).ready(function(){
	loadPostList(-1,-1,-1,1);
	$("#blogSubmitButton").click(function(){
		submitBlog();
	});
	
	$("#blogContent").keydown(function(){
		blogContentChanged();
	});
	
	$("#blogContent").keyup(function(){
		blogContentChanged();
	});
	loadRecommend('sns_index_recommend',1,1,2);
	initIndexTabAnimate();
});

function doIndexTabAnimatePlusIE(theSpan,index) {
	if(index>3) return;
	var left = index*52;
	$(theSpan).css("background-position-x","-"+left+"px");
	setTimeout(function(){doIndexTabAnimatePlusIE(theSpan,index+1);},30);
}

function doIndexTabAnimateMinusIE(theSpan,index) {
	if(index<0) return;
	var left = index*52;
	$(theSpan).css("background-position-x","-"+left+"px");
	setTimeout(function(){doIndexTabAnimateMinusIE(theSpan,index-1)},30);
}

function doIndexTabAnimatePlus(theSpan,index,theHeight) {
	if(index>3) return;
	var left = index*52;
	$(theSpan).css("background-position","-"+left+"px "+theHeight);
	setTimeout(function(){doIndexTabAnimatePlus(theSpan,index+1,theHeight);},30);
}

function doIndexTabAnimateMinus(theSpan,index,theHeight) {
	if(index<0) return;
	var left = index*52;
	$(theSpan).css("background-position","-"+left+"px "+theHeight);
	setTimeout(function(){doIndexTabAnimateMinus(theSpan,index-1,theHeight)},30);
}

function initIndexTabAnimate() {
	if($.browser.msie) {
		$("#index_tab_type > li").hover(function(){
			var theSpan = $(this).find("span");
			var theLiClass = $(this).attr("class");
			if(theLiClass!="current") {
				doIndexTabAnimatePlusIE(theSpan,1);
			}
		},function(){
			var theSpan = $(this).find("a > span");
			var theLiClass = $(this).attr("class");
			if(theLiClass!="current") {
				doIndexTabAnimateMinusIE(theSpan,3);
			}
		});
	} else {
		$("#index_tab_type > li").hover(function(){
			var theSpan = $(this).find("span");
			var theLiClass = $(this).attr("class");
			var thePos = $(theSpan).css("background-position");
			var spaceStart = thePos.indexOf(" ");
			var theHeight = thePos.substr(spaceStart+1);
			if(theLiClass!="current") {
				doIndexTabAnimatePlus(theSpan,1,theHeight);
			}
		},function(){
			var theSpan = $(this).find("a > span");
			var theLiClass = $(this).attr("class");
			var thePos = $(theSpan).css("background-position");
			var spaceStart = thePos.indexOf(" ");
			var theHeight = thePos.substr(spaceStart+1);
			if(theLiClass!="current") {
				doIndexTabAnimateMinus(theSpan,3,theHeight);
			}
		});
	}
}

function blogContentChanged() {
	$("#word_left_count").text(200-$("#blogContent").val().length);
}


function submitBlog(callback) {
	$("#dialog_uploadimg").psfDialogClose();
	$.post(
		$("#blogForm").attr("action"),
		$("#blogForm").serialize(),
		function(data){
			if(data.success==1) {
				$("#blogContent").val("");
				blogContentChanged();
				if(callback == undefined || callback == null){
					loadPostList(-1,-1,-1,1);
				}else{
					callback();
				}
				blog_image_clear();
				$.psfInfoDialog("广播发布成功");
			} else {
				$.psfInfoDialog("发布失败："+data.info,2000);
			}
		},
		"json"
	);
}

function loadPostList(otype,order,range,page) {
	if(otype!=-1) {
		if($.browser.msie) {
			$("#index_tab_type > li.current > a > span").css("background-position-x",0);
		} else {
			var thePos = $("#index_tab_type > li.current > a > span").css("background-position");
			var spaceStart = thePos.indexOf(" ");
			var theHeight = thePos.substr(spaceStart+1);
			$("#index_tab_type > li.current > a > span").css("background-position","0 "+theHeight);
		}
		
		
		$("#index_tab_form > input[name='otype']").val(otype);
		$("#index_tab_type > li").removeClass("current");
		$("#index_tab_type > li:eq("+otype+")").addClass("current");
		
		if($.browser.msie) {
			$("#index_tab_type > li.current > a > span").css("background-position-x","-156px");
		} else {
			var thePos = $("#index_tab_type > li.current > a > span").css("background-position");
			var spaceStart = thePos.indexOf(" ");
			var theHeight = thePos.substr(spaceStart+1);
			$("#index_tab_type > li.current > a > span").css("background-position","-156px "+theHeight);
		}
	}
	
	if(range!=-1) {
		$("#index_tab_form > input[name='range']").val(range);
		$("#index_tab_range > a").removeClass("current");
		if(range==2) {
			$("#index_tab_range > a:eq(2)").addClass("current");
		}
		if(range==3) {
			$("#index_tab_range > a:eq(3)").addClass("current");
		}
	}
	
	if(order!=-1) {
		$("#index_tab_form > input[name='order']").val(order);
		if(range==1) {
			if(order==1) {
				$("#index_tab_range > a:eq(0)").addClass("current");
				$("#index_tab_range > a:eq(1)").removeClass("current");
			}
			if(order==2) {
				$("#index_tab_range > a:eq(0)").removeClass("current");
				$("#index_tab_range > a:eq(1)").addClass("current");
			}
		}

	}
	
	if(page > 0) {
		$("#index_tab_form > input[name='page']").val(page);
	}
	
	$("#sns_index_post_list").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");

	$("#sns_index_post_list").load(
		"/action/sns/get_post_list?seed="+Math.random(),
		$("#index_tab_form").serialize()
	);

}

/**
 * 查询推荐对象信息
 * @param (Object) divid 加载点ID
 * @param {Object} otype
 * @param {Object} page
 * @param (Object) typeid	请求类型ID，见SnsCommonRightAction
 * @param (object) options 自定义请求参数
 */
function loadRecommend(divid, otype, page, typeid, options){
	var param = "page="+page+"&typeid="+typeid+"&divid="+divid;
	if(options != undefined){
		param += "&"+$.param(options);
	}
	$(".sns-statustab ul li:eq("+(otype-1)+")").addClass("current");
	$(".sns-statustab ul li:eq("+(otype-1)+")").siblings().removeClass("current");
	$("#"+divid).html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
	if(otype == 1){
		$("#"+divid).load(
			"/action/sns/right/psf_friend",
			param
		);
	}else if(otype == 2){
		$("#"+divid).load(
			"/action/sns/right/group",
			param
		);
	}else if(otype == 3){
		$("#"+divid).load(
			"/action/sns/right/show",
			param
		);
	}else if(otype == 4){
		$("#"+divid).load(
			"/action/sns/right/shopexp",
			param
		);
	}else if(otype == 5){
		$("#"+divid).load(
			"/action/sns/right/guide",
			param
		);
	}else if(otype == 6){
		$("#"+divid).load(
			"/action/sns/right/product",
			param
		);
	}
}

var tidg = null; 	//用来记录当前运行的程序。

//启动：自动更新 post 的程序
function startLastUpdatePost(formid, url){
	//启动新的程序前要先停止当前的程序。除非切换整个页面。
	if(tidg != null){
		window.clearInterval(tidg);
	}
	tidg=window.setInterval(function(){
		getLastUpdatePostCount(formid, url)
	},30000);
}
function getLastUpdatePostCount(formid, url){
	$.post(
		url,
		$("#"+formid+"Form").serialize(),
		function(data) {
			if(data.success==1) {
				$("#"+formid+"Count").html("有"+data.count+"条新的"+data.name+"，点击进行查看。");
			} else {
			}
		},"json"
	);
}

function getLastUpdatePostList(formid, url){
	if(tidg != null){
		window.clearInterval(tidg);
		tidg = null;
	}
	$("#"+formid+"Count").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
	$("#"+formid+"Div").load(
		url,
		$("#"+formid+"Form").serialize(),
		function(){
		}
	);
}


