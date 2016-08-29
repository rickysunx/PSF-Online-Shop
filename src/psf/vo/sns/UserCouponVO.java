package psf.vo.sns;

import java.io.Serializable;
import java.math.BigDecimal;
import psf.entity.TUserCoupon;

public class UserCouponVO extends TUserCoupon implements Serializable {
	
	protected String startTime = null;
	protected String endTime = null;
	protected BigDecimal amountType = null; //优惠券类型（5元，10元 等）
	protected BigDecimal sumAmount = null;	//一种类型优惠券的总金额
	protected Integer count = null; //一种类型优惠券的张数
	protected BigDecimal sumAllAmount = null; //所有优惠券总共金额
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public BigDecimal getAmountType() {
		return amountType;
	}
	public void setAmountType(BigDecimal amountType) {
		this.amountType = amountType;
	}
	public BigDecimal getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(BigDecimal sumAmount) {
		this.sumAmount = sumAmount;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public BigDecimal getSumAllAmount() {
		return sumAllAmount;
	}
	public void setSumAllAmount(BigDecimal sumAllAmount) {
		this.sumAllAmount = sumAllAmount;
	}

}
