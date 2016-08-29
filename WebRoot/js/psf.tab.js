(function($) {
	$.fn.extend({
		psfTab:function(list,fun){
			this.click(function(){
				$(this).attr("className","current").siblings().attr("className","");
				list.hide();
				$(list[$(this).index()]).show();
				if(fun!=undefined){fun.call(this,list[$(this).index()])}
				
			});
		}
	
	})
})(jQuery)