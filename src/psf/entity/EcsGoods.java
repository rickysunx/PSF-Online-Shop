package psf.entity;
public class EcsGoods extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer cat_id = null;
	protected java.lang.String goods_sn = null;
	protected java.lang.String goods_name = null;
	protected java.lang.String goods_name_style = null;
	protected java.lang.Long click_count = null;
	protected java.lang.Integer brand_id = null;
	protected java.lang.String provider_name = null;
	protected java.lang.Integer goods_number = null;
	protected java.math.BigDecimal goods_weight = null;
	protected java.math.BigDecimal market_price = null;
	protected java.math.BigDecimal shop_price = null;
	protected java.math.BigDecimal promote_price = null;
	protected java.lang.Long promote_start_date = null;
	protected java.lang.Long promote_end_date = null;
	protected java.lang.Integer warn_number = null;
	protected java.lang.String keywords = null;
	protected java.lang.String goods_brief = null;
	protected java.lang.String goods_desc = null;
	protected java.lang.String goods_thumb = null;
	protected java.lang.String goods_img = null;
	protected java.lang.String original_img = null;
	protected java.lang.Integer is_real = null;
	protected java.lang.String extension_code = null;
	protected java.lang.Integer is_on_sale = null;
	protected java.lang.Integer is_alone_sale = null;
	protected java.lang.Integer is_shipping = null;
	protected java.lang.Long integral = null;
	protected java.lang.Long add_time = null;
	protected java.lang.Integer sort_order = null;
	protected java.lang.Integer is_delete = null;
	protected java.lang.Integer is_best = null;
	protected java.lang.Integer is_new = null;
	protected java.lang.Integer is_hot = null;
	protected java.lang.Integer is_promote = null;
	protected java.lang.Integer bonus_type_id = null;
	protected java.lang.Long last_update = null;
	protected java.lang.Integer goods_type = null;
	protected java.lang.String seller_note = null;
	protected java.lang.Integer give_integral = null;
	protected java.lang.Integer rank_integral = null;
	protected java.lang.Integer suppliers_id = null;
	protected java.lang.Integer is_check = null;
	protected java.lang.String suppliers_boss = null;
	protected String [] _fields = new String[]{"goods_id","cat_id","goods_sn","goods_name","goods_name_style","click_count","brand_id","provider_name","goods_number","goods_weight","market_price","shop_price","promote_price","promote_start_date","promote_end_date","warn_number","keywords","goods_brief","goods_desc","goods_thumb","goods_img","original_img","is_real","extension_code","is_on_sale","is_alone_sale","is_shipping","integral","add_time","sort_order","is_delete","is_best","is_new","is_hot","is_promote","bonus_type_id","last_update","goods_type","seller_note","give_integral","rank_integral","suppliers_id","is_check","suppliers_boss"};

	public EcsGoods() {
	}
	public String getTableName() {
		return "ecs_goods";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "goods_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(java.lang.Integer cat_id) {
		 this.cat_id=cat_id;
	}
	public java.lang.String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(java.lang.String goods_sn) {
		 this.goods_sn=goods_sn;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.lang.String getGoods_name_style() {
		return goods_name_style;
	}
	public void setGoods_name_style(java.lang.String goods_name_style) {
		 this.goods_name_style=goods_name_style;
	}
	public java.lang.Long getClick_count() {
		return click_count;
	}
	public void setClick_count(java.lang.Long click_count) {
		 this.click_count=click_count;
	}
	public java.lang.Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(java.lang.Integer brand_id) {
		 this.brand_id=brand_id;
	}
	public java.lang.String getProvider_name() {
		return provider_name;
	}
	public void setProvider_name(java.lang.String provider_name) {
		 this.provider_name=provider_name;
	}
	public java.lang.Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(java.lang.Integer goods_number) {
		 this.goods_number=goods_number;
	}
	public java.math.BigDecimal getGoods_weight() {
		return goods_weight;
	}
	public void setGoods_weight(java.math.BigDecimal goods_weight) {
		 this.goods_weight=goods_weight;
	}
	public java.math.BigDecimal getMarket_price() {
		return market_price;
	}
	public void setMarket_price(java.math.BigDecimal market_price) {
		 this.market_price=market_price;
	}
	public java.math.BigDecimal getShop_price() {
		return shop_price;
	}
	public void setShop_price(java.math.BigDecimal shop_price) {
		 this.shop_price=shop_price;
	}
	public java.math.BigDecimal getPromote_price() {
		return promote_price;
	}
	public void setPromote_price(java.math.BigDecimal promote_price) {
		 this.promote_price=promote_price;
	}
	public java.lang.Long getPromote_start_date() {
		return promote_start_date;
	}
	public void setPromote_start_date(java.lang.Long promote_start_date) {
		 this.promote_start_date=promote_start_date;
	}
	public java.lang.Long getPromote_end_date() {
		return promote_end_date;
	}
	public void setPromote_end_date(java.lang.Long promote_end_date) {
		 this.promote_end_date=promote_end_date;
	}
	public java.lang.Integer getWarn_number() {
		return warn_number;
	}
	public void setWarn_number(java.lang.Integer warn_number) {
		 this.warn_number=warn_number;
	}
	public java.lang.String getKeywords() {
		return keywords;
	}
	public void setKeywords(java.lang.String keywords) {
		 this.keywords=keywords;
	}
	public java.lang.String getGoods_brief() {
		return goods_brief;
	}
	public void setGoods_brief(java.lang.String goods_brief) {
		 this.goods_brief=goods_brief;
	}
	public java.lang.String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(java.lang.String goods_desc) {
		 this.goods_desc=goods_desc;
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
	public java.lang.String getOriginal_img() {
		return original_img;
	}
	public void setOriginal_img(java.lang.String original_img) {
		 this.original_img=original_img;
	}
	public java.lang.Integer getIs_real() {
		return is_real;
	}
	public void setIs_real(java.lang.Integer is_real) {
		 this.is_real=is_real;
	}
	public java.lang.String getExtension_code() {
		return extension_code;
	}
	public void setExtension_code(java.lang.String extension_code) {
		 this.extension_code=extension_code;
	}
	public java.lang.Integer getIs_on_sale() {
		return is_on_sale;
	}
	public void setIs_on_sale(java.lang.Integer is_on_sale) {
		 this.is_on_sale=is_on_sale;
	}
	public java.lang.Integer getIs_alone_sale() {
		return is_alone_sale;
	}
	public void setIs_alone_sale(java.lang.Integer is_alone_sale) {
		 this.is_alone_sale=is_alone_sale;
	}
	public java.lang.Integer getIs_shipping() {
		return is_shipping;
	}
	public void setIs_shipping(java.lang.Integer is_shipping) {
		 this.is_shipping=is_shipping;
	}
	public java.lang.Long getIntegral() {
		return integral;
	}
	public void setIntegral(java.lang.Long integral) {
		 this.integral=integral;
	}
	public java.lang.Long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(java.lang.Long add_time) {
		 this.add_time=add_time;
	}
	public java.lang.Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(java.lang.Integer sort_order) {
		 this.sort_order=sort_order;
	}
	public java.lang.Integer getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(java.lang.Integer is_delete) {
		 this.is_delete=is_delete;
	}
	public java.lang.Integer getIs_best() {
		return is_best;
	}
	public void setIs_best(java.lang.Integer is_best) {
		 this.is_best=is_best;
	}
	public java.lang.Integer getIs_new() {
		return is_new;
	}
	public void setIs_new(java.lang.Integer is_new) {
		 this.is_new=is_new;
	}
	public java.lang.Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(java.lang.Integer is_hot) {
		 this.is_hot=is_hot;
	}
	public java.lang.Integer getIs_promote() {
		return is_promote;
	}
	public void setIs_promote(java.lang.Integer is_promote) {
		 this.is_promote=is_promote;
	}
	public java.lang.Integer getBonus_type_id() {
		return bonus_type_id;
	}
	public void setBonus_type_id(java.lang.Integer bonus_type_id) {
		 this.bonus_type_id=bonus_type_id;
	}
	public java.lang.Long getLast_update() {
		return last_update;
	}
	public void setLast_update(java.lang.Long last_update) {
		 this.last_update=last_update;
	}
	public java.lang.Integer getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(java.lang.Integer goods_type) {
		 this.goods_type=goods_type;
	}
	public java.lang.String getSeller_note() {
		return seller_note;
	}
	public void setSeller_note(java.lang.String seller_note) {
		 this.seller_note=seller_note;
	}
	public java.lang.Integer getGive_integral() {
		return give_integral;
	}
	public void setGive_integral(java.lang.Integer give_integral) {
		 this.give_integral=give_integral;
	}
	public java.lang.Integer getRank_integral() {
		return rank_integral;
	}
	public void setRank_integral(java.lang.Integer rank_integral) {
		 this.rank_integral=rank_integral;
	}
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.lang.Integer getIs_check() {
		return is_check;
	}
	public void setIs_check(java.lang.Integer is_check) {
		 this.is_check=is_check;
	}
	public java.lang.String getSuppliers_boss() {
		return suppliers_boss;
	}
	public void setSuppliers_boss(java.lang.String suppliers_boss) {
		 this.suppliers_boss=suppliers_boss;
	}
}
