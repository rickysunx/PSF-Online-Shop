package psf.entity;
public class EcsRegFields extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer id = null;
	protected java.lang.String reg_field_name = null;
	protected java.lang.Integer dis_order = null;
	protected java.lang.Integer display = null;
	protected java.lang.Integer type = null;
	protected java.lang.Integer is_need = null;
	protected String [] _fields = new String[]{"id","reg_field_name","dis_order","display","type","is_need"};

	public EcsRegFields() {
	}
	public String getTableName() {
		return "ecs_reg_fields";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getId() {
		return id;
	}
	public void setId(java.lang.Integer id) {
		 this.id=id;
	}
	public java.lang.String getReg_field_name() {
		return reg_field_name;
	}
	public void setReg_field_name(java.lang.String reg_field_name) {
		 this.reg_field_name=reg_field_name;
	}
	public java.lang.Integer getDis_order() {
		return dis_order;
	}
	public void setDis_order(java.lang.Integer dis_order) {
		 this.dis_order=dis_order;
	}
	public java.lang.Integer getDisplay() {
		return display;
	}
	public void setDisplay(java.lang.Integer display) {
		 this.display=display;
	}
	public java.lang.Integer getType() {
		return type;
	}
	public void setType(java.lang.Integer type) {
		 this.type=type;
	}
	public java.lang.Integer getIs_need() {
		return is_need;
	}
	public void setIs_need(java.lang.Integer is_need) {
		 this.is_need=is_need;
	}
}
