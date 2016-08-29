package psf;

import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import psf.action.mall.CartAction;
import psf.common.PsfIP;
import psf.common.PsfTime;
import psf.entity.TSession;
import psf.entity.TUser;
import psf.framework.ActionContext;
import psf.framework.ActionForward;
import psf.framework.ActionMapping;
import psf.service.common.CommonService;
import psf.service.common.LogService;
import psf.service.common.PicService;
import psf.service.common.UserService;
import psf.service.common.ZoneService;
import psf.service.mall.BrandService;
import psf.service.mall.ProductService;
import psf.service.sns.ApplyService;
import psf.service.sns.CommentService;
import psf.service.sns.EventService;
import psf.service.sns.FollowService;
import psf.service.sns.FriendService;
import psf.service.sns.GroupService;
import psf.service.sns.MsgService;
import psf.service.sns.PostService;
import psf.service.sns.SnsService;
import psf.service.sns.TopicService;

/**
 * Action基类
 * 
 * @author 孙锐
 */
public class PsfAction {

	private HttpServletRequest request = null;
	private HttpServletResponse response = null;
	private ActionMapping mapping = null;
	protected boolean forwardProcessed = false;

	protected CommonService commonService = null;
	protected UserService userService = null;
	protected PicService picService = null;
	protected LogService logService = null;
	protected ZoneService zoneService = null;

	protected BrandService brandService = null;
	protected ProductService productService = null;

	protected ApplyService applyService = null;
	protected CommentService commentService = null;
	protected EventService eventService = null;
	protected FriendService friendService = null;
	protected GroupService groupService = null;
	protected MsgService msgService = null;
	protected PostService postService = null;
	protected SnsService snsService = null;
	protected FollowService followService = null;
	protected TopicService topicService = null;

	public PsfAction() {
		request = ActionContext.currentActionContext().getRequest();
		response = ActionContext.currentActionContext().getResponse();
		mapping = ActionContext.currentActionContext().getMapping();
		initService();
	}

	public void initService() {
		
		commonService = new CommonService();
		
		userService = new UserService();
		picService = new PicService();
		logService = new LogService();
		zoneService = new ZoneService();

		brandService = new BrandService();
		productService = new ProductService();

		applyService = new ApplyService();
		commentService = new CommentService();
		eventService = new EventService();
		friendService = new FriendService();
		groupService = new GroupService();
		msgService = new MsgService();
		postService = new PostService();
		snsService = new SnsService();
		followService = new FollowService();
		topicService = new TopicService();
	}
	
	/*
	public void touchSession() throws Exception {
		String sessionId = getCookieValue(Psf.SessionId_KeyName);
		if(sessionId!=null) {
			commonService.touchSession(sessionId, getHexIP());
		}
	}
	*/
	
	/*
	public PsfItem getSession() throws Exception {
		PsfItem session = null;
		session = (PsfItem)getRequestPsfItem().get("session");
		if(session!=null) return session;		
		
		String sessionId = getCookieValue(Psf.SessionId_KeyName);
		
		if(sessionId!=null) {
			session = commonService.querySession(sessionId, getHexIP());
		}
		if(session==null) {
			Integer now = new PsfTime().getTimeInSeconds();
			sessionId = UUID.randomUUID().toString();
			TSession newSession = new TSession();
			newSession.setAdminid(0);
			newSession.setUid(0);
			newSession.setIp(getHexIP());
			newSession.setLasttime(now);
			newSession.setStarttime(now);
			newSession.setSessionid(sessionId);
			newSession.setValid(1);
			commonService.insertSession(newSession);
			session = commonService.querySession(sessionId, getHexIP());
			setCookieValue(Psf.SessionId_KeyName, sessionId);
		}
		
		getRequestPsfItem().put("session", session);
		
		return session;
	}
	*/
	
	public PsfItem getRequestPsfItem() throws Exception {
		PsfItem requestPsfItem = (PsfItem)get("requestPsfItem");
		if(requestPsfItem==null) {
			requestPsfItem = new PsfItem();
			set("requestPsfItem",requestPsfItem);
		}
		return requestPsfItem;
	}

	protected TUser getLoginUser() throws Exception {
		int uid = getLoginUserId();
		if (uid == 0)
			return null;
		return userService.queryUserByID(uid);
	}
	
