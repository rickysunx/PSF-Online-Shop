package psf.vo.sns;

import java.io.Serializable;
import java.util.List;

import psf.entity.TPic;
import psf.entity.TPost;
import psf.vo.sns.right.SnsRightProductVO;

public class ShowVO extends TPost implements Serializable {
	protected List<TPic> pics = null;
	protected String cover = null;	//秀场主图，封面 
	protected String cover_thumb = null;
	
	protected String displayName = null;	//秀主的显示名
	protected String avatarFileName = null;	//秀主头像
	
	protected List<SnsRightProductVO> products = null;	//秀场商品 
	protected Boolean isLiked = false;	//是否已喜欢

	public List<TPic> getPics() {
		return pics;
	}

	public void setPics(List<TPic> pics) {
		this.pics = pics;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	public String getCover_thumb() {
		return cover_thumb;
	}

	public void setCover_thumb(String cover_thumb) {
		this.cover_thumb = cover_thumb;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public List<SnsRightProductVO> getProducts() {
		return products;
	}

	public void setProducts(List<SnsRightProductVO> products) {
		this.products = products;
	}

	public Boolean getIsLiked() {
		return isLiked;
	}

	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}
}
