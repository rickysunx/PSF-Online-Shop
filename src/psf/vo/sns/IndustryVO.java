package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

public class IndustryVO implements Serializable {
	protected Integer industryid = null;
	protected String industryname = null;
	protected Integer parentid = null;
	protected List<IndustryVO> children = null;
	
	public Integer getIndustryid() {
		return industryid;
	}
	public void setIndustryid(Integer industryid) {
		this.industryid = industryid;
	}
	public String getIndustryname() {
		return industryname;
	}
	public void setIndustryname(String industryname) {
		this.industryname = industryname;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public List<IndustryVO> getChildren() {
		return children;
	}
	public void setChildren(List<IndustryVO> children) {
		this.children = children;
	}	
	
}
