package psf.vo.sns;

import java.io.Serializable;

import psf.entity.TFollowGroup;

public class CheckedFollowGroupVO extends TFollowGroup implements Serializable {
	public boolean checked = false;

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
