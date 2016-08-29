package psf.entity;
public class EcsCrons extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer cron_id = null;
	protected java.lang.String cron_code = null;
	protected java.lang.String cron_name = null;
	protected java.lang.String cron_desc = null;
	protected java.lang.Integer cron_order = null;
	protected java.lang.String cron_config = null;
	protected java.lang.Integer thistime = null;
	protected java.lang.Integer nextime = null;
	protected java.lang.Integer day = null;
	protected java.lang.String week = null;
	protected java.lang.String hour = null;
	protected java.lang.String minute = null;
	protected java.lang.Integer enable = null;
	protected java.lang.Integer run_once = null;
	protected java.lang.String allow_ip = null;
	protected java.lang.String alow_files = null;
	protected String [] _fields = new String[]{"cron_id","cron_code","cron_name","cron_desc","cron_order","cron_config","thistime","nextime","day","week","hour","minute","enable","run_once","allow_ip","alow_files"};

	public EcsCrons() {
	}
	public String getTableName() {
		return "ecs_crons";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "cron_id";
	}
	public boolean isAutoIncrease() {
		return true;
	};
	public java.lang.Integer getCron_id() {
		return cron_id;
	}
	public void setCron_id(java.lang.Integer cron_id) {
		 this.cron_id=cron_id;
	}
	public java.lang.String getCron_code() {
		return cron_code;
	}
	public void setCron_code(java.lang.String cron_code) {
		 this.cron_code=cron_code;
	}
	public java.lang.String getCron_name() {
		return cron_name;
	}
	public void setCron_name(java.lang.String cron_name) {
		 this.cron_name=cron_name;
	}
	public java.lang.String getCron_desc() {
		return cron_desc;
	}
	public void setCron_desc(java.lang.String cron_desc) {
		 this.cron_desc=cron_desc;
	}
	public java.lang.Integer getCron_order() {
		return cron_order;
	}
	public void setCron_order(java.lang.Integer cron_order) {
		 this.cron_order=cron_order;
	}
	public java.lang.String getCron_config() {
		return cron_config;
	}
	public void setCron_config(java.lang.String cron_config) {
		 this.cron_config=cron_config;
	}
	public java.lang.Integer getThistime() {
		return thistime;
	}
	public void setThistime(java.lang.Integer thistime) {
		 this.thistime=thistime;
	}
	public java.lang.Integer getNextime() {
		return nextime;
	}
	public void setNextime(java.lang.Integer nextime) {
		 this.nextime=nextime;
	}
	public java.lang.Integer getDay() {
		return day;
	}
	public void setDay(java.lang.Integer day) {
		 this.day=day;
	}
	public java.lang.String getWeek() {
		return week;
	}
	public void setWeek(java.lang.String week) {
		 this.week=week;
	}
	public java.lang.String getHour() {
		return hour;
	}
	public void setHour(java.lang.String hour) {
		 this.hour=hour;
	}
	public java.lang.String getMinute() {
		return minute;
	}
	public void setMinute(java.lang.String minute) {
		 this.minute=minute;
	}
	public java.lang.Integer getEnable() {
		return enable;
	}
	public void setEnable(java.lang.Integer enable) {
		 this.enable=enable;
	}
	public java.lang.Integer getRun_once() {
		return run_once;
	}
	public void setRun_once(java.lang.Integer run_once) {
		 this.run_once=run_once;
	}
	public java.lang.String getAllow_ip() {
		return allow_ip;
	}
	public void setAllow_ip(java.lang.String allow_ip) {
		 this.allow_ip=allow_ip;
	}
	public java.lang.String getAlow_files() {
		return alow_files;
	}
	public void setAlow_files(java.lang.String alow_files) {
		 this.alow_files=alow_files;
	}
}
