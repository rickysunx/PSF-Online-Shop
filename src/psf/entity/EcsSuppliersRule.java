package psf.entity;
public class EcsSuppliersRule extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer rule_id = null;
	protected java.lang.Integer suppliers_id = null;
	protected java.math.BigDecimal rule_start = null;
	protected java.math.BigDecimal rule_end = null;
	protected java.lang.Float rule_rate = null;
	protected String [] _fields = new String[]{"rule_id","suppliers_id","rule_start","rule_end","rule_rate"};

	public EcsSuppliersRule() {
	}
	public String getTableName() {
		return "ecs_suppliers_rule";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "rule_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getRule_id() {
		return rule_id;
	}
	public void setRule_id(java.lang.Integer rule_id) {
		 this.rule_id=rule_id;
	}
	public java.lang.Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(java.lang.Integer suppliers_id) {
		 this.suppliers_id=suppliers_id;
	}
	public java.math.BigDecimal getRule_start() {
		return rule_start;
	}
	public void setRule_start(java.math.BigDecimal rule_start) {
		 this.rule_start=rule_start;
	}
	public java.math.BigDecimal getRule_end() {
		return rule_end;
	}
	public void setRule_end(java.math.BigDecimal rule_end) {
		 this.rule_end=rule_end;
	}
	public java.lang.Float getRule_rate() {
		return rule_rate;
	}
	public void setRule_rate(java.lang.Float rule_rate) {
		 this.rule_rate=rule_rate;
	}
}
