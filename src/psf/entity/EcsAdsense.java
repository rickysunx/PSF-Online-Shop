package psf.entity;
public class EcsAdsense extends psf.framework.BasicEntity implements psf.framework.IBasicEntity,java.io.Serializable {
	private static final long serialVersionUID=1L;
	protected java.lang.Integer from_ad = null;
	protected java.lang.String referer = null;
	protected java.lang.Long clicks = null;
	protected String [] _fields = new String[]{"from_ad","referer","clicks"};

	public EcsAdsense() {
	}
	public String getTableName() {
		return "ecs_adsense";
	}
	public String [] getFields() {
		return _fields;
	}
	public String getPrimaryKey() {
		return "null";
	}
	public boolean isAutoIncrease() {
		return false;
	};
	public java.lang.Integer getFrom_ad() {
		return from_ad;
	}
	public void setFrom_ad(java.lang.Integer from_ad) {
		 this.from_ad=from_ad;
	}
	public java.lang.String getReferer() {
		return referer;
	}
	public void setReferer(java.lang.String referer) {
		 this.referer=referer;
	}
	public java.lang.Long getClicks() {
		return clicks;
	}
	public void setClicks(java.lang.Long clicks) {
		 this.clicks=clicks;
	}
}
