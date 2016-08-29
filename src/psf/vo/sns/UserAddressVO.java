package psf.vo.sns;

import java.io.Serializable;

import psf.entity.TUserAddress;

public class UserAddressVO extends TUserAddress implements Serializable {

	protected String zoneName = null;
	protected Integer parentZoneid = null;

	public String getZoneName() {
		return zoneName;
	}

	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}

	public Integer getParentZoneid() {
		return parentZoneid;
	}

	public void setParentZoneid(Integer parentZoneid) {
		this.parentZoneid = parentZoneid;
	}
	
	
}
