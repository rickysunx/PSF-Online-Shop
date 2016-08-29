var psfDialogIndex = 0;

function psfHoverDialogClose(contentid,closeCallBack,target) {
	if($("#"+contentid).attr("psfHoverDialogShouldClose")==1) {
		if(closeCallBack) closeCallBack(target);
		$("#"+contentid).psfDialogClose("normal");
	}
}

function psfHideInfoDialog(dialogId,divId) {
	$("#psfDialog_"+dialogId).fadeOut("slow",function(){
		$("#psfInfoDiv_"+divId).psfDialogClose();
		$("#psfInfoDiv_"+divId).remove();
	});
}

(function($) {
	$.extend({
		psfInfoDialog:function(info,disptime) {
			var divId = psfDialogIndex++;
			$("body").append("<div id='psfInfoDiv_"+divId+"' style='padding:10px;width:150px;height:50px;'>" +
				"<div style='float:left;margin-right:10px;'><img src='/images/info.png'/></div>" +
				"<div style='float:left;overflow:hidden;padding-top:5px;height:35px;width:100px;'>"+info+"</div></div>");
			var dialogId = $("#psfInfoDiv_"+divId).psfDialog({"center":true});
			if(disptime==undefined) disptime = 1000;
			setTimeout("psfHideInfoDialog('"+dialogId+"','"+divId+"');",disptime);
		}
	});
})(jQuery);

