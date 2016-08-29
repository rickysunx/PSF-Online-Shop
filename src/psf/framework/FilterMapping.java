package psf.framework;

import java.io.Serializable;

public class FilterMapping implements Serializable {
	protected String url = null;
	protected String theClass = null;
	protected boolean starEnd = false;
	
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
	public boolean isStarEnd() {
		return starEnd;
	}
	public void setStarEnd(boolean starEnd) {
		this.starEnd = starEnd;
	}
	
}
