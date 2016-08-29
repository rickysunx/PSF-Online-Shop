package psf.vo.mall;

import java.io.Serializable;
import java.util.List;

import psf.entity.TPic;
import psf.entity.TProduct;

/**
 * 商品
 * @author 肖慧
 *
 */
public class ProductVO extends TProduct implements Serializable {
	protected String brandname = null;
	protected List<TPic> pics = null;
	protected Integer expCount = null;
	protected String cover = null;	//主图
	
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public List<TPic> getPics() {
		return pics;
	}
	public void setPics(List<TPic> pics) {
		this.pics = pics;
	}
	public Integer getExpCount() {
		return expCount;
	}
	public void setExpCount(Integer expCount) {
		this.expCount = expCount;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
}
