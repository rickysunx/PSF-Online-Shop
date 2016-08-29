/**
 * 前台订单处理
 * 
 */
package psf.action.mall;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import psf.PsfActionService;
import psf.PsfItem;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.entity.EcsOrderGoods;
import psf.entity.EcsOrderInfo;
import psf.entity.EcsUserAddress;
import psf.framework.PsfException;

public class OrderAction extends PsfActionService {
	
	public static String [] bestTimes = new String[]{"工作日和节假日均可","尽量工作日送","尽量节假日送"};
	
	/**
	 * 新增订单
	 * 
	 */
	public void add() throws Exception {
		Integer uid = getLoginUserId();
		
		if(uid==null) {
			sendRedirect("/login");
			return;
		}
		
		//快递区域
		List<PsfItem> regionList = getRegionList();
		JSONArray jsonRegion = new JSONArray();
		jsonRegion.addAll(regionList);
		set("jsonExpressRegion",jsonRegion.toString());
		
		String sql = "select count(1) from v_cart where uid=#uid#";
		dao.prepare(sql);
		dao.bind("uid", uid);
		Integer cartGoodsCount = dao.queryForInt();
		if(cartGoodsCount==0) {
			sendRedirect("/cart?error=1");
			return;
		}
		
		//订单金额(商品总金额，运费)
		sql = "select sum(pcount*shop_price) from v_cart where uid=#uid#";
		dao.prepare(sql);
		dao.bind("uid", uid);
		BigDecimal goodsTotalAmount = dao.queryForDecimal();
		BigDecimal expressAmount = new BigDecimal("15.00");
		set("goodsTotalAmount",goodsTotalAmount);                 //商品总金额
		set("expressAmount",expressAmount);                       //快递总金额
		set("totalAmount",goodsTotalAmount.add(expressAmount));   //合计
		
	}
	
	public void success() throws Exception {
		Integer uid = getLoginUserId();
		Integer orderid = p2int("orderid");
		
		String sql = "select * from v_order where order_id = #orderid# and user_id = #uid# ";
		dao.prepare(sql);
		dao.bind("orderid", orderid);
		dao.bind("uid", uid);
		PsfItem order = dao.queryForOneRow();
		if(order==null) {
			sendError(404);
			return;
		}
		
		set("order",order);
		
	}
	
	/**
	 * 查询区域列表
	 * @return
	 * @throws Exception
	 */
	public List<PsfItem> getRegionList() throws Exception {
		String sql = "select region_id,parent_id,region_name from ecs_region order by region_id";
		dao.prepare(sql);
		List<PsfItem> allRegionList = dao.queryForList();
		
		//key->region_id value=region
		Map<Integer, PsfItem> mapRegion = new HashMap<Integer, PsfItem>();
		for(PsfItem item:allRegionList) {
			mapRegion.put(item.getInt("region_id"), item);
		}
		
		List<PsfItem> regionList = new ArrayList<PsfItem>();
		
		//设置子节点
		for(PsfItem item:allRegionList) {
			Integer parent_id = item.getInt("parent_id");
			if(parent_id.equals(1)) {
				regionList.add(item);
			}
			PsfItem parentItem = mapRegion.get(parent_id);
			if(parentItem!=null) {
				List<PsfItem> children = parentItem.getList("children");
				if(children==null) {
					children = new ArrayList<PsfItem>();
					parentItem.put("children", children);
				}
				children.add(item);
			}
		}
		
		
		
		return regionList;
	}
	
	
	
