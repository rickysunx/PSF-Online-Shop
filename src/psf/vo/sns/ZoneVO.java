package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

public class ZoneVO implements Serializable {
	protected Integer zoneid = null;
	protected Integer parentid = null;
	protected String zonename = null;
	protected List<ZoneVO> children = null;
	
	public Integer getZoneid() {
		return zoneid;
	}
	public String getZonename() {
		return zonename;
	}
	public List<ZoneVO> getChildren() {
		return children;
	}
	public void setZoneid(Integer zoneid) {
		this.zoneid = zoneid;
	}
	public void setZonename(String zonename) {
		this.zonename = zonename;
	}
	public void setChildren(List<ZoneVO> children) {
		this.children = children;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	
	
}
