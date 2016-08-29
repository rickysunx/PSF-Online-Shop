package psf.vo.sns;

import java.io.Serializable;
import java.math.BigDecimal;

import psf.entity.TApply;

public class WealthVO  implements Serializable {
	
	protected String date = null;
	protected BigDecimal amount = null;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
}
