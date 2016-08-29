package psf.vo.mall;

import java.io.Serializable;

import psf.entity.TBrand;

/**
 * 品牌
 * @author 肖慧
 *
 */
public class BrandVO extends TBrand implements Serializable {
	protected String logoName = null;
	protected Integer guideCount = null;
	protected Integer recommendCount = null;	//好友推荐数
	protected Integer likecount = null;

	public String getLogoName() {
		return logoName;
	}

	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}

	public Integer getGuideCount() {
		return guideCount;
	}

	public void setGuideCount(Integer guideCount) {
		this.guideCount = guideCount;
	}

	public Integer getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(Integer recommendCount) {
		this.recommendCount = recommendCount;
	}

	public Integer getLikecount() {
		return likecount;
	}

	public void setLikecount(Integer likecount) {
		this.likecount = likecount;
	}
}
