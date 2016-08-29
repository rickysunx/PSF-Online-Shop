package psf.service.mall.bak;

import psf.PsfService;

/**
 * 订单处理
 * 
 * @author 肖慧
 */
public class OrderService extends PsfService {
	/**
	 * 生成订单以及订单明细
	 * 
	 * @param order
	 * @param orderProducts
	 * @throws Exception
	 */
//	public void addOrder(TOrder order, TOrderProduct[] orderProducts) throws Exception {
//		Integer orderid = dao.insert(order);
//		for (TOrderProduct product : orderProducts) {
//			product.setOrderid(orderid);
//			product.setPackageid(0); // 暂时设置为0
//			dao.insert(product);
//		}
//	}

	/**
	 * 查询订单中包含的商品列表
	 * 
	 * @param orderid
	 * @return
	 * @throws Exception
	 */
//	public List<TOrderProduct> queryOrderProductByOrderID(Integer orderid) throws Exception {
//		return sqlmap.queryForList("order.queryOrderProductByOrderID", orderid);
//	}

//	public void addPay(TOrderPay pay) throws Exception {
//		dao.insert(pay);
//	}

//	public void updatePay(TOrderPay pay) throws Exception {
//		dao.update(pay);
//	}

	/**
	 * 删除支付信息
	 */
//	public void delPay(Integer payid) throws Exception {
//		sqlmap.delete("order.deletePay", payid);
//	}

	/**
	 * 生成包裹单
	 */
//	public void genPackage(Integer orderid) throws Exception {
//		// 通过订单ID获得所有的订单商品列表
//		List<TOrderProduct> order_product = queryOrderProductByOrderID(orderid);
//		Map<Integer, TOrderPackage> packs = new HashMap<Integer, TOrderPackage>(); // 一个包裹对应一个供货商，包含由同一个供货商提供的商品
//		ProductService ps = new ProductService();
//
//		// 遍历商品列表形成supplierid:package的Map对象
//		for (TOrderProduct product : order_product) {
//			TProduct p = ps.queryProductByID(product.getPid());
//			Integer supplierid = p.getSupplierid();
//
//			// 购买一款商品的商品费用
//			BigDecimal productamt = product.getAmount().setScale(2);
//
//			TOrderPackage pack = null;
//			if (packs.containsKey(supplierid)) {
//				pack = packs.get(supplierid);
//				// 增加商品总价
//				BigDecimal amt = pack.getProductamt();
//				amt = amt.add(productamt).setScale(2);
//				pack.setProductamt(amt);
//			} else {
//				pack = new TOrderPackage();
//				pack.setOrderid(orderid);
//				pack.setSupplierid(supplierid);
//				pack.setProductamt(productamt);
//			}
//			pack.setIsprepared(0);
//			pack.setIssendtoexpress(0);
//			pack.setIssignin(0);
//
//			packs.put(supplierid, pack);
//		}
//
//		// 遍历packs，将package插入数据库，同时更新订单商品的packageid
//		for (Integer supplierid : packs.keySet()) {
//			TOrderPackage pack = packs.get(supplierid);
//			Integer packageid = dao.insert(pack);
//			// 根据订单ID和supplierid查询订单商品，更新其packageid
//			List<TOrderProduct> products = queryProductByOrderIdAndSupplierId(
//					orderid, supplierid);
//			for (TOrderProduct product : products) {
//				product.setPackageid(packageid);
//				updateOrderProduct(product);
//			}
//		}
//	}

	/**
	 * 更新订单商品
	 * 
	 * @param product
	 * @throws Exception
	 */
//	public void updateOrderProduct(TOrderProduct product) throws Exception {
//		sqlmap.update("order.updateOrderProduct", product);
//	}

	/**
	 * 根据订单ID和供货商ID查询订单商品
	 * 
	 * @param orderid
	 * @param supplierid
	 * @return
	 * @throws Exception
	 */
//	public List<TOrderProduct> queryProductByOrderIdAndSupplierId(Integer orderid, Integer supplierid) throws Exception {
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("orderid", orderid);
//		param.put("supplierid", supplierid);
//		return sqlmap.queryForList("order.queryProductByOrderIdAndSupplierId",
//				param);
//	}

	/**
	 * 添加常用地址
	 */
//	public void addAddress(TUserAddress address) throws Exception {
//		dao.insert(address);
//	}

	/**
	 * 更新常用地址
	 * 
	 * @param address
	 * @throws Exception
	 */
//	public void updateAddress(TUserAddress address) throws Exception {
//		dao.update(address);
//	}

	/**
	 * 删除常用地址
	 * 
	 * @param addressid
	 * @throws Exception
	 */
//	public void delAddress(Integer addressid) throws Exception {
//		sqlmap.delete("order.deleteUserAddress", addressid);
//	}

	/**
	 * 查询指定用户的常用地址
	 * 
	 * @param uid
	 * @return
	 * @throws Exception
	 */
//	public List<TUserAddress> queryAddressByUid(Integer uid) throws Exception {
//		return sqlmap.queryForList("order.queryAddressByUid", uid);
//	}
	
	/**
	 * 根据用户ID和订单状态查询订单
	 * @param uid
	 * @param ostatus 订单状态(待定)
	 * @param pp
	 * @return
	 * @throws Exception
	 */
//	public PageResult<OrderVO> queryOrderByUid(Integer uid, Integer ostatus, PageParam pp) throws Exception {
//		return null;
//	}
}
