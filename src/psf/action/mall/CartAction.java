package psf.action.mall;

import java.math.BigDecimal;
import java.util.List;

import psf.Psf;
import psf.PsfActionService;
import psf.PsfItem;
import psf.entity.TCart;

public class CartAction extends PsfActionService {
	
	public void cart() throws Exception {
		Integer uid = getLoginUserId();
		String sessionid = getSession().getId();
		Integer error = p2int("error");
		
		if(error!=null && error==1) {
			set("errorInfo","尚未挑选商品，不能增加订单");
		}
		
		List<PsfItem> cartList = queryCartList(uid, sessionid);
		set("cartList",cartList);
		
		//商品金额
		BigDecimal totalAmount = new BigDecimal(0);
		for(PsfItem cg:cartList) {
			BigDecimal shop_price =  cg.getDecimal("shop_price");
			BigDecimal pcount = cg.getDecimal("pcount");
			totalAmount = totalAmount.add(shop_price.multiply(pcount));
		}
		set("totalAmount",totalAmount);
		
		//运费
		BigDecimal expressAmount = new BigDecimal("15.00");
		set("expressAmount",expressAmount);
		
		//需支付金额
		BigDecimal payAmount = totalAmount.add(expressAmount);
		set("payAmount",payAmount);
		
		//设置结算动作
		if(cartList.size()==0) {
			set("checkoutAction","javascript:alert('请先挑选商品');");
		} else {
			if(uid==null) {
				set("checkoutAction","javascript:openLoginDialog('/order/add');");
			} else {
				set("checkoutAction","/order/add");
			}
		}
		
		
		
	}
	
	public void updateToUserCart() throws Exception {
		Integer uid = getLoginUserId();
		String sessionid = getSession().getId();
		
		if(uid!=null && uid>0) {
			String sql = "update t_cart set uid=#uid# where sessionid=#sessionid# ";
			dao.prepare(sql);
			dao.bind("uid", uid);
			dao.bind("sessionid", sessionid);
			dao.update();
		}
	}
	
	public void addToCart() throws Exception {
		try {
			Integer pid = p2int("goods_id");
			Integer pcount = p2int("goods_amount");
			Integer uid = getLoginUserId();
			if(uid==null) uid=0;
			String sessionid = getSession().getId();
			
			TCart cart = new TCart();
			cart.setSessionid(sessionid);
			cart.setUid(uid);
			cart.setPid(pid);
			cart.setPcount(pcount);
			dao.insert(cart);
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",""+e.getMessage());
		}
		
	}
	
	public void getCartCount() throws Exception {
		Integer uid = getLoginUserId();
		String sessionid = getSession().getId();
		
		String sql = "select sum(pcount) pcount from v_cart where ";
		if(uid==null || uid==0) {
			sql += " sessionid=#sessionid# ";
		} else {
			sql += " uid=#uid# ";
		}
		
		dao.prepare(sql);
		dao.bind("sessionid", sessionid);
		dao.bind("uid", uid);
		Integer goods_count = dao.queryForInt();
		if(goods_count==null) goods_count = 0;
		set("goods_count",goods_count);
	}
	
	public void getFloatCart() throws Exception {
		Integer uid = getLoginUserId();
		String sessionid = getSession().getId();
		
		List<PsfItem> cartList = queryCartList(uid, sessionid);
		set("cartList",cartList);
		
		int goods_count = 0;
		for(PsfItem cg:cartList) {
			goods_count += cg.getInt("pcount");
		}
		set("goods_count",goods_count);
	}
	
	public List<PsfItem> queryCartList(Integer uid,String sessionid) throws Exception {
		String sql = "select pid,sum(pcount) as pcount,goods_id,goods_thumb, goods_name,shop_price from v_cart where ";
		
		if(uid==null || uid==0) {
			sql += " sessionid=#sessionid# group by pid,sessionid ";
		} else {
			sql += " uid=#uid# group by pid,uid ";
		}
		
		dao.prepare(sql);
		dao.bind("sessionid", sessionid);
		dao.bind("uid", uid);
		List<PsfItem> cartList = dao.queryForList();
		return cartList;
	}
	
	public void moveToLike() throws Exception {
		try {
			Integer pid = p2int("pid");
			Integer uid = getLoginUserId();
			
			if(pid==null || pid==0) {
				throw new Exception("商品id不能为空");
			}
			
			//查询是否收藏
			String sql = "select * from t_like where otype=#otype# and oid=#pid# and uid=#uid#";
			dao.prepare(sql);
			dao.bind("otype", Psf.OTYPE_Product);
			dao.bind("pid", pid);
			dao.bind("uid", uid);
			PsfItem like = dao.queryForOneRow();
			if(like!=null) {
				throw new Exception("该商品已经收藏");
			}
			
			//加入收藏
			sql = "insert into t_like(uid,oid,otype) values (#uid#,#oid#,#otype#) ";
			dao.prepare(sql);
			dao.bind("otype", Psf.OTYPE_Product);
			dao.bind("oid", pid);
			dao.bind("uid", uid);
			dao.update();
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
			rollback();
		}
	}
	
	public void deleteGoodsFormCart(Integer pid,Integer uid,String sessionid) throws Exception {
		String sql = "delete from t_cart where pid=#pid# and ";
		if(uid!=null) {
			sql+=" uid=#uid# ";
		} else {
			sql+=" sessionid=#sessionid# ";
		}
		dao.prepare(sql);
		dao.bind("pid", pid);
		dao.bind("uid", uid);
		dao.bind("sessionid", sessionid);
		dao.update();
	}
	
	public void removeFromCart() throws Exception {
		try {
			Integer pid = p2int("pid");
			Integer uid = getLoginUserId();
			String sessionid = getSession().getId();
			
			if(pid==null || pid==0) {
				throw new Exception("商品id不能为空");
			}
			
			deleteGoodsFormCart(pid, uid, sessionid);
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void updateCartAmount() throws Exception {
		try {
			Integer pid = p2int("pid");
			Integer pcount = p2int("pcount");
			Integer uid = getLoginUserId();
			String sessionid = getSession().getId();
			
			deleteGoodsFormCart(pid, uid, sessionid);
			
			String sql = "insert into t_cart(pcount,pid,uid,sessionid) values (#pcount#,#pid#,#uid#,#sessionid#) ";
			dao.prepare(sql);
			dao.bind("pid", pid);
			dao.bind("pcount", pcount);
			dao.bind("uid", uid);
			dao.bind("sessionid", sessionid);
			dao.update();
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
			rollback();
		}
	}
	
}
