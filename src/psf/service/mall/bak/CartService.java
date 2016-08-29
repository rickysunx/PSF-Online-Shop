package psf.service.mall.bak;

import psf.PsfService;

/**
 * @author 肖慧
 */
public class CartService extends PsfService {
	/**
	 * 增加或更新购物车商品数量
	 */
//	public void addOrUpdateProductToCart(Integer uid, Integer pid, Integer count) throws Exception {
//		TCart paramCart = new TCart();
//		paramCart.setUid(uid);
//		paramCart.setPid(pid);
//		paramCart.setPcount(count);
//		TCart cart = (TCart) sqlmap.queryForList("cart.isExist", paramCart);
//		if (cart != null)
//			sqlmap.update("cart.update", paramCart);
//		else
//			dao.insert(paramCart);
//	}
//
//	/**
//	 * 移除购物车
//	 */
//	public void removeProductFromCart(Integer uid, Integer pid) throws Exception {
//		Map<String, Object> param = new HashMap<String, Object>();
//		sqlmap.delete("cart.delete", param);
//	}
//
//	/**
//	 * 清除购物车内容
//	 */
//	public void clearCart(Integer uid) throws Exception {
//		sqlmap.delete("cart.clearCart", uid);
//	}
//
//	/**
//	 * 根据用户ID查询购物车
//	 */
//	@SuppressWarnings("unchecked")
//	public List<TCart> queryCartByUid(Integer uid) throws Exception {
//		return sqlmap.queryForList("cart.queryCartByUid", uid);
//	}
}
