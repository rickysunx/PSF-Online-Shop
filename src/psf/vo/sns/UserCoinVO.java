package psf.vo.sns;

import java.io.Serializable;
import java.math.BigDecimal;

import psf.entity.TApply;
import psf.entity.TUserCoin;

public class UserCoinVO extends TUserCoin implements Serializable {
	
	protected String pname = null;
	protected String productPic = null;
	protected String type = null; //收入，支出 
	protected BigDecimal balance = null;
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	
	
	
}
