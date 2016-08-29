package psf.action.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;


import psf.Psf;
import psf.PsfAction;
import psf.common.PsfImage;
import psf.common.PsfTime;
import psf.entity.EcsUsers;
import psf.entity.TGroupMember;
import psf.entity.TInviteCode;
import psf.entity.TUser;
import psf.entity.TUser0;
import psf.entity.TUserBalance;
import psf.framework.ActionContext;
import psf.framework.PsfException;

public class PassportAction extends PsfAction {
	public void login() throws Exception {
		
	}
	
	public void reg() throws Exception {
		Integer uid = p2int("uid");
		Integer groupid = p2int("groupid");
		String code = p("code");
		
		set("uid",uid);
		set("groupid",groupid);
		set("code",code);
	}
	public void regCheckUsername() throws Exception {
		try{
			String username = p("username");
			Boolean usernameExists = userService.usernameExists(null, username);	
			if(usernameExists){
				set("success",0);
				set("info","该昵称已被占用，请更换");
			}  else {
				set("success",1);
				set("info","昵称可用");
			}
		} catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}	
	public void regCheckEmail() throws Exception {
		try{
			String email = p("email");
			Boolean emailExists = userService.emailExists(null, email);
			if(emailExists) {
				set("success",0);
				set("info","此邮箱已被注册，请更换邮箱");
			} else {
				set("success",1);
				set("info","邮箱可用");
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void regSave() throws Exception {
		try{
			String email = p("email");
			String password = p("password");
			String username = p("username");
			String phone = p("phone");
			String yzm = p("yzm");
			Integer introuid = p2int("uid");
			Integer groupid = p2int("groupid");
			String code = p("code");
			
			String captcha = (String)getSession().getAttribute("captcha");
			if(captcha==null) {
				throw new Exception ("请获取验证码");
			}


			Boolean usernameExists = userService.usernameExists(null, username);	
			Boolean emailExists = userService.emailExists(null, email);

			
			if(!yzm.equalsIgnoreCase(captcha)){
				set("success",4);
				new PsfException();
			} else {
				if(usernameExists && emailExists){
					set("success",0);
					new PsfException();
				} else if(emailExists || usernameExists) {
					if(usernameExists){
						set("success",1);
						new PsfException();
					} else if(emailExists) {
						set("success",2);
						new PsfException();
					}	
				} else {
					EcsUsers users = new EcsUsers();
					users.setAddress_id(0);
					users.setAnswer("1");
					users.setEmail(email);
					users.setFlag(0);
					users.setFrozen_money(new BigDecimal(0));
					users.setIs_special(0);
					users.setIs_validated(0);
					users.setMobile_phone(phone);
					users.setParent_id(0);
					users.setPassword(password);
					users.setPay_points(new Long(0));
					users.setQuestion("1");
					users.setRank_points(new Long(0));
					users.setReg_time(new Long(new PsfTime().getTimeInSeconds()));
					users.setSalt("1");
					users.setSex(1);
					users.setUser_money(new BigDecimal(0));
					users.setUser_name(username);
					users.setUser_rank(0);
					users.setVisit_count(0);				
					int uid = userService.addEcsUsers(users);
					
					TUser0 user = new TUser0();
					user.setUid(uid);
					user.setAp_email(0);
					user.setAp_industry(0);
					user.setAp_msg(1);
					user.setAp_wealth(1);
					user.setAp_wealthtype(1);
					user.setRegip(getHexIP());
					user.setRegtime(new PsfTime().getTimeInSeconds());
					user.setSex(0);
					user.setSnsstatus(0);
					userService.addTUser(user);
					
					TUserBalance balance = new TUserBalance();
					balance.setBlogcount(0);
					balance.setCash(new BigDecimal(0));
					balance.setCoins(new BigDecimal(0));
					balance.setCoupon(new BigDecimal(0));
					balance.setExps(new BigDecimal(0));
					balance.setFans(0);
					balance.setFollows(0);
					balance.setFriends(0);
					balance.setGroupcount(0);
					balance.setGroupfriends(0);
					balance.setGuidecount(0);
					balance.setMedal(0);
					balance.setPoints(new BigDecimal(0));
					balance.setShopexpcount(0);
					balance.setShowcount(0);
					balance.setVisitcount(0);
					balance.setUid(uid);
					userService.addBalance(balance);
					
					setLoginUserId(uid);
					
					set("success",3);	
					set("info",1);
					
					if(introuid != null && code != null){
						if(groupid == null){
							TInviteCode ic = snsService.queryInviteCode(code, 0, Psf.OTYPE_Friend, introuid);
							if(ic != null){
								friendService.addFriend(uid,introuid,0);
								friendService.addFriend(introuid,uid,0);
								followService.addFollow(uid, introuid, 0);
								followService.addFollow(introuid, uid, 0);
								set("success",3);	
								set("info",2);
							}
						} else {
							TInviteCode ic = snsService.queryInviteCode(code, groupid, Psf.OTYPE_Group, introuid);
							if(ic != null){
								TGroupMember gm = new TGroupMember();
								gm.setAddtime(new PsfTime().getTimeInSeconds());
								gm.setGroupid(groupid);
								gm.setUid(uid);
								gm.setRole(0);
								gm.setPostcount(0);
								groupService.addGroupMember(gm);
								groupService.updateMemberCount(groupid);
								set("success",3);	
								set("info",3);
								set("groupid",groupid);
							}
						}
						
					} 
			
				}	
			}		
		}catch(Exception e){
			set("success",5);
			set("info",e.getMessage());
		}
	}
	public void autoAddFriend() throws Exception {
		
	}
	public void exitLogin() throws Exception {
		setLoginUserId(null);
	}
	
	protected static char [] captchChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
	
	protected String getCaptchaText() throws Exception {
		int len = 4;
		String text = "";
		for(int i=0;i<len;i++) {
			text+= captchChars[getRandom(captchChars.length)];
		}
		return text;
	}
	
	public int getRandomSigned(int n) throws Exception {
		int v = (int)((Math.random()-0.5d)*(double)n+1000.0d)%n;
		return v;
	}
	
	public int getRandom(int n) throws Exception {
		int v = (int)(Math.random()*(double)n+1000.0d)%n;
		return v;
	}
	
	public void captcha() throws Exception {
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		
		
		String text = getCaptchaText();
		
		getSession().setAttribute("captcha", text);
		
		int w = 80;
		int h = 22;
		BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = (Graphics2D) image.getGraphics();
		g2d.setColor(new Color(213,228,253));
		g2d.fillRect(0, 0, w, h);
		g2d.setColor(new Color(27,119,225));
		g2d.setFont(new Font("Arial", Font.BOLD, 16));
		int len = text.length();
		for(int i=0;i<len;i++) {
			Color c = new Color(getRandom(128),getRandom(128),getRandom(128));
			g2d.setColor(c);
			int w1 = getRandomSigned(12);
			int h1 = getRandomSigned(5)+15;
			g2d.drawString(text.substring(i, i+1), 10+i*15+w1, h1);
		}
		
		
		PsfImage img = new PsfImage(image);
		response.setContentType("image/jpeg");
		response.getOutputStream().write(img.getBytes());
		
		
	}
	
	public void loginCheck() throws Exception {
		String username = p("username");
		String userpass = p("userpass");
		
		set("success",0);
		
		TUser theUser1 = userService.queryUserByName(username);
		TUser theUser2 = userService.queryUserByEamil(username);
		TUser theUser3 = userService.queryUserByPhone(username);

		if(theUser1==null && theUser2==null && theUser3==null) {
			set("info","用户不存在");
		} else {
			if(theUser1!=null && theUser1.getUserpass().equals(userpass)){
				set("success",1);
				setLoginUserId(theUser1.getUid());
			} else if(theUser2!=null && theUser2.getUserpass().equals(userpass)){
				set("success",1);
				setLoginUserId(theUser2.getUid());
			} else if(theUser3!=null && theUser3.getUserpass().equals(userpass)){
				set("success",1);
				setLoginUserId(theUser3.getUid());
			} else {
				set("info","密码不正确");
			}
		}
	
	}
	
	public void checkNowPassword() throws Exception {
		try{
			Integer uid = getLoginUserId();
			String password = p("password");
			if(uid == null){
				set("success",0);
				set("info","请先登录");
			} else {
				TUser user = userService.queryUserByID(uid);
				if(user.getUserpass().equals(password)){
					set("success",1);
				} else{
					set("success",0);
					set("info","当前密码错误");
				}
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void updatePassword() throws Exception{
		try{
			Integer uid = getLoginUserId();
			String password = p("password");
			if(uid == null){
				set("success",0);
				set("info","先登录再修改密码");
			} else {
				userService.updateUserPass(uid, password);
			}
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	

	
	
}
