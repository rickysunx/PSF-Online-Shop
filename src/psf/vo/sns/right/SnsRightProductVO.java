package psf.vo.sns.right;

import java.io.Serializable;
import java.math.BigDecimal;

import psf.entity.TPic;
import psf.service.common.PicService;

/**
 * 右侧通用商品对象，包括热门秀场商品、热门体验商品、热门指南商品，你可能喜欢的商品等。
 * @author 肖慧
 *
 */
public class SnsRightProductVO implements Serializable {
	protected Integer pid = null;
	protected String pcode = null;

	protected String pname = null;
	protected BigDecimal price = null;
	
	protected BigDecimal price_market = null;
	protected Integer likecount = null;
	protected Integer showCount = null;
	protected Integer shopexpCount = null;
	protected Integer points = null;	//商品的品点数
	
	protected String goods_thumb = null;
	protected String goods_img = null;
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getPrice_market() {
		return price_market;
	}
	public void setPrice_market(BigDecimal price_market) {
		this.price_market = price_market;
	}
	public Integer getLikecount() {
		return likecount;
	}
	public void setLikecount(Integer likecount) {
		this.likecount = likecount;
	}
	public Integer getShowCount() {
		return showCount;
	}
	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}
	public Integer getShopexpCount() {
		return shopexpCount;
	}
	public void setShopexpCount(Integer shopexpCount) {
		this.shopexpCount = shopexpCount;
	}
	public Integer getPoints() {
		return points;
	}
	public void setPoints(Integer points) {
		this.points = points;
	}
	public String getGoods_thumb() {
		return goods_thumb;
	}
	public void setGoods_thumb(String goods_thumb) {
		this.goods_thumb = goods_thumb;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
}
