package psf.entity;
public class TMsg extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer msgid = null;
	protected java.lang.Integer msgfrom = null;
	protected java.lang.Integer msgto = null;
	protected java.lang.Integer addtime = null;
	protected java.lang.Integer isread = null;
	protected java.lang.Integer delbysender = null;
	protected java.lang.Integer delbyreader = null;
	protected java.lang.String msgcontent = null;
	protected String [] _fields = new String[]{"msgid","msgfrom","msgto","addtime","isread","delbysender","delbyreader","msgcontent"};

	public TMsg() {
	}
	public String getTableName() {
		return "t_msg";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "msgid";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getMsgid() {
		return msgid;
	}
	public void setMsgid(java.lang.Integer msgid) {
		 this.msgid=msgid;
	}
	public java.lang.Integer getMsgfrom() {
		return msgfrom;
	}
	public void setMsgfrom(java.lang.Integer msgfrom) {
		 this.msgfrom=msgfrom;
	}
	public java.lang.Integer getMsgto() {
		return msgto;
	}
	public void setMsgto(java.lang.Integer msgto) {
		 this.msgto=msgto;
	}
	public java.lang.Integer getAddtime() {
		return addtime;
	}
	public void setAddtime(java.lang.Integer addtime) {
		 this.addtime=addtime;
	}
	public java.lang.Integer getIsread() {
		return isread;
	}
	public void setIsread(java.lang.Integer isread) {
		 this.isread=isread;
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
	public java.lang.String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(java.lang.String msgcontent) {
		 this.msgcontent=msgcontent;
	}
}