	/**
	 * 保存订单
	 * @throws Exception
	 */
	public void save() throws Exception {
		String consignee = p("consignee0");
		Integer districtid = p2int("district0");
		String address = p("address0");
		String zipcode = p("zipcode");
		String mobile = p("mobile");
		String tel = p("tel");
		Integer uid = getLoginUserId();
		Integer besttime = p2int("expressTime");
		String postscript = p("expressNote");
		String inv_payee = p("inv_payee");
		String inv_content = p("inv_content");
		
		try {
			//校验订单信息
			if(uid==null) throw new PsfException("未登录");
			
			if(consignee==null || consignee.trim().length()==0) {
				throw new PsfException("收货人不能为空");
			}
			
			if(districtid==null || districtid==0) {
				throw new PsfException("区县不能为空");
			}
			
			if(address==null || address.trim().length()==0) {
				throw new PsfException("地址不能为空");
			}
			
			if(mobile==null || mobile.trim().length()==0) {
				throw new PsfException("收货人不能为空");
			}
			
			if(besttime==null || besttime<0 || besttime>2) {
				throw new PsfException("快递时间不合法");
			}
			
			if(postscript!=null && postscript.trim().length()>200) {
				throw new PsfException("快递备注需200字以内");
			}
			
			//查询地区信息
			String sql = "select * from v_region where district_id = #district_id#";
			dao.prepare(sql);
			dao.bind("district_id", districtid);
			PsfItem region = dao.queryForOneRow();
			if(region==null) throw new PsfException("收货区域不正确");
			
			PsfTime now = new PsfTime();
			
			//设置订单号
			sql = "select max(order_sn) from ecs_order_info where order_sn like ('"+now.toDate8()+"%') ";
			dao.prepare(sql);
			String maxOrderSn = (String)dao.queryForObject();
			if(maxOrderSn==null) {
				maxOrderSn = now.toDate8()+"00000";
			}
			Long nMaxOrderSn = Long.parseLong(maxOrderSn);
			nMaxOrderSn++;
			
			//保存常用地址
			sql = "select address_id from ecs_user_address " +
				"where user_id=#user_id# and consignee=#consignee# and " +
				"district=#district# and mobile=#mobile# and address=#address#";
			dao.prepare(sql);
			dao.bind("user_id", uid);
			dao.bind("consignee", consignee);
			dao.bind("district", districtid);
			dao.bind("mobile", mobile);
			dao.bind("address", address);
			Integer address_id = dao.queryForInt();
			if(address_id==null) {
				EcsUserAddress userAddress = new EcsUserAddress();
				userAddress.setUser_id(uid);
				userAddress.setConsignee(consignee);
				userAddress.setDistrict(districtid);
				userAddress.setProvince(region.getInt("province_id"));
				userAddress.setCity(region.getInt("city_id"));
				userAddress.setMobile(mobile);
				userAddress.setAddress(address);
				address_id = dao.insert(userAddress,false);
			}
			
			//计算金额
			sql = "select * from v_cart where uid=#uid#";
			dao.prepare(sql);
			dao.bind("uid", uid);
			List<PsfItem> cartList = dao.queryForList();
			
			BigDecimal goods_amount = new BigDecimal(0);
			for(PsfItem cg:cartList) {
				goods_amount = goods_amount.add(cg.getDecimal("shop_price").multiply(cg.getDecimal("pcount")));
			}
			
			//保存订单
			EcsOrderInfo orderInfo = new EcsOrderInfo();
			orderInfo.setOrder_sn(""+nMaxOrderSn);
			orderInfo.setUser_id(uid);
			orderInfo.setShipping_status(0);
			orderInfo.setPay_status(0);
			orderInfo.setConsignee(consignee);
			orderInfo.setCountry(1);
			orderInfo.setProvince(region.getInt("province_id"));
			orderInfo.setCity(region.getInt("city_id"));
			orderInfo.setDistrict(region.getInt("district_id"));
			orderInfo.setAddress(address);
			orderInfo.setMobile(mobile);
			orderInfo.setZipcode(zipcode);
			orderInfo.setEmail("");
			orderInfo.setBest_time(bestTimes[besttime]);
			orderInfo.setSign_building("");
			orderInfo.setPostscript(postscript);
			orderInfo.setTel(tel);
			orderInfo.setOrder_status(0);
			orderInfo.setAgency_id(0);
			orderInfo.setInv_type("");
			orderInfo.setInv_payee(inv_payee);
			orderInfo.setInv_content(inv_content);
			orderInfo.setAdd_time((long)now.getTimeInSeconds());
			orderInfo.setTax(new BigDecimal(0));
			orderInfo.setDiscount(new BigDecimal(0));
			orderInfo.setGoods_amount(goods_amount);
			orderInfo.setShipping_fee(new BigDecimal("15.00")); //运费
			
			Integer orderid = dao.insert(orderInfo,false);
			
			for(PsfItem cg:cartList) {
				EcsOrderGoods g = new EcsOrderGoods();
				g.setOrder_id(orderid);
				g.setGoods_id(cg.getInt("pid"));
				g.setGoods_name(cg.getString("goods_name"));
				g.setGoods_sn(cg.getString("goods_sn"));
				g.setGoods_number(cg.getInt("pcount"));
				g.setMarket_price(cg.getDecimal("market_price"));
				g.setGoods_price(cg.getDecimal("shop_price"));
				g.setGoods_attr("");
				g.setIs_real(1);
				dao.insert(g,false);
			}
			
			//删除购物车
			sql = "delete from t_cart where uid=#uid# ";
			dao.prepare(sql);
			dao.bind("uid", uid);
			dao.update();
			
			set("success",1);
			set("orderid",orderid);
			
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info","保存订单出错："+e.getMessage());
			rollback();
		}
	}
	
	/**
	 * 设置默认地址
	 * @throws Exception
	 */
	public void setDefaultAddress() throws Exception {
		
		try {
			Integer addressid = p2int("addressid");
			Integer uid = getLoginUserId();
			if(uid==null) throw new Exception("未登录");
			
			String sql = "update ecs_users u set u.address_id = #address_id# where u.user_id=#user_id# ";
			sql += " and exists (select 1 from ecs_user_address where user_id=#user_id# and address_id = #address_id#)";
			
			dao.prepare(sql);
			dao.bind("address_id", addressid);
			dao.bind("user_id", uid);
			dao.update();
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
		
	}
	
	/**
	 * 获取常用地址
	 * @throws Exception
	 */
	public void getAddress() throws Exception {
		Integer page = p2int("page");
		if(page==null) page=1;
		Integer uid = getLoginUserId();
		if(uid==null) throw new Exception("未登录");
		PageParam pp = new PageParam(page,5);
		
		String wsql = " from v_user_address a "+
			"where a.user_id = #uid# order by isdefault desc,address_id desc ";
		
		String sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("uid", uid);
		Integer itemCount = dao.queryForInt();
		
		sql = "select * "+wsql+" limit #offset#,#size#";
		dao.prepare(sql);
		dao.bind("uid", uid);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> addressList = dao.queryForList();
		
		set("addressList",addressList);
		
		PageResult<PsfItem> addressResult = new PageResult<PsfItem>(addressList, itemCount, pp.getPageSize());
		
		set("showPrev",page>1);
		set("showNext",page<addressResult.getPageCount());
		set("currPage",page);
		
		JSONArray jsonAddressList = new JSONArray();
		jsonAddressList.addAll(addressList);
		set("jsonAddressList",jsonAddressList.toString());
		
	}
	
	public void saveAddress() throws Exception {
		
	}
	
}
