package psf.vo.sns.right;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 右侧通用用户对象，包括：排行榜、人气品友、可能喜欢的品友等
 * @author 肖慧
 *
 */
public class SnsRightUserVO implements Serializable {
	protected Integer uid = null;
	protected String username = null;
	protected String avatarFileName = null;
	protected Boolean isFollow = false;
	
	protected BigDecimal coins = null;	//享金
	protected Integer showCount = null;
	protected Integer shopexpCount = null;
	protected Integer guideCount = null;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getAvatarFileName() {
		return avatarFileName;
	}
	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}
	public Boolean getIsFollow() {
		return isFollow;
	}
	public void setIsFollow(Boolean isFollow) {
		this.isFollow = isFollow;
	}
	public BigDecimal getCoins() {
		return coins;
	}
	public void setCoins(BigDecimal coins) {
		this.coins = coins;
	}
	public Integer getShowCount() {
		return showCount;
	}
	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}
	public Integer getShopexpCount() {
		return shopexpCount;
	}
	public void setShopexpCount(Integer shopexpCount) {
		this.shopexpCount = shopexpCount;
	}
	public Integer getGuideCount() {
		return guideCount;
	}
	public void setGuideCount(Integer guideCount) {
		this.guideCount = guideCount;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
