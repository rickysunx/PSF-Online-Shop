package psf.framework;

import java.io.Serializable;
import java.sql.Timestamp;

public class BasicEntity implements Serializable {
	protected Timestamp ts = null;

	public Timestamp getTs() {
		return ts;
	}

	public void setTs(Timestamp ts) {
		this.ts = ts;
	}
	
}
