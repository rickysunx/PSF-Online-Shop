package psf.entity;
public class TIntroduce extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer introid = null;
	protected java.lang.Integer uid = null;
	protected java.lang.Integer fromuid = null;
	protected java.lang.Integer touid = null;
	protected java.lang.String introcontent = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer delbysender = null;
	protected java.lang.Integer delbyreader = null;
	protected String [] _fields = new String[]{"introid","uid","fromuid","touid","introcontent","addtime","delbysender","delbyreader"};

	public TIntroduce() {
	}
	public String getTableName() {
		return "t_introduce";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "introid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getIntroid() {
		return introid;
	}
	public void setIntroid(java.lang.Integer introid) {
		 this.introid=introid;
	}
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.Integer getFromuid() {
		return fromuid;
	}
	public void setFromuid(java.lang.Integer fromuid) {
		 this.fromuid=fromuid;
	}
	public java.lang.Integer getTouid() {
		return touid;
	}
	public void setTouid(java.lang.Integer touid) {
		 this.touid=touid;
	}
	public java.lang.String getIntrocontent() {
		return introcontent;
	}
	public void setIntrocontent(java.lang.String introcontent) {
		 this.introcontent=introcontent;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.Integer getDelbysender() {
		return delbysender;
	}
	public void setDelbysender(java.lang.Integer delbysender) {
		 this.delbysender=delbysender;
	}
	public java.lang.Integer getDelbyreader() {
		return delbyreader;
	}
	public void setDelbyreader(java.lang.Integer delbyreader) {
		 this.delbyreader=delbyreader;
	}
}
