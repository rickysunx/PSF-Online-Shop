package psf.filter;

import psf.PsfFilter;
import psf.action.mall.CartAction;

public class PsfCommonFilter extends PsfFilter {

	public void shortcutLoginString() throws Exception {
		if(!getURI().startsWith("/action")) {
			if(getLoginUserId()==null) {
				set("shortcutLoginString","<a href='/login'>登录</a> | <a href='/reg'>注册</a>" );
			} else {
				set("shortcutLoginString","<span class='shortcut_welcome'>欢迎您，"+getLoginUser().getUsername()+"</span> <a href='/exit_login'>退出登录</a> | <a id='editpwdlink' href='#'>修改密码</a>");
			}
			
			CartAction ca = new CartAction();
			ca.getCartCount();
			
		}
	}
	
	public boolean doFilter() throws Exception {
		shortcutLoginString();
		
		return true;
	}

}
