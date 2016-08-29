package psf.entity;
public class EcsAdminAction extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer action_id = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.String action_code = null;
	protected java.lang.String relevance = null;
	protected String [] _fields = new String[]{"action_id","parent_id","action_code","relevance"};

	public EcsAdminAction() {
	}
	public String getTableName() {
		return "ecs_admin_action";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "action_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getAction_id() {
		return action_id;
	}
	public void setAction_id(java.lang.Integer action_id) {
		 this.action_id=action_id;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.String getAction_code() {
		return action_code;
	}
	public void setAction_code(java.lang.String action_code) {
		 this.action_code=action_code;
	}
	public java.lang.String getRelevance() {
		return relevance;
	}
	public void setRelevance(java.lang.String relevance) {
		 this.relevance=relevance;
	}
}
