package psf.entity;
public class TUser extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer uid = null;
	protected java.lang.String username = null;
	protected java.lang.String userpass = null;
	protected java.lang.Integer sex = null;
	protected java.lang.String email = null;
	protected java.lang.String signature = null;
	protected java.lang.Integer avatarid = null;
	protected java.lang.String mobile = null;
	protected java.lang.Integer nowzoneid = null;
	protected java.lang.Integer homezoneid = null;
	protected java.lang.String realname = null;
	protected java.lang.String birthday = null;
	protected java.lang.Integer regtime = null;
	protected java.lang.String regip = null;
	protected java.lang.Integer snsstatus = null;
	protected java.lang.Integer idcardtype = null;
	protected java.lang.String idcardno = null;
	protected java.lang.String qq = null;
	protected java.lang.Integer industryid = null;
	protected java.lang.Integer ap_email = null;
	protected java.lang.Integer ap_sex = null;
	protected java.lang.Integer ap_mobile = null;
	protected java.lang.Integer ap_qq = null;
	protected java.lang.Integer ap_msn = null;
	protected java.lang.Integer ap_industry = null;
	protected java.lang.Integer ap_wealth = null;
	protected java.lang.Integer ap_wealthtype = null;
	protected java.lang.Integer ap_msg = null;
	protected java.lang.Integer sealflag = null;
	protected String [] _fields = new String[]{"uid","username","userpass","sex","email","signature","avatarid","mobile","nowzoneid","homezoneid","realname","birthday","regtime","regip","snsstatus","idcardtype","idcardno","qq","industryid","ap_email","ap_sex","ap_mobile","ap_qq","ap_msn","ap_industry","ap_wealth","ap_wealthtype","ap_msg","sealflag"};

	public TUser() {
	}
	public String getTableName() {
		return "t_user";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		 this.uid=uid;
	}
	public java.lang.String getUsername() {
		return username;
	}
	public void setUsername(java.lang.String username) {
		 this.username=username;
	}
	public java.lang.String getUserpass() {
		return userpass;
	}
	public void setUserpass(java.lang.String userpass) {
		 this.userpass=userpass;
	}
	public java.lang.Integer getSex() {
		return sex;
	}
	public void setSex(java.lang.Integer sex) {
		 this.sex=sex;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getSignature() {
		return signature;
	}
	public void setSignature(java.lang.String signature) {
		 this.signature=signature;
	}
	public java.lang.Integer getAvatarid() {
		return avatarid;
	}
	public void setAvatarid(java.lang.Integer avatarid) {
		 this.avatarid=avatarid;
	}
	public java.lang.String getMobile() {
		return mobile;
	}
	public void setMobile(java.lang.String mobile) {
		 this.mobile=mobile;
	}
	public java.lang.Integer getNowzoneid() {
		return nowzoneid;
	}
	public void setNowzoneid(java.lang.Integer nowzoneid) {
		 this.nowzoneid=nowzoneid;
	}
	public java.lang.Integer getHomezoneid() {
		return homezoneid;
	}
	public void setHomezoneid(java.lang.Integer homezoneid) {
		 this.homezoneid=homezoneid;
	}
	public java.lang.String getRealname() {
		return realname;
	}
	public void setRealname(java.lang.String realname) {
		 this.realname=realname;
	}
	public java.lang.String getBirthday() {
		return birthday;
	}
	public void setBirthday(java.lang.String birthday) {
		 this.birthday=birthday;
	}
	public java.lang.Integer getRegtime() {
		return regtime;
	}
	public void setRegtime(java.lang.Integer regtime) {
		 this.regtime=regtime;
	}
	public java.lang.String getRegip() {
		return regip;
	}
	public void setRegip(java.lang.String regip) {
		 this.regip=regip;
	}
	public java.lang.Integer getSnsstatus() {
		return snsstatus;
	}
	public void setSnsstatus(java.lang.Integer snsstatus) {
		 this.snsstatus=snsstatus;
	}
	public java.lang.Integer getIdcardtype() {
		return idcardtype;
	}
	public void setIdcardtype(java.lang.Integer idcardtype) {
		 this.idcardtype=idcardtype;
	}
	public java.lang.String getIdcardno() {
		return idcardno;
	}
	public void setIdcardno(java.lang.String idcardno) {
		 this.idcardno=idcardno;
	}
	public java.lang.String getQq() {
		return qq;
	}
	public void setQq(java.lang.String qq) {
		 this.qq=qq;
	}
	public java.lang.Integer getIndustryid() {
		return industryid;
	}
	public void setIndustryid(java.lang.Integer industryid) {
		 this.industryid=industryid;
	}
	public java.lang.Integer getAp_email() {
		return ap_email;
	}
	public void setAp_email(java.lang.Integer ap_email) {
		 this.ap_email=ap_email;
	}
	public java.lang.Integer getAp_sex() {
		return ap_sex;
	}
	public void setAp_sex(java.lang.Integer ap_sex) {
		 this.ap_sex=ap_sex;
	}
	public java.lang.Integer getAp_mobile() {
		return ap_mobile;
	}
	public void setAp_mobile(java.lang.Integer ap_mobile) {
		 this.ap_mobile=ap_mobile;
	}
	public java.lang.Integer getAp_qq() {
		return ap_qq;
	}
	public void setAp_qq(java.lang.Integer ap_qq) {
		 this.ap_qq=ap_qq;
	}
	public java.lang.Integer getAp_msn() {
		return ap_msn;
	}
	public void setAp_msn(java.lang.Integer ap_msn) {
		 this.ap_msn=ap_msn;
	}
	public java.lang.Integer getAp_industry() {
		return ap_industry;
	}
	public void setAp_industry(java.lang.Integer ap_industry) {
		 this.ap_industry=ap_industry;
	}
	public java.lang.Integer getAp_wealth() {
		return ap_wealth;
	}
	public void setAp_wealth(java.lang.Integer ap_wealth) {
		 this.ap_wealth=ap_wealth;
	}
	public java.lang.Integer getAp_wealthtype() {
		return ap_wealthtype;
	}
	public void setAp_wealthtype(java.lang.Integer ap_wealthtype) {
		 this.ap_wealthtype=ap_wealthtype;
	}
	public java.lang.Integer getAp_msg() {
		return ap_msg;
	}
	public void setAp_msg(java.lang.Integer ap_msg) {
		 this.ap_msg=ap_msg;
	}
	public java.lang.Integer getSealflag() {
		return sealflag;
	}
	public void setSealflag(java.lang.Integer sealflag) {
		 this.sealflag=sealflag;
	}
}
