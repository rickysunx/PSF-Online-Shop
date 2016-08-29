var psfMenuId = 0;

function closePsfMenuTimer(psfMenuId) {
	var _close = $("#"+psfMenuId).attr("psfMenuShouldClose");
	if(_close && _close=="1") {
		$("#"+psfMenuId).hide();
	}
}

(function($) {
	$.fn.extend({
		/**
		 * 
		 * @param options
		 * pos:"over" 覆盖原有元素 "below" 在元素正下方
		 * title:不设置则无title
		 * width:设置宽度，可选
		 * items:
		 *    type:不设置-普通元素 'line'-横线
		 *    name:显示名
		 *    icon:图标的CSS样式，可选
		 *    handler:事件处理函数的语句
		 * 
		 */
		psfMenu:function(options) {
			psfMenuId++;
			var s = "<div id='psfmenu_"+psfMenuId+"' class='psfmenu'>";
			if(options.title) s+="<div class='title'>"+options.title+"</div>";
			for(var i=0;i<options.items.length;i++) {
				var item = options.items[i];
				if(!item.type) {
					s+="<div class='item'><a href=\"javascript:"+item.handler+";\">"+item.name+"</a></div>";
				} else if(item.type=='line') {
					s+="<div class='line'></div>";
				}
			}
			s+="</div>";
			$("body").append(s);
			
			$("#psfmenu_"+psfMenuId+" > div > a").click(function(){
				$(this).parent().parent().hide();
			});
			
			$(this).attr("psfMenuId",psfMenuId);
			
			$(this).hover(function(){
				var menuId = $(this).attr("psfMenuId");
				var top = $(this).scrollTop()+$(this).offset().top;
				var left = $(this).scrollLeft()+$(this).offset().left;
				var height = $(this).outerHeight(true);
				
				var menu_top = top;
				var menu_left = left;
				if(options.pos=="below") {
					menu_top = top+height;
				} else {
					menu_top = menu_top - 3;
					menu_left= menu_left - 3;
				}
				
				$("#psfmenu_"+menuId).css("left",menu_left+"px");
				$("#psfmenu_"+menuId).css("top",menu_top+"px");
				$(".psfmenu").hide();
				$(".psf_icon_menu").hide();
				$("#psfmenu_"+menuId).fadeIn("fast");
				$("#psfmenu_"+menuId).attr("psfMenuShouldClose","0");
			},function(){
				var menuId = $(this).attr("psfMenuId");
				$("#psfmenu_"+menuId).attr("psfMenuShouldClose","1");
				setTimeout("closePsfMenuTimer('psfmenu_"+menuId+"')",500);
			});
			
			$("#psfmenu_"+psfMenuId).hover(function(){
				$(this).attr("psfMenuShouldClose","0");
			},function(){
				$(this).attr("psfMenuShouldClose","1");
				setTimeout("closePsfMenuTimer('"+this.id+"')",500);
			});
			
			return psfMenuId;
		},
		/**
		 * 
		 * @param options
		 * pos:"over" 覆盖原有元素 "below" 在元素正下方
		 * width:设置宽度，可选
		 * items:
		 *    type:不设置-普通元素 'line'-横线
		 *    name:显示名
		 *    icon:图标的CSS样式，可选
		 *    handler:事件处理函数的语句
		 */
		psfIconMenu:function(options) {
			psfMenuId++;
			var s = "<div id='psfmenu_"+psfMenuId+"' class='psf_icon_menu'><table><tr><td><ol>";
			for(var i=0;i<options.items.length;i++) {
				var item = options.items[i];
				if(!item.type) {
					if(item.icon==undefined) {
						s+="<li><a href=\"javascript:"+item.handler+";\">"+item.name+"</a></li>";
					} else {
						s+="<li><a class='"+item.icon+"' href=\"javascript:"+item.handler+";\"><em></em>"+item.name+"</a></li>";
					}
				} else if(item.type=='line') {
					s+="</ol><i></i><ol>";
				}
			}
			s+="</ol></td></tr></table></div>";
			$("body").append(s);
			
			$("#psfmenu_"+psfMenuId).find("a").click(function(){
				$(this).parents(".psf_icon_menu").hide();
			});
			
			$(this).attr("psfMenuId",psfMenuId);
			
			$(this).hover(function(){
				var menuId = $(this).attr("psfMenuId");
				var top = $(this).scrollTop()+$(this).offset().top;
				var left = $(this).scrollLeft()+$(this).offset().left;
				var height = $(this).outerHeight(true);
				
				var menu_top = top;
				var menu_left = left;
				if(options.pos=="below") {
					menu_top = top+height;
				} else {
					menu_top = menu_top - 3;
					menu_left= menu_left - 3;
				}
				
				$("#psfmenu_"+menuId).css("left",menu_left+"px");
				$("#psfmenu_"+menuId).css("top",menu_top+"px");
				$(".psf_icon_menu").hide();
				$(".psfmenu").hide();
				$("#psfmenu_"+menuId).fadeIn("fast");
				$("#psfmenu_"+menuId).attr("psfMenuShouldClose","0");
			},function(){
				var menuId = $(this).attr("psfMenuId");
				$("#psfmenu_"+menuId).attr("psfMenuShouldClose","1");
				setTimeout("closePsfMenuTimer('psfmenu_"+menuId+"')",500);
			});
			
			$("#psfmenu_"+psfMenuId).hover(function(){
				$(this).attr("psfMenuShouldClose","0");
			},function(){
				$(this).attr("psfMenuShouldClose","1");
				setTimeout("closePsfMenuTimer('"+this.id+"')",500);
			});
			
			return psfMenuId;
		}
	
	
	});
})(jQuery);







