package psf.entity;
public class EcsUsers extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer user_id = null;
	protected java.lang.String email = null;
	protected java.lang.String user_name = null;
	protected java.lang.String password = null;
	protected java.lang.String question = null;
	protected java.lang.String answer = null;
	protected java.lang.Integer sex = null;
	protected java.sql.Date birthday = null;
	protected java.math.BigDecimal user_money = null;
	protected java.math.BigDecimal frozen_money = null;
	protected java.lang.Long pay_points = null;
	protected java.lang.Long rank_points = null;
	protected java.lang.Integer address_id = null;
	protected java.lang.Long reg_time = null;
	protected java.lang.Long last_login = null;
	protected java.sql.Timestamp last_time = null;
	protected java.lang.String last_ip = null;
	protected java.lang.Integer visit_count = null;
	protected java.lang.Integer user_rank = null;
	protected java.lang.Integer is_special = null;
	protected java.lang.String salt = null;
	protected java.lang.Integer parent_id = null;
	protected java.lang.Integer flag = null;
	protected java.lang.String alias = null;
	protected java.lang.String msn = null;
	protected java.lang.String qq = null;
	protected java.lang.String office_phone = null;
	protected java.lang.String home_phone = null;
	protected java.lang.String mobile_phone = null;
	protected java.lang.Integer is_validated = null;
	protected java.math.BigDecimal credit_line = null;
	protected java.lang.String passwd_question = null;
	protected java.lang.String passwd_answer = null;
	protected String [] _fields = new String[]{"user_id","email","user_name","password","question","answer","sex","birthday","user_money","frozen_money","pay_points","rank_points","address_id","reg_time","last_login","last_time","last_ip","visit_count","user_rank","is_special","salt","parent_id","flag","alias","msn","qq","office_phone","home_phone","mobile_phone","is_validated","credit_line","passwd_question","passwd_answer"};

	public EcsUsers() {
	}
	public String getTableName() {
		return "ecs_users";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "user_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(java.lang.Integer user_id) {
		 this.user_id=user_id;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		 this.email=email;
	}
	public java.lang.String getUser_name() {
		return user_name;
	}
	public void setUser_name(java.lang.String user_name) {
		 this.user_name=user_name;
	}
	public java.lang.String getPassword() {
		return password;
	}
	public void setPassword(java.lang.String password) {
		 this.password=password;
	}
	public java.lang.String getQuestion() {
		return question;
	}
	public void setQuestion(java.lang.String question) {
		 this.question=question;
	}
	public java.lang.String getAnswer() {
		return answer;
	}
	public void setAnswer(java.lang.String answer) {
		 this.answer=answer;
	}
	public java.lang.Integer getSex() {
		return sex;
	}
	public void setSex(java.lang.Integer sex) {
		 this.sex=sex;
	}
	public java.sql.Date getBirthday() {
		return birthday;
	}
	public void setBirthday(java.sql.Date birthday) {
		 this.birthday=birthday;
	}
	public java.math.BigDecimal getUser_money() {
		return user_money;
	}
	public void setUser_money(java.math.BigDecimal user_money) {
		 this.user_money=user_money;
	}
	public java.math.BigDecimal getFrozen_money() {
		return frozen_money;
	}
	public void setFrozen_money(java.math.BigDecimal frozen_money) {
		 this.frozen_money=frozen_money;
	}
	public java.lang.Long getPay_points() {
		return pay_points;
	}
	public void setPay_points(java.lang.Long pay_points) {
		 this.pay_points=pay_points;
	}
	public java.lang.Long getRank_points() {
		return rank_points;
	}
	public void setRank_points(java.lang.Long rank_points) {
		 this.rank_points=rank_points;
	}
	public java.lang.Integer getAddress_id() {
		return address_id;
	}
	public void setAddress_id(java.lang.Integer address_id) {
		 this.address_id=address_id;
	}
	public java.lang.Long getReg_time() {
		return reg_time;
	}
	public void setReg_time(java.lang.Long reg_time) {
		 this.reg_time=reg_time;
	}
	public java.lang.Long getLast_login() {
		return last_login;
	}
	public void setLast_login(java.lang.Long last_login) {
		 this.last_login=last_login;
	}
	public java.sql.Timestamp getLast_time() {
		return last_time;
	}
	public void setLast_time(java.sql.Timestamp last_time) {
		 this.last_time=last_time;
	}
	public java.lang.String getLast_ip() {
		return last_ip;
	}
	public void setLast_ip(java.lang.String last_ip) {
		 this.last_ip=last_ip;
	}
	public java.lang.Integer getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(java.lang.Integer visit_count) {
		 this.visit_count=visit_count;
	}
	public java.lang.Integer getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(java.lang.Integer user_rank) {
		 this.user_rank=user_rank;
	}
	public java.lang.Integer getIs_special() {
		return is_special;
	}
	public void setIs_special(java.lang.Integer is_special) {
		 this.is_special=is_special;
	}
	public java.lang.String getSalt() {
		return salt;
	}
	public void setSalt(java.lang.String salt) {
		 this.salt=salt;
	}
	public java.lang.Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(java.lang.Integer parent_id) {
		 this.parent_id=parent_id;
	}
	public java.lang.Integer getFlag() {
		return flag;
	}
	public void setFlag(java.lang.Integer flag) {
		 this.flag=flag;
	}
	public java.lang.String getAlias() {
		return alias;
	}
	public void setAlias(java.lang.String alias) {
		 this.alias=alias;
	}
	public java.lang.String getMsn() {
		return msn;
	}
	public void setMsn(java.lang.String msn) {
		 this.msn=msn;
	}
	public java.lang.String getQq() {
		return qq;
	}
	public void setQq(java.lang.String qq) {
		 this.qq=qq;
	}
	public java.lang.String getOffice_phone() {
		return office_phone;
	}
	public void setOffice_phone(java.lang.String office_phone) {
		 this.office_phone=office_phone;
	}
	public java.lang.String getHome_phone() {
		return home_phone;
	}
	public void setHome_phone(java.lang.String home_phone) {
		 this.home_phone=home_phone;
	}
	public java.lang.String getMobile_phone() {
		return mobile_phone;
	}
	public void setMobile_phone(java.lang.String mobile_phone) {
		 this.mobile_phone=mobile_phone;
	}
	public java.lang.Integer getIs_validated() {
		return is_validated;
	}
	public void setIs_validated(java.lang.Integer is_validated) {
		 this.is_validated=is_validated;
	}
	public java.math.BigDecimal getCredit_line() {
		return credit_line;
	}
	public void setCredit_line(java.math.BigDecimal credit_line) {
		 this.credit_line=credit_line;
	}
	public java.lang.String getPasswd_question() {
		return passwd_question;
	}
	public void setPasswd_question(java.lang.String passwd_question) {
		 this.passwd_question=passwd_question;
	}
	public java.lang.String getPasswd_answer() {
		return passwd_answer;
	}
	public void setPasswd_answer(java.lang.String passwd_answer) {
		 this.passwd_answer=passwd_answer;
	}
}