	protected String getCookieValue(String key) throws Exception {
		Cookie [] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie c:cookies) {
				String name = c.getName();
				if(key.equals(name)) {
					return c.getValue();
				}
			}
		}
		return null;
	}
	
	protected void setCookieValue(String key,String value) throws Exception {
		Cookie c = new Cookie(key,value);
		c.setPath("/");
		response.addCookie(c);
	}
	
	protected HttpSession getSession() throws Exception {
		return request.getSession();
	}

	protected Integer getLoginUserId() throws Exception {		
		Integer uid = (Integer)getSession().getAttribute("loginPsfUid");
		if(uid==null || uid==0) uid = null;
		set("loginPsfUid",uid);
		return uid;
	}
	

	protected void setLoginUserId(Integer uid) throws Exception {		
//		PsfItem session = getSession();
//		if(uid==null || uid==0) {
//			commonService.invalidSession(session.getString("sessionid"), getHexIP());
//		} else {
//			commonService.updateSessionUid(uid, session.getString("sessionid"), getHexIP());
//		}
		getSession().setAttribute("loginPsfUid", uid);
		set("loginPsfUid",uid);
		
		CartAction ca = new CartAction();
		ca.updateToUserCart();
	}

	protected String getIP() {
		return request.getRemoteHost();
	}

	protected String getHexIP() throws Exception {
		return PsfIP.ip2hex(getIP());
	}

	protected String getURI() {
		return request.getRequestURI();
	}

	protected String p(String name) {
		return request.getParameter(name);
	}

	protected String[] ps(String name) {
		return request.getParameterValues(name);
	}

	protected Integer[] ps2int(String name) throws Exception {
		String[] values = request.getParameterValues(name);
		if (values == null)
			return null;
		Integer[] ints = new Integer[values.length];
		for (int i = 0; i < ints.length; i++) {
			String s = values[i];
			ints[i] = (s == null ? null : Integer.parseInt(s));
		}
		return ints;
	}

	protected Integer p2int(String name) throws Exception {
		String v = request.getParameter(name);
		if ((v == null) || (v.trim().length() == 0))
			return null;
		try {
			return Integer.parseInt(v);
		} catch (Exception e) {
			return null;
		}
	}

	protected void set(String name, Object o) throws Exception {
		request.setAttribute(name, o);
	}
	
	protected Object get(String name) throws Exception {
		return request.getAttribute(name);
	}
	
	protected PrintWriter getOut() throws Exception {
		return response.getWriter();
	}

	protected void forward(String name) throws Exception {
		ActionForward forward = mapping.getForward(name);
		String result = forward.getResult();
		String page = forward.getPage();
		if (result != null && result.equalsIgnoreCase("json")) {
			handleJsonResponse();
		} else {
			if (forward.isRedirect()) {
				response.sendRedirect(page);
			} else {
				request.getRequestDispatcher("/WEB-INF/pages" + page).forward(request, response);
			}
		}
		setForwardProcessed(true);
	}
	
	public void rollback() throws Exception {
		ActionContext ac = ActionContext.currentActionContext();
		if(ac.mapping.isTrasaction() && ac.sqlmap!=null) ac.sqlmap.endTransaction();
		if(ac.mapping.isTrasaction() && ac.sqlmap!=null && ac.sqlmap.getCurrentConnection()!=null) ac.sqlmap.getCurrentConnection().rollback();
		if(ac.mapping.isTrasaction() && ac.sqlmap!=null) ac.sqlmap.startTransaction();
	}

	public void forwardDefault() throws Exception {
		String forward = mapping.getForward();
		String result = mapping.getResult();
		if (result != null && result.equalsIgnoreCase("json")) {
			handleJsonResponse();
		} else {
			if(forward!=null) {
				if (mapping.isRedirect()) {
					response.sendRedirect(forward);
				} else {
					request.getRequestDispatcher("/WEB-INF/pages" + forward).forward(request, response);
				}
			}
		}
		setForwardProcessed(true);
	}

	protected void handleJsonResponse() throws Exception {
		JSONObject json = new JSONObject();
		Enumeration en = request.getAttributeNames();
		while (en.hasMoreElements()) {
			String name = (String) en.nextElement();
			if(name.equals("loginPsfUid")||name.equals("requestPsfItem")) {
				
			} else {
				json.accumulate(name, get(name));
			}
		}
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		setForwardProcessed(true);
	}

	protected void handleJsonResponse(String[] names) throws Exception {
		JSONObject json = new JSONObject();
		for (String name : names) {
			json.accumulate(name, get(name));
		}
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		setForwardProcessed(true);
	}

	public boolean isForwardProcessed() {
		return forwardProcessed;
	}

	protected void setForwardProcessed(boolean forwardProcessed) {
		this.forwardProcessed = forwardProcessed;
	}
	
	protected void sendError(int errCode) throws Exception {
		response.sendError(errCode);
		setForwardProcessed(true);
	}
	
	protected void sendRedirect(String url) throws Exception {
		response.sendRedirect(url);
		setForwardProcessed(true);
	}
}
