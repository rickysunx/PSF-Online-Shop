package psf.entity;
public class EcsGoodsActivity extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer act_id = null;
	protected java.lang.String act_name = null;
	protected java.lang.String act_desc = null;
	protected java.lang.Integer act_type = null;
	protected java.lang.Integer goods_id = null;
	protected java.lang.Integer product_id = null;
	protected java.lang.String goods_name = null;
	protected java.lang.Long start_time = null;
	protected java.lang.Long end_time = null;
	protected java.lang.Integer is_finished = null;
	protected java.lang.String ext_info = null;
	protected String [] _fields = new String[]{"act_id","act_name","act_desc","act_type","goods_id","product_id","goods_name","start_time","end_time","is_finished","ext_info"};

	public EcsGoodsActivity() {
	}
	public String getTableName() {
		return "ecs_goods_activity";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "act_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAct_id() {
		return act_id;
	}
	public void setAct_id(java.lang.Integer act_id) {
		 this.act_id=act_id;
	}
	public java.lang.String getAct_name() {
		return act_name;
	}
	public void setAct_name(java.lang.String act_name) {
		 this.act_name=act_name;
	}
	public java.lang.String getAct_desc() {
		return act_desc;
	}
	public void setAct_desc(java.lang.String act_desc) {
		 this.act_desc=act_desc;
	}
	public java.lang.Integer getAct_type() {
		return act_type;
	}
	public void setAct_type(java.lang.Integer act_type) {
		 this.act_type=act_type;
	}
	public java.lang.Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(java.lang.Integer goods_id) {
		 this.goods_id=goods_id;
	}
	public java.lang.Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(java.lang.Integer product_id) {
		 this.product_id=product_id;
	}
	public java.lang.String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(java.lang.String goods_name) {
		 this.goods_name=goods_name;
	}
	public java.lang.Long getStart_time() {
		return start_time;
	}
	public void setStart_time(java.lang.Long start_time) {
		 this.start_time=start_time;
	}
	public java.lang.Long getEnd_time() {
		return end_time;
	}
	public void setEnd_time(java.lang.Long end_time) {
		 this.end_time=end_time;
	}
	public java.lang.Integer getIs_finished() {
		return is_finished;
	}
	public void setIs_finished(java.lang.Integer is_finished) {
		 this.is_finished=is_finished;
	}
	public java.lang.String getExt_info() {
		return ext_info;
	}
	public void setExt_info(java.lang.String ext_info) {
		 this.ext_info=ext_info;
	}
}
