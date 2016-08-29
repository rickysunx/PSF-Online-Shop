package psf.entity;
public class TProduct extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer pid = null;
	protected java.lang.String pcode = null;
	protected java.lang.String pname = null;
	protected java.lang.String adtitle = null;
	protected java.lang.Integer brandid = null;
	protected java.lang.Integer cateid = null;
	protected java.lang.Integer is_onsale = null;
	protected java.lang.Integer is_promotion = null;
	protected java.math.BigDecimal price = null;
	protected java.math.BigDecimal price_market = null;
	protected java.lang.String goods_thumb = null;
	protected java.lang.String goods_img = null;
	protected java.lang.Long likecount = null;
	protected String [] _fields = new String[]{"pid","pcode","pname","adtitle","brandid","cateid","is_onsale","is_promotion","price","price_market","goods_thumb","goods_img","likecount"};

	public TProduct() {
	}
	public String getTableName() {
		return "t_product";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getPid() {
		return pid;
	}
	public void setPid(java.lang.Integer pid) {
		 this.pid=pid;
	}
	public java.lang.String getPcode() {
		return pcode;
	}
	public void setPcode(java.lang.String pcode) {
		 this.pcode=pcode;
	}
	public java.lang.String getPname() {
		return pname;
	}
	public void setPname(java.lang.String pname) {
		 this.pname=pname;
	}
	public java.lang.String getAdtitle() {
		return adtitle;
	}
	public void setAdtitle(java.lang.String adtitle) {
		 this.adtitle=adtitle;
	}
	public java.lang.Integer getBrandid() {
		return brandid;
	}
	public void setBrandid(java.lang.Integer brandid) {
		 this.brandid=brandid;
	}
	public java.lang.Integer getCateid() {
		return cateid;
	}
	public void setCateid(java.lang.Integer cateid) {
		 this.cateid=cateid;
	}
	public java.lang.Integer getIs_onsale() {
		return is_onsale;
	}
	public void setIs_onsale(java.lang.Integer is_onsale) {
		 this.is_onsale=is_onsale;
	}
	public java.lang.Integer getIs_promotion() {
		return is_promotion;
	}
	public void setIs_promotion(java.lang.Integer is_promotion) {
		 this.is_promotion=is_promotion;
	}
	public java.math.BigDecimal getPrice() {
		return price;
	}
	public void setPrice(java.math.BigDecimal price) {
		 this.price=price;
	}
	public java.math.BigDecimal getPrice_market() {
		return price_market;
	}
	public void setPrice_market(java.math.BigDecimal price_market) {
		 this.price_market=price_market;
	}
	public java.lang.String getGoods_thumb() {
		return goods_thumb;
	}
	public void setGoods_thumb(java.lang.String goods_thumb) {
		 this.goods_thumb=goods_thumb;
	}
	public java.lang.String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(java.lang.String goods_img) {
		 this.goods_img=goods_img;
	}
	public java.lang.Long getLikecount() {
		return likecount;
	}
	public void setLikecount(java.lang.Long likecount) {
		 this.likecount=likecount;
	}
}
