package psf.vo.mall;

import java.io.Serializable;
import java.util.List;

import psf.entity.TOrder;

/**
 * 订单
 * @author 肖慧
 *
 */
public class OrderVO extends TOrder implements Serializable {
	protected List<ProductVO> products = null;

	public List<ProductVO> getProducts() {
		return products;
	}

	public void setProducts(List<ProductVO> products) {
		this.products = products;
	}
	
}
