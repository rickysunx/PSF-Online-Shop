package psf.vo.sns;

import java.io.Serializable;
import java.math.BigDecimal;
import psf.entity.TUserPoint;

public class UserPointVO extends TUserPoint implements Serializable {
	
	protected String time = null;
	protected BigDecimal getPoint = null; 	//获取积分
	protected BigDecimal expPoint = null;	//消耗积分
	protected String expInfo = null;		//消耗详情
	
	public String getExpInfo() {
		return expInfo;
	}
	public void setExpInfo(String expInfo) {
		this.expInfo = expInfo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public BigDecimal getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(BigDecimal getPoint) {
		this.getPoint = getPoint;
	}
	public BigDecimal getExpPoint() {
		return expPoint;
	}
	public void setExpPoint(BigDecimal expPoint) {
		this.expPoint = expPoint;
	}

}