(function($){
	$.fn.extend({
		/**
		 * psfDialog
		 * @param {Object} options
		 * top:顶端坐标
		 * left:左侧坐标
		 * width:高度
		 * height:宽度
		 * autohide:自动隐藏
		 * modal:是否模态化窗口 true/false
		 * center:true/false
		 * openAnimate:毫秒数
		 * ----新增箭头功能
		 * arrow:是否邮件头true/false
		 * arrowauto:是否自动定位到箭头的坐标true/false
		 * arrowdirection:箭头方向"up"|"right"|"down"|"left"
		 * arrowpos:箭头定位坐标整数
		 * arrowstyle:箭头样式"1"|"2"
		 * 
		 */
		psfDialog:function(options,callback) {
			var oldDialogId = $(this).attr("psfDialogId");
			if(oldDialogId) $(this).psfDialogClose();
			var dialogId = psfDialogIndex++;
			if(options.modal) {
				$("body").append("<div id='psf_dialog_modal_div_"+dialogId+"' style='z-index:"+(1000+dialogId*10)+";' class='psf_dialog_modal_div'></div>");
				$("#psf_dialog_modal_div_"+dialogId).show();
				$("#psf_dialog_modal_div_"+dialogId).width($(document).width());
				$("#psf_dialog_modal_div_"+dialogId).height($(document).height());
			}
			$("body").append("<div id='psfDialog_"+dialogId+"' style='display:none;z-index:"+(1000+dialogId*10+5)+";' class='psf_dialog'>"+
				"<table>"+
				"	<tr>"+
				"		<td class='top_l'></td>"+
				"		<td class='top_c'></td>"+
				"		<td class='top_r'></td>"+
				"	</tr>"+
				"	<tr>"+
				"		<td class='mid_l'></td>"+
				"		<td class='mid_c'><div id='psfDialogContent_"+dialogId+"' class='content'></div></td> "+
				"		<td class='mid_r'></td>"+
				"	</tr>"+
				"	<tr>"+
				"		<td class='bottom_l'></td>"+
				"		<td class='bottom_c'></td>"+
				"		<td class='bottom_r'></td>"+
				"	</tr>"+
				"</table>"+
				"</div>");
			$(this).appendTo("#psfDialogContent_"+dialogId);
			if(options.arrow){
			$("#psfDialogContent_"+dialogId).psfArrow({direction:options.arrowdirection,style:options.arrowstyle,arrowpos:options.arrowpos});
			
			}
			$(this).show();
			if(options && options.openAnimate) {
				$("#psfDialog_"+dialogId).slideDown(options.openAnimate);
			} else {
				$("#psfDialog_"+dialogId).show();
			}
			$(this).attr("psfDialogId",dialogId);
			
			//防止下端溢出
			/**
			var scrollTop = $(document).scrollTop();
			var window_height = $(window).height();
			var dialog_height = $("#psfDialog_"+dialogId).height();
			if(options.top+dialog_height > window_height+scrollTop){
				options.top = window_height+scrollTop-dialog_height;
			}*/
			
			/*按箭头的位置重新定位窗口的坐标*/
			if(options["arrow"]&&options["arrowauto"]){
				var container=$("#psfDialogContent_"+dialogId)[0];
				switch(options["arrowdirection"]){
					case "top":
					if(options && options.left) $("#psfDialog_"+dialogId).css("left",(options.left-options.arrowpos-7)+"px");
					if(options && options.top) $("#psfDialog_"+dialogId).css("top",(options.top+5)+"px");
					break;
					case "right":
					if(options && options.left) $("#psfDialog_"+dialogId).css("left",(options.left-parseInt(container.offsetWidth+10)-5)+"px");
					if(options && options.top) $("#psfDialog_"+dialogId).css("top",(options.top-options.arrowpos-8)+"px");
					break;
					case "bottom":
					if(options && options.left) $("#psfDialog_"+dialogId).css("left",(options.left-options.arrowpos-7)+"px");
					if(options && options.top) $("#psfDialog_"+dialogId).css("top",(options.top-parseInt(container.offsetHeight+10)-5)+"px");
					break;
					case "left":
					if(options && options.left) $("#psfDialog_"+dialogId).css("left",(options.left+5)+"px");
					if(options && options.top) $("#psfDialog_"+dialogId).css("top",(options.top-options.arrowpos-7)+"px");
					break;
					default:
					if(options && options.left) $("#psfDialog_"+dialogId).css("left",options.left);
					if(options && options.top) $("#psfDialog_"+dialogId).css("top",options.top);
				}
			}else{
				/*--over---*/
				if(options && options.left) $("#psfDialog_"+dialogId).css("left",options.left);
				if(options && options.top) $("#psfDialog_"+dialogId).css("top",options.top);
			}
			if(options && options.center) $("#psfDialog_"+dialogId).psfCenter();
			if(callback) callback(this);
			return dialogId;
		},
		psfDialogClose:function() {
			$.each($(this),function(i,n){
				var dialogId = $(n).attr("psfDialogId");
				var target = n;
				$("#psf_dialog_modal_div_"+dialogId).remove();
				$(n).appendTo("body");
				$(n).hide();
				$("#psfDialog_"+dialogId).remove();
				$(n).removeAttr("psfDialogId");
			});
			return this;
		},
		
		/**
		 * psfDirectoryDialog 可设置方位对话框
		 * @param {Object} options
		 * direct表示方向,默认方向为左
		 * contentid:对话框内容Id
		 * @param {Object} callback
		 */
		psfDirectoryDialog:function(options, callback, closeCallBack) {
			var dialogId = 0;
			$(this).hoverDelay({
				hoverDelay : 500,
				hoverEvent : function(){
					var top = $(this).offset().top;
					var scrollTop = $(document).scrollTop();
					var left = $(this).offset().left;
					var scrollLeft = $(document).scrollLeft();
					
					var target_height = $(this).height();
					var target_width = $(this).width();
					var target_top = $(this).offset().top;
					var target_left = $(this).offset().left;
					
					var dialog_width = $("#"+options.contentid).width();
					var dialog_height = $("#"+options.contentid).height();
					
					var window_height = $(window).height();
					var window_width = $(window).width();
					
					if(options.direct == undefined || options.direct == 'left'){	//默认向左
						left = target_left - dialog_width - 25;
						top = target_top - (dialog_height-target_height)/2;	//根据对话框高度调整显示位置，中线对齐
					}else if(options.direct == 'right'){
						left = target_left + target_width;
						top = target_top - (dialog_height-target_height)/2;	//根据对话框高度调整显示位置，中线对齐
					}else if(options.direct == 'top'){
						top = target_top - dialog_height;
					}else if(options.direct == 'bottom'){
						top = target_top + target_height;
					}
					
					dialogId = $("#"+options.contentid).psfDialog(
						{"top":top,"left":left,"arrow":options.arrow,"arrowauto":options.arrowauto,"arrowdirection":options.arrowdirection,"arrowpos":options.arrowpos});
					
					$('#psfDialog_'+dialogId).fixPosition({"obj":this,"direct":options.direct});
					
					//定位箭头位置
					var new_top = $('#psfDialog_'+dialogId).offset().top;
					var new_left = $('#psfDialog_'+dialogId).offset().left;
					var arrowpos = target_top + target_height/2 - new_top;
					options.arrowpos = arrowpos;
					dialogId = $("#"+options.contentid).psfDialog(
						{"top":new_top,"left":new_left,"arrow":options.arrow,"arrowauto":options.arrowauto,"arrowdirection":options.arrowdirection,"arrowpos":options.arrowpos});
					
					$("#"+options.contentid).attr("psfHoverDialogShouldClose","0");
					$("#psfDialog_"+dialogId).hover(function(){
						$("#"+options.contentid).attr("psfHoverDialogShouldClose","0");
					},function(){
						$("#"+options.contentid).attr("psfHoverDialogShouldClose","1");
						setTimeout(function(){
							psfHoverDialogClose(options.contentid,closeCallBack,this);
						},500);
					});
					if(callback) callback(this);
				},
				outDelay : 0,
				outEvent : function(){
					$("#"+options.contentid).attr("psfHoverDialogShouldClose","1");
					setTimeout(function(){
						psfHoverDialogClose(options.contentid,closeCallBack,this);
					},500);
				}
			});
		},
		
		/**
		 * psfHoverDialog
		 * @param {Object} options
		 * contentid:对话框内容Id
		 * @param {function} callback
		 */
		psfHoverDialog:function(options,callback,closeCallBack) {
			var dialogId = 0;
			
			$(this).hover(function(){
				options.arrowpos = 20;
				var top = $(this).scrollTop()+$(this).offset().top;
				var left = $(this).scrollLeft()+$(this).offset().left;
				var height = $(this).height();
				var width = $(this).width();
				var dialog_height = $("#"+options.contentid).height();
				var dialog_width = $("#"+options.contentid).width();
				
				//浮动框位置调整，如果在视窗下半部分，则在上面显示，反之，则在下面显示
				if((top - $(document).scrollTop()) < $(window).height()/2){
					top = top + height + 5;
					options.arrowdirection = "top";
				}else{
					top = top - dialog_height - 15;
					options.arrowdirection = "bottom";
				}
				
				if((left + dialog_width) > 1200){	//如果右侧溢出
					left = 1200 - dialog_width;
					options.arrowpos = $(this).offset().left + width/2 - left;
				}
				
				dialogId = $("#"+options.contentid).psfDialog(
					{"top":top,"left":left,"arrow":options.arrow,"arrowauto":options.arrowauto,"arrowdirection":options.arrowdirection,"arrowpos":options.arrowpos});
				
				
				$("#"+options.contentid).attr("psfHoverDialogShouldClose","0");
				$("#psfDialog_"+dialogId).hover(function(){
					$("#"+options.contentid).attr("psfHoverDialogShouldClose","0");
				},function(){
					$("#"+options.contentid).attr("psfHoverDialogShouldClose","1");
					//setTimeout("psfHoverDialogClose('"+options.contentid+"');",500);
					setTimeout(function(){
						psfHoverDialogClose(options.contentid,closeCallBack,this);
					},500);
				});
				if(callback) callback(this);
			},function(){
				$("#"+options.contentid).attr("psfHoverDialogShouldClose","1");
				//setTimeout("psfHoverDialogClose('"+options.contentid+"');",500);
				setTimeout(function(){
					psfHoverDialogClose(options.contentid,closeCallBack,this);
				},500);
			});
		},
		psfCenter:function() {
			var top = ($(window).height() - $(this).height())/2; 
			var left = ($(window).width() - $(this).width())/2; 
			var scrollTop = $(document).scrollTop(); 
			var scrollLeft = $(document).scrollLeft();
			this.css({'top':top+scrollTop,left:left+scrollLeft});
			return this;
		},
		
		psfArrow:function(option){
			$.each(this,function(i,n){
				var arrowhtml,d,w,h,x,y;
				switch(option["direction"]){
					case "top":
						d="0";
						h="8px";
						w="14px";
						x="left:"+(option["arrowpos"] || 0)+"px;";
						y="top:-8px;_top:-7px;";
					break;
					case "right":
						d="-20";
						w="8px";
						h="14px";
						x="right:-8px;";
						y="top:"+(option["arrowpos"] || 0)+"px;";
					break;
					case "bottom":
						d="-10";
						h="8px";
						w="14px";
						x="left:"+(option["arrowpos"] || 0)+"px;";
						y="bottom:-8px;";
					break;
					case "left":
						d="-40";
						w="8px";
						h="14px";
						x="left:-8px;";
						y="top:"+(option["arrowpos"] || 0)+"px;";
					break;
				}
				arrowhtml="<div style='position:absolute;background:url(/images/arrow_8bit.png) no-repeat scroll "+(option["style"]=="1"?"0":"-20")+"px "+d+"px transparent;width:"+w+";height:"+h+";"+x+y+";overflow:hidden;z-index:1'></div>"	
				if($(n).css("position")!="absolute" && $(n).css("position")!="relative" ){ $(n).css("position","relative")}
				$(n).append(arrowhtml);
			});

			return this;
		},
		
		/**
		 * 延迟触发
		 * @param {Object} options
		 * hoverDelay : 鼠标移入显示延迟时间
		 * hoverEvent : 鼠标移入触发事件
		 * outDelay : 鼠标移出消失延迟时间
		 * outEvent : 鼠标移出触发事件
		 * @memberOf {TypeName} 
		 * @return {TypeName} 
		 */
		hoverDelay:function(options){
			var obj=this;
			//alert(obj.attr("pid"));
			var defaults = {
				hoverDelay: 200,
				outDelay: 200,
				hoverEvent : function(){
					$.noop();
				},
				outEvent: function() {
					$.noop();
				}
			};
			var setting = $.extend(defaults, options||{});
			var hoverTimer, outTimer;
			$(this).hover(function(){
				clearTimeout(outTimer);
				hoverTimer = setTimeout(function(){setting.hoverEvent.call(obj)}, setting.hoverDelay);
			},function(){
				clearTimeout(hoverTimer);
				outTimer = setTimeout(setting.outEvent, setting.outDelay);
			});
			return this;
		},
		
		/**
		 * 调整浮动位置
		 * @param {Object} options
		 * obj 触发事件对象
		 * direct 显示方向
		 * @memberOf {TypeName} 
		 * @return {TypeName} 
		 */
		fixPosition: function(options){
			//浮动框属性值
			var top = $(this).offset().top;	
			var left = $(this).offset().left;	
			var dialog_width = $(this).width();	
			var dialog_height = $(this).height();
			
			//触发事件对象属性值
			var target_width = $(options.obj).width();
			var target_height = $(options.obj).height();
			var target_top = $(options.obj).offset().top;
			var target_left = $(options.obj).offset().left;
			
			//文档和窗体属性值
			var scrollTop = $(document).scrollTop();
			var scrollLeft = $(document).scrollLeft();
			var window_height = $(window).height();
			var window_width = $(window).width();
			
			if(top<scrollTop){	//如果向上溢出
				if(options.direct == 'top'){	//如果显示方向为上
					top = target_top + target_height;
				}else{	//否则，齐顶显示
					top = scrollTop;
				}
			}else if(top + dialog_height > window_height + scrollTop){	//如果向下溢出
				if(options.direct == 'bottom'){	//如果显示方向为下
					top = target_top - dialog_height;
				}else{ //齐底显示
					top = window_height + scrollTop - dialog_height;
				}
			}if(left < 200){	//如果向左溢出，则向右显示
				if(options.direct == 'left'){
					left = 200;
				}else{
					left = scrollLeft;
				}
			}else if(left + dialog_width > 1200){	//如果向右溢出，则向左显示
				if(options.direct == 'right'){
					left = target_left - dialog_width;
				}else{
					left = 1200 - dialog_width;					
				}
			}
			
			$(this).css({'top':top,'left':left});
			return this;
		},
		/*返回控件相对页面的绝对坐标
		 * 
		 * */
		getElCoordinate:function (){
		dom=this[0];
		var t = dom.offsetTop;
		var l = dom.offsetLeft;
		dom=dom.offsetParent;
		while (dom) {
			t += dom.offsetTop;
			l += dom.offsetLeft;
			dom=dom.offsetParent;
			}; return {
			top: t,
			left: l
			};
		},
		/*好友查询*/
		getPsfFriend:function(url,callback){
			var objthis_=this;
			var htmltext='<div id="psfFriendBox" style="position:absolute;top:0px;left:0px;width:90px;background-color: #FFFFFF;border: 1px solid #A69E80;padding:5px;" ><div id="psfFriendItemList_" style="padding-bottom:10px;"><p>没有查询到品友</p></div><div id="psfFriendPrevAndNext_" style="text-align:right" ><a id="psfFriendPrev_" href="javascript:void(0)" style="margin-right:110px;">上一组</a><a id="psfFriendNext_" href="javascript:void(0)">下一组</a></div></div>';
			//alert(htmltext);
			this.data("psffriendform",{page:1,name:""});
			this.data("refreshPsfFriendList",function(url_,form){
				//$(this).val($(this).val()+"_");
			var objthis=this;
				$("#psfFriendBox").remove();
				$("body").append(htmltext);
				//------------测试
				/*
						var data_={
							userList:[{userName:"a1",remarkName:""},{userName:"a2",remarkName:""},{userName:"a3",remarkName:""}],
							showPrev:false,
							showNext:true
						};
						var s = "";
						$.each(data_.userList,function(i,user){
							s+="<a userName='"+user.userName+"' class='grayhover' style='display:block;cursor:pointer'>"+user.userName+
								(user.remarkName.length==0?"":"("+user.remarkName+")")+"</a>";
						});
						if(s!=""){
							$("#psfFriendItemList_").html(s);
						}
						$("#psfFriendItemList_ a").click(function(){
							$(objthis).val($(this).attr("username"));
						});
						if(data_.showPrev) {
							$("#psfFriendBox #psfFriendPrev_").show();
						} else {
							$("#psfFriendBox #psfFriendPrev_").hide();
						}
						
						if(data_.showNext) {
							$("#psfFriendBox #psfFriendNext_").show();
						} else {
							$("#psfFriendBox #psfFriendNext_").hide();
						}
						
						//alert(objthis.offsetWidth+"   "+$("#psfFriendBox")[0].offsetWidth);
						$("#psfFriendBox").psfArrow({direction:"top",arrowpos:80})
						.css("top",$(objthis).getElCoordinate().top+28)
						.css("left",$(objthis).getElCoordinate().left+(objthis.offsetWidth-$("#psfFriendBox")[0].offsetWidth)/2)
						.css("z-index","2000")
						.show();
				*/
				$.post(url_,form,function(data_){
					if(data_.success==1) {
						var s = "";
						$.each(data_.userList,function(i,user){
							s+="<a uid='"+user.uid+"' userName='"+user.userName+"' class='grayhover' style='display:block;cursor:pointer'>"+user.userName+
								(user.remarkName.length==0?"":"("+user.remarkName+")")+"</a>";
						});
						if(s!=""){
							$("#psfFriendItemList_").html(s);
						}
						$("#psfFriendItemList_ a").click(function(){
							$(objthis).val($(this).attr("username"));
							callback.call(objthis_,$(this).attr("uid"));
							objthis_.unbind("blur");
							$("#psfFriendBox").remove();
							
						});
						if(data_.showPrev) {
							$("#psfFriendBox #psfFriendPrev_").show();
						} else {
							$("#psfFriendBox #psfFriendPrev_").hide();
						}
						
						if(data_.showNext) {
							$("#psfFriendBox #psfFriendNext_").show();
						} else {
							$("#psfFriendBox #psfFriendNext_").hide();
						}
						//alert(objthis.offsetWidth+"   "+$("#psfFriendBox")[0].offsetWidth);
						$("#psfFriendBox").css("top",$(objthis).getElCoordinate().top+objthis.offsetHeight)
						.css("left",$(objthis).getElCoordinate().left+(objthis.offsetWidth-$("#psfFriendBox")[0].offsetWidth)/2)
						.css("z-index",2000)
						.show();
						$("#psfFriendBox").click(function(){$("#psfFriendBox").remove();}).mouseenter(function(){
							objthis_.unbind("blur");	
						}).mouseleave(function(){objthis_.blur(function(){$("#psfFriendBox").remove();})});
						objthis_.blur(function(){$("#psfFriendBox").remove();});
						$("#psfFriendBox #psfFriendPrev_").unbind("click").click(function(){
							objthis_.data("psffriendform",{page:objthis_.data("psffriendform").page-1,name:objthis_.val()});
							objthis_.data("refreshPsfFriendList").call(objthis_[0],url,objthis_.data("psffriendform"));		
						});
						$("#psfFriendBox #psfFriendNext_").unbind("click").click(function(){
							objthis_.data("psffriendform",{page:objthis_.data("psffriendform").page+1,name:objthis_.val()});
							objthis_.data("refreshPsfFriendList").call(objthis_[0],url,objthis_.data("psffriendform"));		
						})
					} else {
						alert(data_.info);
					}
				},"json");
			});
			this.keyup(function(){
				clearTimeout($(this).data("refresshTime"));
				$(this).data("refresshTime",setTimeout(function(){
					objthis_.data("psffriendform",{page:1,name:objthis_.val()});
					objthis_.data("refreshPsfFriendList").call(objthis_[0],url,objthis_.data("psffriendform"));	
				},380));
				
			});
			this.focusin(function(){
				$(this).data("psffriendform",{page:1,name:$(this).val()});
				$(this).data("refreshPsfFriendList").call(this,url,$(this).data("psffriendform"));
			});
			
			
		},
		//鼠标滚轮事件
		mousewheel:function(Func){
			return this.each(function(){
				var _self = this;
			    _self.D = 0;//滚动方向
				if($.browser.msie||$.browser.safari){
				   _self.onmousewheel=function(){_self.D = event.wheelDelta;event.returnValue = false;Func && Func.call(_self);};
				}else{
				   _self.addEventListener("DOMMouseScroll",function(e){
						_self.D = e.detail>0?-1:1;
						e.preventDefault();
						Func && Func.call(_self);
				   },false); 
				}
			});
		},
		//自定义滚动轴
		jscroll:function(j){
			return this.each(function(){
				j = j || {}
				j.Bar = j.Bar||{};//2级对象
				j.Btn = j.Btn||{};//2级对象
				j.Bar.Bg = j.Bar.Bg||{};//3级对象
				j.Bar.Bd = j.Bar.Bd||{};//3级对象
				j.Btn.uBg = j.Btn.uBg||{};//3级对象
				j.Btn.dBg = j.Btn.dBg||{};//3级对象
				var jun = { W:"12px"
							,BgUrl:""
							,Bg:"#fff586"
							,Bar:{  Pos:"up"
									,Bd:{Out:"#f9f0d5",Hover:"#f9f0d5"}
									,Bg:{Out:"#fe970e",Hover:"#fe970e",Focus:"orange"}}
							,Btn:{  btn:true
									,uBg:{Out:"#fe970e",Hover:"#fe970e",Focus:"orange"}
									,dBg:{Out:"#fe970e",Hover:"#fe970e",Focus:"orange"}}
							,Fn:function(){}}
				j.W = j.W||jun.W;
				j.BgUrl = j.BgUrl||jun.BgUrl;
				j.Bg = j.Bg||jun.Bg;
					j.Bar.Pos = j.Bar.Pos||jun.Bar.Pos;
						j.Bar.Bd.Out = j.Bar.Bd.Out||jun.Bar.Bd.Out;
						j.Bar.Bd.Hover = j.Bar.Bd.Hover||jun.Bar.Bd.Hover;
						j.Bar.Bg.Out = j.Bar.Bg.Out||jun.Bar.Bg.Out;
						j.Bar.Bg.Hover = j.Bar.Bg.Hover||jun.Bar.Bg.Hover;
						j.Bar.Bg.Focus = j.Bar.Bg.Focus||jun.Bar.Bg.Focus;
					j.Btn.btn = j.Btn.btn!=undefined?j.Btn.btn:jun.Btn.btn;
						j.Btn.uBg.Out = j.Btn.uBg.Out||jun.Btn.uBg.Out;
						j.Btn.uBg.Hover = j.Btn.uBg.Hover||jun.Btn.uBg.Hover;
						j.Btn.uBg.Focus = j.Btn.uBg.Focus||jun.Btn.uBg.Focus;
						j.Btn.dBg.Out = j.Btn.dBg.Out||jun.Btn.dBg.Out;
						j.Btn.dBg.Hover = j.Btn.dBg.Hover||jun.Btn.dBg.Hover;
						j.Btn.dBg.Focus = j.Btn.dBg.Focus||jun.Btn.dBg.Focus;
				j.Fn = j.Fn||jun.Fn;
				var _self = this;
				var Stime,Sp=0,Isup=0;
				$(_self).css({overflow:"hidden",position:"relative",padding:"0px"});
				var dw = $(_self).width(), dh = $(_self).height()-1;
				var sw = j.W ? parseInt(j.W) : 21;//滚动条宽度
				var sl = dw - sw				//容器宽度减去滚动条宽度得到滚动区与宽度
				var bw = j.Btn.btn==true ? sw : 0;
				if($(_self).children(".jscroll-c").height()==null){//存在性检测
			$(_self).wrapInner("<div class='jscroll-c' style='top:0px;z-index:9999;zoom:1;position:relative'></div>");
				$(_self).children(".jscroll-c").prepend("<div style='height:0px;overflow:hidden'></div>");
				$(_self).append("<div class='jscroll-e' unselectable='on' style=' height:100%;top:0px;right:0;-moz-user-select:none;position:absolute;overflow:hidden;z-index:10000;'><div class='jscroll-u' style='position:absolute;top:0px;width:100%;left:0;background:blue;overflow:hidden'></div><div class='jscroll-h'  unselectable='on' style='background:green;position:absolute;left:0;-moz-user-select:none;border:1px solid'></div><div class='jscroll-d' style='position:absolute;bottom:0px;width:100%;left:0;background:blue;overflow:hidden'></div></div>");
				}
				var jscrollc = $(_self).children(".jscroll-c");	//内部滚动体
				var jscrolle = $(_self).children(".jscroll-e");	//右侧滚动轴
				var jscrollh = jscrolle.children(".jscroll-h");	//滑块
				var jscrollu = jscrolle.children(".jscroll-u");	//上箭头
				var jscrolld = jscrolle.children(".jscroll-d");	//下箭头
				if($.browser.msie){document.execCommand("BackgroundImageCache", false, true);}
				/*
				jscrollc.css({"padding-right":sw});
				jscrolle.css({width:sw,background:j.Bg,"background-image":j.BgUrl});
				jscrollh.css({top:bw,background:j.Bar.Bg.Out,"background-image":j.Bar.Bg.BgUrl,"border-color":j.Bar.Bd.Out,width:sw-2});
				jscrollu.css({height:bw,background:j.Btn.uBg.Out,"background-image":j.BgUrl});
				jscrolld.css({height:bw,background:j.Btn.dBg.Out,"background-image":j.BgUrl});
				jscrollh.hover(function(){if(Isup==0)$(this).css({background:j.Bar.Bg.Hover,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Hover})},function(){if(Isup==0)$(this).css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out})})
				jscrollu.hover(function(){if(Isup==0)$(this).css({background:j.Btn.uBg.Hover,"background-image":j.BgUrl})},function(){if(Isup==0)$(this).css({background:j.Btn.uBg.Out,"background-image":j.BgUrl})})
				jscrolld.hover(function(){if(Isup==0)$(this).css({background:j.Btn.dBg.Hover,"background-image":j.BgUrl})},function(){if(Isup==0)$(this).css({background:j.Btn.dBg.Out,"background-image":j.BgUrl})})
				*/
				var sch = jscrollc.height();//内部滚动体的高度
				//var sh = Math.pow(dh,2) / sch ;//Math.pow(x,y)x的y次方
				//alert(bw);
				var sh = (dh-2*bw)*dh / sch	//dh外部显示遮罩层的高度，bw上下留出的空隙 ，sch内部滚动体的高度,根据显示区域和滑动区域的比例计算滑块的大小
				if(sh<10){sh=10}
				var wh = sh/6				//滚动时候跳动幅度
				//alert(wh)
				//sh = parseInt(sh);
				var curT = 0,allowS=false;
				jscrollh.height(sh);
				if(sch<=dh){jscrollc.css({padding:0});jscrolle.css({display:"none"})}else{allowS=true;}//判断是否需要滚动轴
				if(j.Bar.Pos!="up"){		//未知
				curT=dh-sh-bw;
				setT();
				}
				jscrollh.bind("mousedown",function(e){
					j['Fn'] && j['Fn'].call(_self);
					Isup=1;
					//jscrollh.css({background:j.Bar.Bg.Focus,"background-image":j.BgUrl})
					var pageY = e.pageY ,t = parseInt($(this).css("top"));
					$(document).mousemove(function(e2){
						 curT =t+ e2.pageY - pageY;//pageY浏览器可视区域鼠标位置，screenY屏幕可视区域鼠标位置
							setT();
					});
					$(document).mouseup(function(){
						Isup=0;
					//	jscrollh.css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out})
						$(document).unbind();
					});
					return false;
				});
				jscrollu.bind("mousedown",function(e){
				j['Fn'] && j['Fn'].call(_self);
					Isup=1;
					jscrollu.css({background:j.Btn.uBg.Focus,"background-image":j.BgUrl})
					_self.timeSetT("u");
					$(document).mouseup(function(){
						Isup=0;
						jscrollu.css({background:j.Btn.uBg.Out,"background-image":j.BgUrl})
						$(document).unbind();
						clearTimeout(Stime);
						Sp=0;
					});
					return false;
				});
				jscrolld.bind("mousedown",function(e){
				j['Fn'] && j['Fn'].call(_self);
					Isup=1;
					jscrolld.css({background:j.Btn.dBg.Focus,"background-image":j.BgUrl})
					_self.timeSetT("d");
					$(document).mouseup(function(){
						Isup=0;
						jscrolld.css({background:j.Btn.dBg.Out,"background-image":j.BgUrl})
						$(document).unbind();
						clearTimeout(Stime);
						Sp=0;
					});
					return false;
				});
				_self.timeSetT = function(d){
					var self=this;
					if(d=="u"){curT-=wh;}else{curT+=wh;}
					setT();
					Sp+=2;
					var t =500 - Sp*50;
					if(t<=0){t=0};
					Stime = setTimeout(function(){self.timeSetT(d);},t);
				}
				jscrolle.bind("mousedown",function(e){
						j['Fn'] && j['Fn'].call(_self);
								curT = curT + e.pageY - jscrollh.offset().top - sh/2;
								asetT();
								return false;
				});
				function asetT(){				
							if(curT<bw){curT=bw;}
							if(curT>dh-sh-bw){curT=dh-sh-bw;}
							jscrollh.stop().animate({top:curT},100);
							var scT = -((curT-bw)*sch/(dh-2*bw));
							jscrollc.stop().animate({top:scT},1000);
				};
				function setT(){				//curT滑块的top，scT内部滚动体的top
							if(curT<bw){curT=bw;}//边界判断
							if(curT>dh-sh-bw){curT=dh-sh-bw;}
							jscrollh.css({top:curT});
							var scT = -((curT-bw)*sch/(dh-2*bw));
							jscrollc.css({top:scT});
				};
				function setT_(){				//curT滑块的top，scT内部滚动体的top
							if(curT<bw){curT=bw;}//边界判断
							if(curT>dh-sh-bw){curT=dh-sh-bw;}
							jscrollh.stop().animate({top:curT});
							var scT = -((curT-bw)*sch/(dh-2*bw));
							jscrollc.stop().animate({top:scT});
				};
				$(_self).mousewheel(function(){
						if(allowS!=true) return;
						j['Fn'] && j['Fn'].call(_self);
							if(this.D>0){curT-=wh;}else{curT+=wh;};
							setT_();
				})
			});
		}
	});
})(jQuery);

String.prototype.trim = function() {
	return $.trim(this);
};

String.prototype.replaceAll = function(s1,s2) {
	return this.replace(new RegExp(s1,"gm"),s2);
};

String.prototype.endsWith = function(endstr) {
	var endlen = endstr.length;
	if(this.length>=endlen) {
		var str0 = this.substr(this.length-endlen,endlen);
		if(str0==endstr) return true;
	}
	return false;
};





