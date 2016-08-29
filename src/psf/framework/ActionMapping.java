package psf.framework;

import java.io.Serializable;
import java.util.Map;
import java.util.TreeMap;

public class ActionMapping implements Serializable {
	protected String url = null;
	protected String theClass = null;
	protected String result = null;
	protected String method = null;
	protected String forward = null;
	protected boolean trasaction = true;
	protected boolean redirect = false;
	
	protected Map<String,ActionForward> mapForward = new TreeMap<String,ActionForward>();

	public void putForward(String forwardName,ActionForward forward) {
		mapForward.put(forwardName, forward);
	}
	
	public ActionForward getForward(String forwardName) {
		return mapForward.get(forwardName);
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTheClass() {
		return theClass;
	}

	public void setTheClass(String theClass) {
		this.theClass = theClass;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public Map<String, ActionForward> getMapForward() {
		return mapForward;
	}

	public void setMapForward(Map<String, ActionForward> mapForward) {
		this.mapForward = mapForward;
	}

	public boolean isTrasaction() {
		return trasaction;
	}

	public void setTrasaction(boolean trasaction) {
		this.trasaction = trasaction;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
}
