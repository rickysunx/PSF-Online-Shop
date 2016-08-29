package psf.action.mall;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.map.ListOrderedMap;


import psf.Psf;
import psf.PsfActionService;
import psf.PsfItem;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.entity.TComment;
import psf.entity.TPost;

public class ProductAction extends PsfActionService {
	
	/*商城单品页*/
	public void product() throws Exception {
		Integer goods_id = p2int("pid");
		
		if(goods_id==null) {
			sendError(500);
			return;
		}
		
		//查询当前商品
		String sql = "select * from ecs_goods g left join ecs_brand b on g.brand_id = b.brand_id where goods_id=#goods_id#";
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		PsfItem goods = dao.queryForOneRow();
		if(goods==null) {
			sendError(404);
			return;
		}
		set("goods",goods);
		
		//查询商品图片
		sql = "select * from ecs_goods_gallery where goods_id=#goods_id#";
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		List<PsfItem> goodsImageList = dao.queryForList();
		set("goodsImageList",goodsImageList);
		
		//查询所有类别
		List cateTree = getCateTreeWithBrands();
		set("current_nav",-1);
		set("cateTree",cateTree);
		
		Integer cat_id = goods.getInt("cat_id");
		Map<Integer,PsfItem> cateMap = (Map<Integer, PsfItem>)get("cateMap");
		PsfItem cate = cateMap.get(cat_id);
		
		set("currCate",cate);
		set("pageTitle",goods.getString("goods_name")+"_品上商城");
		
		//导航
		String cateNav = getCateNav(cate); 
		set("cateNav",cateNav+" &gt; "+goods.getString("goods_name"));
		
		//当前分类的同级分类
		set("brotherCateList",getBrotherCate(cate));
		
		//查询相关品牌
		if(cate!=null) {
			List<PsfItem> cateBrands = (List<PsfItem>) get("cateBrands");
			List<PsfItem> brandsOfThisCate = new ArrayList<PsfItem>();
			for(PsfItem b:cateBrands) {
				if(b.getInt("cat_id").equals(cate.getInt("cat_id"))) {
					brandsOfThisCate.add(b);
				}
			}
			set("brandsOfThisCate",brandsOfThisCate);
		}
		
		//查询SNS帖子
		PageResult<PsfItem> showPostList = querySnsShowPost(goods_id, 1);
		PageResult<PsfItem> expPostList = querySnsExpPost(goods_id,1);
		PageResult<PsfItem> guidePostList = querySnsGuidePost(goods.getInt("brand_id")==null?0:goods.getInt("brand_id"),1);
		
		set("showPostList",showPostList.getList());
		set("expPostList",expPostList.getList());
		set("guidePostList",guidePostList.getList());
		
		set("showNext",showPostList.getPageCount()>1);
		set("expNext",expPostList.getPageCount()>1);
		set("guideNext",guidePostList.getPageCount()>1);
		
		//查询拼货
		PageResult<PsfItem> combineGoodsList = queryCombineBuyGoods(goods_id, new PageParam(1,4));
		set("combineGoodsList",combineGoodsList.getList());
		set("combineGoodsListNext",combineGoodsList.getPageCount()>1);
		
		//查询规格选择
		sql = "select attr.attr_id,attr.attr_name, attr.attr_type," +
			"ga.goods_attr_id,ga.attr_value " +
			"from ecs_attribute attr,ecs_goods_attr ga " +
			"where attr.attr_id=ga.attr_id and ga.goods_id=#goods_id# and attr.attr_type in (1,2) " +
			"order by attr.attr_id";
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		List<PsfItem> goodsAttrList = dao.queryForList();
		
		//<attr_id,attr_name,attr_type,List<goods_attr_id,attr_value>)
		List<PsfItem> attrList = new ArrayList<PsfItem>();
		for(PsfItem goodsAttr:goodsAttrList) {
			PsfItem attr = null;
			for(PsfItem a:attrList) {
				if(goodsAttr.getInt("attr_id").equals(a.getInt("attr_id"))) {
					attr = a;
				}
			}
			if(attr==null) {
				attr = new PsfItem();
				attr.put("attr_id", goodsAttr.get("attr_id"));
				attr.put("attr_name", goodsAttr.get("attr_name"));
				attr.put("attr_type", goodsAttr.get("attr_type"));
				attr.put("attr_children", new ArrayList());
				attrList.add(attr);
			}
			
			List<PsfItem> attr_children = attr.getList("attr_children");
			PsfItem ga = new PsfItem();
			ga.put("goods_attr_id", goodsAttr.get("goods_attr_id"));
			ga.put("attr_value", goodsAttr.get("attr_value"));
			attr_children.add(ga);
		}
		set("attrList",attrList);
		
		JSONArray jsonAttrList = new JSONArray();
		jsonAttrList.addAll(attrList);
		set("jsonAttrList",jsonAttrList.toString());
		
	}
	
	public void getSnsPost() throws Exception {
		Integer id = p2int("id");
		Integer brandid = p2int("brandid");
		Integer type = p2int("type");
		Integer page = p2int("page");
		if(page==null) page = 0;
		
		set("page",page);
		
		if(type==0) {
			PageResult<PsfItem> showPostList = querySnsShowPost(id, page);
			set("showPostList",showPostList.getList());
			set("snsPost","show");
			set("snsPostType",0);
			set("showPrev",page>1);
			set("showNext",page<showPostList.getPageCount());
		} else if(type==1) {
			PageResult<PsfItem> expPostList = querySnsExpPost(id,page);
			set("expPostList",expPostList.getList());
			set("snsPost","exp");
			set("snsPostType",1);
			set("showPrev",page>1);
			set("showNext",page<expPostList.getPageCount());
		} else if(type==2) {
			PageResult<PsfItem> guidePostList = querySnsGuidePost(brandid,page);
			set("guidePostList",guidePostList.getList());
			set("snsPost","guide");
			set("snsPostType",2);
			set("showPrev",page>1);
			set("showNext",page<guidePostList.getPageCount());
		}
		
	}
	
	public PageResult<PsfItem> querySnsShowPost(int goods_id,int page) throws Exception {
		PageParam pp = new PageParam(page,8);
		
		String wsql = " from t_post p left join t_post_pic pp on p.postid = pp.postid "+
			"	left join t_pic pic on pp.picid = pic.picid "+
			"	left join t_user u on p.uid = u.uid "+
			"	left join t_pic pic2 on u.avatarid = pic2.picid "+
			" where posttype = 2 and pp.iscover = 1 and p.delflag=0 "+
			"    and p.postid in(select postid from t_post_product where pid = #goods_id#) "+
			" group by p.postid ";
		
		String sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		Integer itemCount = dao.queryForInt();
		if(itemCount==null) itemCount = 0;
		
		sql = "select p.postid, title, cast(concat(min(pp.picid),'.',pic.filetype) as char) coverpic, " +
			" cast(concat(u.avatarid,'.',pic2.filetype) as char) avatarpic "+wsql+
			" limit #offset#,#size# ";
		
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> list = dao.queryForList();
		
		return new PageResult<PsfItem>(list, itemCount, pp.getPageSize());
		
	}
	
	public PageResult<PsfItem> querySnsExpPost(int goods_id,int page) throws Exception {
		PageParam pp = new PageParam(page,4);
		
		String wsql = "";
		wsql+=" from t_post as p ";
		wsql+="     left join t_user as u on p.uid = u.uid ";
		wsql+="     left join t_pic as picu on u.avatarid = picu.picid ";                        
		wsql+="     left join t_user_balance as b on u.uid = b.uid ";
		wsql+="     left join (select oid,uid,commentid,otype,content commentcontent from t_comment c1 where c1.commentid in (    ";
		wsql+="	select cc.commentid from (                                                                                    ";
		wsql+="		select p1.postid,max(c1.commentid) commentid                                                              ";
		wsql+="		from t_comment c1,t_post p1                                                                               ";
		wsql+="		where c1.oid = p1.postid and c1.otype = p1.posttype                                                       ";
		wsql+="		group by p1.postid ) as cc)                                                                               ";
		wsql+="        ) as c on p.postid = c.oid and p.posttype = c.otype                                                    ";
		wsql+="     left join t_user as u2 on u2.uid = c.uid ";
		wsql+="     left join t_pic  as picu2 on u2.avatarid=picu2.picid ";
		wsql+=" where p.posttype = 3 and p.delflag=0 and p.postid in (select postid from t_post_product where pid = #goods_id#)               ";
		wsql+=" order by p.addtime desc                                                                                       ";
		
		String sql = "select p.postid,p.title,p.content,u.uid,p.forwardcount,p.commentcount,b.showcount,b.shopexpcount,b.guidecount, "+
				" u.username,cast(concat(picu.picid,'.',picu.filetype) as char) userpic," +
				"p.content postcontent, cast(concat(picu2.picid,'.',picu2.filetype) as char) cuserpic," +
				"u2.username cusername," +
				"c.commentid,commentcontent "+wsql+" limit #offset#,#size# ";
		
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> expList = dao.queryForList();		
		
		sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		Integer itemCount = dao.queryForInt();
		
		//获取图片
		List<Integer> idList = new ArrayList<Integer>();
		for(PsfItem exp:expList) {
			idList.add(exp.getInt("postid"));
		}
		
		if(idList.size()>0) {
			sql = "select * from v_product_pic where postid in (#postid#)";
			dao.prepare(sql);
			dao.bind("postid", idList);
			List<PsfItem> picList = dao.queryForList();
			for(PsfItem exp:expList) {
				List<PsfItem> picList0 = new ArrayList<PsfItem>();
				exp.put("picList", picList0);
				for(PsfItem pic:picList) {
					if(pic.getInt("postid").equals(pic.getInt("postid"))) {
						picList0.add(pic);
					}
				}
			}
		}
		
		return new PageResult<PsfItem>(expList, itemCount==null?0:itemCount, pp.getPageSize());
	}
	
	public PageResult<PsfItem> querySnsGuidePost(int brand_id,int page) throws Exception {
		PageParam pp = new PageParam(page,4);
		
		String wsql = "";
		wsql+=" from t_post as p ";
		wsql+="     left join t_user as u on p.uid = u.uid ";
		wsql+="     left join t_pic as picu on u.avatarid = picu.picid ";                        
		wsql+="     left join t_user_balance as b on u.uid = b.uid ";
		wsql+="     left join (select oid,uid,commentid,otype,content commentcontent from t_comment c1 where c1.commentid in (    ";
		wsql+="	    select cc.commentid from (                                                                                    ";
		wsql+="		   select p1.postid,max(c1.commentid) commentid                                                              ";
		wsql+="		   from t_comment c1,t_post p1                                                                               ";
		wsql+="		   where c1.oid = p1.postid and c1.otype = p1.posttype                                                       ";
		wsql+="		   group by p1.postid ) as cc)                                                                               ";
		wsql+="     ) as c on p.postid = c.oid and p.posttype = c.otype                                                    ";
		wsql+="     left join t_user as u2 on u2.uid = c.uid ";
		wsql+="     left join t_pic  as picu2 on u2.avatarid=picu2.picid ";
		wsql+="     left join ecs_category as c on c.cat_id = p.cateid ";
		wsql+=" where p.posttype = 4 and p.delflag=0 and p.postid in (select postid from t_post_brand where brandid = #brand_id#)               ";
		wsql+=" order by p.addtime desc                                                                                       ";
		
		String sql = "select p.postid,p.title,p.content,u.uid,p.forwardcount,p.commentcount,b.showcount,b.shopexpcount,b.guidecount, "+
				" u.username,cast(concat(picu.picid,'.',picu.filetype) as char) userpic," +
				" p.content postcontent, cast(concat(picu2.picid,'.',picu2.filetype) as char) cuserpic," +
				" u2.username cusername,c.cat_name,p.cateid, " +
				" c.commentid,commentcontent "+wsql+" limit #offset#,#size# ";
		
		dao.prepare(sql);
		dao.bind("brand_id", brand_id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> guideList = dao.queryForList();
		
		sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("brand_id", brand_id);
		Integer itemCount = dao.queryForInt();
		
		
		//获取图片
		List<Integer> idList = new ArrayList<Integer>();
		for(PsfItem g:guideList) {
			idList.add(g.getInt("postid"));
		}
		
		if(idList.size()>0) {
			sql = "select * from v_product_pic where postid in (#postid#)";
			dao.prepare(sql);
			dao.bind("postid", idList);
			List<PsfItem> picList = dao.queryForList();
			for(PsfItem g:guideList) {
				List<PsfItem> picList0 = new ArrayList<PsfItem>();
				g.put("picList", picList0);
				for(PsfItem pic:picList) {
					if(pic.getInt("postid").equals(pic.getInt("postid"))) {
						picList0.add(pic);
					}
				}
			}
		}
		
		return new PageResult<PsfItem>(guideList, itemCount==null?0:itemCount, pp.getPageSize());
	}
	
	public void getCombineBuyGoods() throws Exception {
		Integer pid = p2int("goods_id");
		Integer page = p2int("page");
		if(page==null) page = 0;
		set("page",page);
		
		String sql = "select goods_name,goods_thumb,shop_price from ecs_goods where goods_id=#goods_id# and is_delete=0 and is_on_sale=1";
		dao.prepare(sql);
		dao.bind("goods_id", pid);
		PsfItem goods = dao.queryForOneRow();
		set("goods",goods);
		
		PageResult<PsfItem> combineGoodsList = queryCombineBuyGoods(pid, new PageParam(page,4));
		set("combineGoodsList",combineGoodsList.getList());
		set("combineGoodsListPrev",page>1);
		set("combineGoodsListNext",combineGoodsList.getPageCount()>page);
		
	}
	
	public PageResult<PsfItem> queryCombineBuyGoods(Integer goods_id,PageParam pp) throws Exception {
		String wsql = "where suppliers_id in " +
				"(select suppliers_id from ecs_goods " +
				"where goods_id=#goods_id#) and goods_id <> #goods_id# and is_delete=0 and is_on_sale=1";
		
		String sql = "select count(1) from ecs_goods " +wsql;
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		Integer itemCount = dao.queryForInt();
		
		sql = "select * from ecs_goods "+wsql+" limit #offset#,#size# ";
		dao.prepare(sql);
		dao.bind("goods_id", goods_id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> result = dao.queryForList();
		PageResult<PsfItem> pr = new PageResult<PsfItem>(result, itemCount, pp.getPageSize());
		return pr;
	}
	
	/*商城列表页*/
	public void list() throws Exception {
		Integer cat_id = p2int("cateid");
		Integer brand_id = p2int("brandid");
		Integer price_min = p2int("pricemin");
		Integer price_max = p2int("pricemax");
		Integer page = p2int("page");
		Integer order = p2int("order"); //0-销量倒序(默认) 1-销量正序 2-价格倒序 3-价格正序
		String attr = p("attr");
		
		if(page==null) page = 1;
		if(order==null || order>3 || order<0) order = 0;
		
		List<Integer> attrValueIdList = null;
		if(attr!=null && attr.trim().length()>0) {
			attrValueIdList = new ArrayList<Integer>();
			String [] goods_attr_ids = attr.split("\\.");
			for(String goods_attr_id:goods_attr_ids) {
				attrValueIdList.add(Integer.parseInt(goods_attr_id));
			}
		}
		
		//查询所有类别
		List cateTree = getCateTreeWithBrands();
		set("current_nav",-1);
		set("cateTree",cateTree);
		
		//获取当前分类
		Map<Integer,PsfItem> cateMap = (Map<Integer, PsfItem>)get("cateMap");
		PsfItem cate = cateMap.get(cat_id);
		if(cate==null) {
			sendError(404);
			return;
		}
		set("currCate",cate);
		set("pageTitle",cate.getString("cat_name")+"_品上商城");
		
		//导航
		String cateNav = getCateNav(cate); 
		set("cateNav",cateNav);
		
		//当前分类的同级分类
		set("brotherCateList",getBrotherCate(cate));
		
		//品牌筛选
		List<PsfItem> brandList = getBrandsByCate(cat_id);
		if(brandList.size()>0) {
			StringBuffer brandFilterHtml = new StringBuffer();
			brandFilterHtml.append("<li><a "+(brand_id==null?"class='selected'":"")+" href='"+getListLink(cat_id,null, price_min, price_max, attrValueIdList, page,order)+"'>全部</a></li>");
			for(PsfItem item:brandList) {
				brandFilterHtml.append("<li><a "+(item.getInt("brand_id").equals(brand_id)?"class='selected'":"")+" href='"+getListLink(cat_id,item.getInt("brand_id"), price_min, price_max, attrValueIdList, page,order)+"'>"+item.getString("brand_name")+"</a></li>");
			}
			set("brandFilter",brandFilterHtml);
		}
		
		//价格筛选
		List<PriceFilter> priceFilterList = getPriceFilter(cate);
		if(priceFilterList!=null) {
			StringBuffer priceFilterHtml = new StringBuffer();
			priceFilterHtml.append("<li><a "+(price_min==null?"class='selected'":"")+" href='"+getListLink(cat_id,brand_id, null,null, attrValueIdList, page,order)+"'>全部</a></li>");
			for(PriceFilter pf:priceFilterList) {
				priceFilterHtml.append("<li><a "+((price_min!=null&&pf.getMinPrice()==price_min)?"class='selected'":"")+" href='"+getListLink(cat_id,brand_id, pf.getMinPrice(), pf.getMaxPrice(), attrValueIdList, page,order)+"'>"+pf.getMinPrice()+"-"+pf.getMaxPrice()+"</a></li>");
			}
			set("priceFilter",priceFilterHtml);
		}
		
		//商品属性筛选
		ListOrderedMap attrHtmlFilterMap = getAttrFilter(cate, cat_id, brand_id, price_min, price_max, page, attrValueIdList,order);
		List<PsfItem> attrHtmlFilterList = new ArrayList<PsfItem>();
		if(attrHtmlFilterMap!=null) {
			int attrCount = attrHtmlFilterMap.asList().size();
			for(int i=0;i<attrCount;i++) {
				attrHtmlFilterList.add((PsfItem)attrHtmlFilterMap.getValue(i));
			}
			set("attrHtmlFilterList",attrHtmlFilterList);
		}
		
		//排序
		if(order==0) {
			set("salesOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 1));
			set("priceOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 3));
		} else if(order==1) {
			set("salesOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 0));
			set("priceOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 3));
		} else if(order==2) {
			set("salesOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 0));
			set("priceOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 3));
		} else {
			set("salesOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 0));
			set("priceOrderLink",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, page, 2));
		}
		set("listOrder",order);
		
		//商品列表
		PageResult<PsfItem> goodsResult = getGoodsList(cat_id,brand_id,price_min,price_max,
				attrValueIdList,new PageParam(page, 20),order);
		set("goodsList",goodsResult.getList());
		set("page",page);
		set("pageCount",goodsResult.getPageCount());
		set("pageHref",getListLink(cat_id, brand_id, price_min, price_max, attrValueIdList, null,order));
		
	}
	
	/*
	 * 获取类别列表链接
	 */
	public String getListLink(Integer cat_id,Integer brand_id,Integer price_min,Integer price_max,
			List<Integer> attrValueIdList,Integer page,Integer order) throws Exception {
		StringBuffer sbLink = new StringBuffer();
		sbLink.append("/list?cateid="+cat_id);
		if(brand_id!=null) sbLink.append("&brandid="+brand_id);
		if(price_min!=null && price_max!=null) {
			sbLink.append("&pricemin="+price_min);
			sbLink.append("&pricemax="+price_max);
		}
		if(attrValueIdList!=null && attrValueIdList.size()>0) {
			StringBuffer sbAttr = new StringBuffer();
			int size = attrValueIdList.size();
			for(int i=0;i<size;i++) {
				sbAttr.append(attrValueIdList.get(i));
				if(i<size-1) {
					sbAttr.append(".");
				}
			}
			sbLink.append("&attr="+sbAttr);
		}
		if(page!=null) {
			sbLink.append("&page="+page);
		}
		if(order!=0) {
			sbLink.append("&order="+order);
		}
		
		return sbLink.toString();
	}
	
	/**
	 * 获取属性过滤器
	 * @param cate
	 * @param cat_id
	 * @param brand_id
	 * @param price_min
	 * @param price_max
	 * @param page
	 * @param attr_value_id
	 * @return
	 * @throws Exception
	 */
	public ListOrderedMap getAttrFilter(PsfItem cate,Integer cat_id,Integer brand_id,Integer price_min,Integer price_max,
			Integer page,List<Integer> attrValueIdList,Integer order) throws Exception {
		String filter_attr_str = cate.getString("filter_attr");
		if(filter_attr_str!=null && filter_attr_str.trim().length()>0) {
			String [] filter_attrs = filter_attr_str.split("\\,");
			List<Integer> attrIdList = new ArrayList<Integer>();
			for (String str_attr:filter_attrs) {
				attrIdList.add(Integer.parseInt(str_attr));
			}
			
			String sql = "select attr_value_id,attr_id,attr_name,attr_value from v_attr_value where attr_id in (#attrIdList#)";
			dao.prepare(sql);
			dao.bind("attrIdList", attrIdList);
			List<PsfItem> attrValueList = dao.queryForList();
			set("attrValueList",attrValueList);
			
			//Map key->attr_id value->List<attr_value_id>
			HashMap<Integer, List<Integer>> attrValueIdMap = new HashMap<Integer, List<Integer>>();
			for(PsfItem attrValue:attrValueList) {
				Integer attr_id = attrValue.getInt("attr_id");
				List<Integer> list = null;
				if(attrValueIdMap.containsKey(attr_id)) {
					list = attrValueIdMap.get(attr_id);
				} else {
					list = new ArrayList<Integer>();
					attrValueIdMap.put(attr_id, list);
				}
				list.add(attrValue.getInt("attr_value_id"));
			}
			set("attrValueIdMap",attrValueIdMap);
			
			//key->attr_id value->PsfItem<attr_name,html>
			ListOrderedMap attrHtmlMap = new ListOrderedMap();
			for(Integer attr_id:attrIdList) {
				for(PsfItem attrValue:attrValueList) {
					if(attr_id.equals(attrValue.getInt("attr_id"))) {
						Integer attr_value_id = attrValue.getInt("attr_value_id");
						List<Integer> attrValueIdListThis = attrValueIdMap.get(attr_id);
						List<Integer> attrValueIdListNew = new ArrayList<Integer>();
						if(attrValueIdList!=null) {
							for(Integer attrValueId:attrValueIdList) {
								if(attrValueIdListThis!=null && (!attrValueIdListThis.contains(attrValueId))) {
									attrValueIdListNew.add(attrValueId);
								}
							}
						}
						
						PsfItem attrHtmlItem = null;
						if(attrHtmlMap.containsKey(attr_id)) {
							attrHtmlItem = (PsfItem)attrHtmlMap.get(attr_id);
						} else {
							attrHtmlItem = new PsfItem();
							StringBuffer sbHtml = new StringBuffer();
							attrHtmlItem.put("attr_id", attr_id);
							attrHtmlItem.put("attr_name",attrValue.getString("attr_name"));
							attrHtmlItem.put("html", sbHtml);
							attrHtmlMap.put(attr_id, attrHtmlItem);
							boolean seleced = true;
							
							if(attrValueIdList!=null) {
								for(Integer attrValueId:attrValueIdList) {
									if(attrValueIdListThis.contains(attrValueId)) {
										seleced = false;
										break;
									}
								}
							}
							
							sbHtml.append("<li><a "+(seleced?"class='selected'":"")
									+" href='"+getListLink(cat_id, brand_id, price_min, price_max, attrValueIdListNew,page,order)+"'>全部</a></li>");
						}
						
						attrValueIdListNew.add(attr_value_id);
						StringBuffer sbHtml = (StringBuffer)attrHtmlItem.get("html");
						sbHtml.append("<li><a "+(attrValueIdList!=null && attrValueIdList.contains(attr_value_id)?"class='selected'":"")
								+" href='"+getListLink(cat_id, brand_id, price_min, price_max, attrValueIdListNew, page,order)+"'>"
								+attrValue.getString("attr_value")+"</a></li>");
						
					}
				}
			}
			
			return attrHtmlMap;
		}
		return null;
	}
	
	/**
	 * 商城首页
	 * @throws Exception
	 */
	public void index() throws Exception {
		
		List cateTree = getCateTreeWithBrands();
		set("current_nav",0);
		set("cateTree",cateTree);
		set("promoteGoodsList",getPromoteGoods());
		set("hotGoodsList",getHotGoods(cateTree));
	}
	
	public List<PriceFilter> getPriceFilter(PsfItem cate) throws Exception {
		Integer grade = cate.getInt("grade");
		List<PriceFilter> list = null;
		if(grade>0) {
			String sql = "select min(shop_price) min_price,max(shop_price) max_price from ecs_goods " +
				"where is_delete=0 and is_on_sale=1 and is_alone_sale=1 and cat_id in (#cat_ids#)";
			dao.prepare(sql);
			dao.bind("cat_ids", getCateChildrenIdList(cate.getInt("cat_id")));
			PsfItem priceItem = dao.queryForOneRow();
			BigDecimal min_Price = priceItem.getDecimal("min_price");
			BigDecimal max_Price = priceItem.getDecimal("max_price");
			if(min_Price!=null && max_Price!=null) {
				int minPrice0 = min_Price.intValue();
				int maxPrice0 = max_Price.intValue();
				
				int span = maxPrice0-minPrice0;
				int spanPerGrade = span/grade;
				int numWidth = (int)Math.log10(spanPerGrade);
				int n = (int)Math.pow(10, numWidth);
				int nSpan = n*(int)Math.ceil((double)spanPerGrade/(double)n);
				int minPrice = (int)Math.floor((double)minPrice0/n)*n;
				int maxPrice = (int)Math.ceil((double)maxPrice0/n)*n;
				
				list = new ArrayList<PriceFilter>();
				for(int i = minPrice;i <= maxPrice; i+=nSpan) {
					list.add(new PriceFilter(i, i+nSpan));
				}
			}
		}
		return list;
	}
	
	/**
	 * 根据分类查询品牌
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public List getBrandsByCate(Integer cat_id) throws Exception {
		List<PsfItem> cateBrands = (List<PsfItem>)get("cateBrands");
		if(cateBrands==null) throw new Exception("call getCateBrands first");
		List<Integer> childrenCateIds = getCateChildrenIdList(cat_id);
		List<PsfItem> brandList = new ArrayList<PsfItem>();
		for(PsfItem item:cateBrands) {
			if(childrenCateIds.contains(item.getInt("cat_id"))) {
				brandList.add(item);
			}
		}
		return brandList;
	}
	
	/**
	 * 查询商品列表
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public PageResult<PsfItem> getGoodsList(Integer cat_id,Integer brand_id,
			Integer price_min,Integer price_max,List<Integer> attrValueIdList,
			PageParam pp,Integer order) throws Exception {
		
		PageResult<PsfItem> pageResult = null;
		
		String wsql =" where cat_id in (#cat_ids#) ";
		
		if(brand_id!=null) wsql+=" and brand_id=#brand_id# ";
		if(price_min!=null) wsql+=" and shop_price>=#price_min# ";
		if(price_max!=null) wsql+=" and shop_price<=#price_max# ";
		
		if(attrValueIdList!=null) {
			//该数据由getAttrFilter方法设置
			List<PsfItem> attrValueList = (List<PsfItem>)get("attrValueList");
			//PsfItem<attr_id,attr_value_id)
			List<PsfItem> attrValueItemList = new ArrayList<PsfItem>();
			for(Integer attrValueId:attrValueIdList) {
				PsfItem attrValueItem = new PsfItem();
				for(PsfItem av:attrValueList) {
					if(av.getInt("attr_value_id").equals(attrValueId)) {
						attrValueItem.put("attr_value_id", attrValueId);
						attrValueItem.put("attr_id", av.get("attr_id"));
						attrValueItemList.add(attrValueItem);
					}
				}
			}
			wsql+=" and goods_id not in (select goods_id from ecs_goods_attr ga,v_attr_value av ";
			wsql+=" where ga.attr_id = av.attr_id and ga.attr_value = av.attr_value and (1<>1 ";
			for(PsfItem avi:attrValueItemList) {
				wsql+=" or (av.attr_id="+avi.getInt("attr_id")+" and av.attr_value_id<>"+avi.getInt("attr_value_id")+") ";
			}
			wsql+="))";
		}
		
		wsql+=" order by ";
		
		if(order==0) {
			wsql+=" click_count desc ";
		} else if(order==1) {
			wsql+=" click_count ";
		} else if(order==2) {
			wsql+=" shop_price desc ";
		} else {
			wsql+=" shop_price ";
		}
		
		
		String sqlCount = "select count(1) from ecs_goods "+wsql;
		String sql = "select * from ecs_goods "+wsql+" limit #offset#,#size#";
		
		List<Integer> cateChildrenIdList = getCateChildrenIdList(cat_id);
		
		dao.prepare(sqlCount);
		dao.bind("cat_ids", cateChildrenIdList);
		dao.bind("brand_id", brand_id);
		dao.bind("price_min", price_min);
		dao.bind("price_max", price_max);
		Integer itemCount = dao.queryForInt();
		
		dao.prepare(sql);
		dao.bind("cat_ids", cateChildrenIdList);
		dao.bind("brand_id", brand_id);
		dao.bind("price_min", price_min);
		dao.bind("price_max", price_max);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		
		List result = dao.queryForList();
		
		pageResult = new PageResult<PsfItem>(result, itemCount, pp.getPageSize());
		
		return pageResult;
	}
	
	/**
	 * 获取同级分类(不包含本身)
	 * @param cate
	 * @return
	 * @throws Expceiton
	 */
	public List getBrotherCate(PsfItem cate) throws Exception {
		if(cate==null) return null;
		List<PsfItem> cateList = (List<PsfItem>)get("cateList");
		List<PsfItem> brotherCateList = new ArrayList<PsfItem>(); 
		Integer parent_id = cate.getInt("parent_id");
		Integer cat_id = cate.getInt("cat_id");
		for (PsfItem item:cateList) {
			if(item.getInt("parent_id").equals(parent_id) && (!item.getInt("cat_id").equals(cat_id))) {
				brotherCateList.add(item);
			}
		}
		return brotherCateList;
	}
	
	/**
	 * 获得商品分类导航
	 * @param cat_id
	 * @param cateTree
	 * @return
	 * @throws Exception
	 */
	public String getCateNav(PsfItem cate) throws Exception {
		Map<Integer,PsfItem> cateMap = (Map<Integer, PsfItem>)get("cateMap");
		PsfItem currCate = cate;
		String nav = "";
		while(true) {
			if(currCate==null) break;
			nav = " &gt; <a href='/list?cateid="+currCate.get("cat_id")+"'>" + currCate.get("cat_name") + "</a>" + nav;
			if(currCate.getInt("parent_id")==0) break;
			currCate = cateMap.get((Integer)currCate.get("parent_id"));
		}
		nav = "<a href='/mall'>首页</a>"+nav;
		return nav;
	}
	
	/**
	 * 获取商品分类树
	 * @return
	 * @throws Exception
	 */
	public List getCateTree() throws Exception {
		String sql = "select * from ecs_category where is_show=1 order by sort_order,cat_name";
		dao.prepare(sql);
		List<PsfItem> cateList = dao.queryForList();
		Map<Integer,PsfItem> cateMap = new HashMap<Integer, PsfItem>();
		for(PsfItem m:cateList) {
			cateMap.put(m.getInt("cat_id"), m);
		}
		set("cateMap",cateMap);
		set("cateList",cateList);
		
		List<PsfItem> cateTreeList = processCateChildren(0, cateList,0,null);
		
		return cateTreeList;
	}
	
	/**
	 * 获取子类别所有的ID，包括本类别
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public List<Integer> getCateChildrenIdList(Integer cat_id) throws Exception {
		List<Integer> childrenIdList = new ArrayList<Integer>();
		Map<Integer,PsfItem> cateMap = (Map<Integer,PsfItem>)get("cateMap");
		processCateChildrenIdList(cat_id, childrenIdList, cateMap);
		return childrenIdList;
	}
	
	protected void processCateChildrenIdList(Integer cat_id,List<Integer> childrenIdList,Map<Integer,PsfItem> cateMap) throws Exception {
		childrenIdList.add(cat_id);
		PsfItem cate = cateMap.get(cat_id);
		List<PsfItem> children = cate.getList("children");
		for(PsfItem item:children) {
			processCateChildrenIdList(item.getInt("cat_id"), childrenIdList, cateMap);
		}
	}
	
	/**
	 * 
	 * @param parent_id
	 * @param cateList
	 * @return
	 * @throws Exception
	 */
	public List processCateChildren(Integer parent_id,List<PsfItem> cateList,Integer top_id,List topChildrenList) throws Exception {
		List<PsfItem> cateChildrenList = new ArrayList<PsfItem>();
		for (PsfItem m:cateList) {
			if(m.get("parent_id").equals(parent_id)) {
				Integer cat_id = (Integer)m.get("cat_id");
				Integer top_id0 = (parent_id==0)?cat_id:top_id;
				List topChildrenList0 = topChildrenList;
				if(topChildrenList0==null) topChildrenList0 = new ArrayList();
				m.put("top_id", top_id0);
				m.put("top_children_id",topChildrenList0);
				topChildrenList0.add(cat_id);
				m.put("children", processCateChildren(cat_id, cateList,top_id0,topChildrenList0));
				cateChildrenList.add(m);
			}
		}
		return cateChildrenList;
	}
	
	/**
	 * 获取促销商品
	 * @return
	 * @throws Exception
	 */
	public List getPromoteGoods() throws Exception {
		String sql = "";
		sql+="select g.goods_id, g.goods_name, g.goods_name_style, g.market_price, g.shop_price as org_price, g.promote_price, ifnull(mp.user_price, g.shop_price * '1') as shop_price, promote_start_date, promote_end_date, g.goods_brief, g.goods_thumb, goods_img, b.brand_name, g.is_best, g.is_new, g.is_hot, g.is_promote, rand() as rnd "; 
		sql+="from ecs_goods as g left join ecs_brand as b on b.brand_id = g.brand_id left join ecs_member_price as mp on mp.goods_id = g.goods_id and mp.user_rank = '0' ";
		sql+="where g.is_on_sale = 1 and g.is_alone_sale = 1 and g.is_delete = 0 and g.is_promote = 1 and promote_start_date <= #date# AND promote_end_date >= #date# ORDER BY g.sort_order, g.last_update DESC LIMIT 4";
		dao.prepare(sql);
		dao.bind("date", new PsfTime().getTimeInSeconds());
		return dao.queryForList();
	}
	
	/**
	 * 热品速递
	 *
	 */
	public List getHotGoods(List<PsfItem> cateTree) throws Exception {
		StringBuffer sql = new StringBuffer();
		
		sql.append("(select g.goods_id,g.goods_name,g.shop_price,g.market_price,g.goods_thumb,0 cat_id ");
		sql.append("from ecs_goods as g ");
		sql.append("where g.is_on_sale = 1 and g.is_alone_sale = 1 and g.is_delete = 0 and g.is_hot = 1 ");
		sql.append("order by g.sort_order, g.last_update desc limit 10) ");
		
		for(PsfItem m:cateTree) {
			sql.append("union all (select g.goods_id,g.goods_name,g.shop_price,g.market_price,g.goods_thumb,"+m.get("cat_id")+" cat_id ");
			sql.append("from ecs_goods as g ");
			sql.append("where g.is_on_sale = 1 and g.is_alone_sale = 1 and g.is_delete = 0 and g.is_hot = 1 and g.cat_id in(#cates_"+m.get("cat_id")+"#) ");
			sql.append("order by g.sort_order, g.last_update desc limit 10 ) ");
		}
		
		dao.prepare(sql.toString());
		
		for(PsfItem m:cateTree) {
			dao.bind("cates_"+m.get("cat_id"), m.get("top_children_id"));
		}
		
		List result = dao.queryForList();
		
		return result;
	}
	
	/**
	 * 新鲜商品
	 */
	public List getFreshGoods() throws Exception {
		return null;
	}
	
	/**
	 * 附带品牌信息
	 * @return
	 * @throws Exception
	 */
	public List getCateTreeWithBrands() throws Exception {
		List<PsfItem> cateTreeList = getCateTree();
		
		//查询品牌，将品牌加到Map中
		List<PsfItem> brandList = getCateBrands();
		Map<Integer, List> brandMap = new HashMap<Integer, List>();
		for (PsfItem mBrand:brandList) {
			Integer cat_id = (Integer)mBrand.get("cat_id");
			List cateBrandList = (List)brandMap.get(cat_id);
			if(cateBrandList==null) {
				cateBrandList = new ArrayList();
				brandMap.put(cat_id, cateBrandList);
			}
			cateBrandList.add(mBrand);
		}
		
		//将品牌附加到顶级类别当中
		for (PsfItem topCate:cateTreeList) {
			List cateBrandList = new ArrayList();
			topCate.put("brandList", cateBrandList);
			addBrandsToTopCate(topCate,topCate, brandMap);
		}
		
		return cateTreeList;
	}
	
	/**
	 * 顶级商品类别的品牌
	 * @param topCate
	 * @param brandMap
	 * @throws Exception
	 */
	protected void addBrandsToTopCate(PsfItem topCate,PsfItem parentCate,Map<Integer, List> brandMap) throws Exception {
		List topCateBrandList = (List)topCate.get("brandList");
		Integer cat_id = (Integer) parentCate.get("cat_id");
		List cateBrandList = brandMap.get(cat_id);
		if(cateBrandList!=null) {
			topCateBrandList.addAll(cateBrandList);
		}
		List<PsfItem> children = (List<PsfItem>)parentCate.get("children");
		if(children!=null) {
			for(PsfItem m:children) {
				addBrandsToTopCate(topCate, m, brandMap);
			}
		}
	}
	
	/**
	 * 获取类别的品牌
	 * @return
	 * @throws Exception
	 */
	public List getCateBrands() throws Exception {
		String sql = "";
		sql+="select g.cat_id,b.brand_id,b.brand_name,b.brand_logo,b.brand_desc,count(*) as goods_num,if(b.brand_logo > '', '1', '0') as tag ";
		sql+="from ecs_brand as b,ecs_goods as g ";
		sql+="where g.brand_id = b.brand_id and is_show = 1 and g.is_on_sale = 1 and g.is_alone_sale = 1 and g.is_delete = 0 ";
		sql+="group by b.brand_id,g.cat_id having goods_num > 0 order by tag desc, b.sort_order ASC ";
		dao.prepare(sql);
		List cateBrands = dao.queryForList();
		set("cateBrands",cateBrands);
		return cateBrands;
	}
	
	/**
	 * 问题列表
	 * @throws Exception
	 */
	public void getQuestion() throws Exception {
		Integer pid = p2int("pid");
		Integer page = p2int("page");
		if(page==null) page = 1;
		
		PageParam pp = new PageParam(page,10);
		
		String wsql = " from v_post where delflag=0 and posttype="+Psf.OTYPE_Question+
			" and typeid=#pid# and replyid=0 order by addtime desc ";
		
		String sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("pid", pid);
		Integer itemCount = dao.queryForInt();
		
		sql = "select * "+wsql+" limit #offset#,#size# ";
		dao.prepare(sql);
		dao.bind("pid", pid);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> questionList =  dao.queryForList();
		
		for(PsfItem q:questionList) {
			PageResult<PsfItem> answerList = queryAnswer(q.getInt("postid"), 1);
			q.put("answerList", answerList.getList());
			q.put("hasMore", answerList.getPageCount()>1);
			//设置时间
			int addtime = q.getInt("addtime");
			q.put("straddtime", new PsfTime(addtime).toChnDateString());
		}
		
		PageResult<PsfItem> questionPageResult = new PageResult<PsfItem>(questionList, itemCount, pp.getPageSize());
		set("pageCount",questionPageResult.getPageCount());
		set("page",page);
		set("questionList",questionList);
		
	}
	
	public void getOneQuestion() throws Exception {
		Integer qid = p2int("qid");
		if(qid==null) throw new Exception("qid不能为空");
		
		String sql = "select * from v_post where delflag=0 and postid=#qid# and posttype="+Psf.OTYPE_Question;
		dao.prepare(sql);
		dao.bind("qid", qid);
		PsfItem q = dao.queryForOneRow();
		if(q==null) throw new Exception("问题未找到");
		
		PageResult<PsfItem> answerList = queryAnswer(q.getInt("postid"), 1);
		q.put("answerList", answerList.getList());
		q.put("hasMore", answerList.getPageCount()>1);
		//设置时间
		int addtime = q.getInt("addtime");
		q.put("straddtime", new PsfTime(addtime).toChnDateString());
		
		set("q",q);
	}
	
	/**
	 * 查询评论
	 * @param id
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageResult<PsfItem> queryComment(Integer id,Integer page) throws Exception {
		PageParam pp = new PageParam(page,10);
		
		String wsql = " from v_comment where otype="+Psf.OTYPE_Question+" and oid=#id# order by addtime desc ";
		
		String sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("id", id);
		Integer itemCount = dao.queryForInt();
		
		sql = "select * "+wsql+" limit #offset#,#size#";
		dao.prepare(sql);
		dao.bind("id", id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> commentList = dao.queryForList();
		
		for(PsfItem c:commentList) {
			Integer addtime = c.getInt("addtime");
			c.put("straddtime", new PsfTime(addtime).toChnDateString());
		}
		
		return new PageResult<PsfItem>(commentList, itemCount, pp.getPageSize());
	}
	
	/**
	 * 查询答案
	 * 
	 */
	public PageResult<PsfItem> queryAnswer(Integer id,Integer page) throws Exception {
		String wsql = " from v_post where posttype="+Psf.OTYPE_Question+
			" and replyid=#id# order by addtime desc";
		
		PageParam pp = new PageParam(page,10);
		
		String sql = "select count(1) "+wsql;
		dao.prepare(sql);
		dao.bind("id", id);
		Integer itemCount = dao.queryForInt();
		
		sql = "select * "+wsql+" limit #offset#,#size#";
		dao.prepare(sql);
		dao.bind("id", id);
		dao.bind("offset", pp.getOffset());
		dao.bind("size", pp.getPageSize());
		List<PsfItem> answerList = dao.queryForList();
		
		for(PsfItem a:answerList) {
			int addtime = a.getInt("addtime");
			a.put("straddtime", new PsfTime(addtime).toChnDateString());
			
			PageResult<PsfItem> commentResult = queryComment(a.getInt("postid"), 1);
			a.put("hasMore", commentResult.getPageCount()>1);
			a.put("commentList", commentResult.getList());
		}
		
		return new PageResult<PsfItem>(answerList, itemCount, pp.getPageSize());
	}
	
	/**
	 * 保存问题
	 * @throws Exception
	 */
	public void submitQuestion() throws Exception {
		try {
			Integer uid = getLoginUserId();
			String content = p("content");
			Integer pid = p2int("pid");
			Integer replyid = p2int("replyid");
			
			if(replyid==null) replyid = 0;
			
			if(uid==null) {
				throw new Exception("尚未登录不能提问");
			}
			
			if(content==null || content.trim().length()==0) {
				throw new Exception("提问内容不能为空");
			}
			
			if(pid==null || pid==0) {
				throw new Exception("pid字段必须提供值");
			}
			
			int now = new PsfTime().getTimeInSeconds();
			
			TPost post = new TPost();
			post.setUid(uid);
			post.setContent(content);
			post.setAddip(getHexIP());
			post.setAddtime(now);
			post.setCateid(0);
			post.setPosttype(Psf.OTYPE_Question);
			post.setDelflag(0);
			post.setCommentcount(0);
			post.setForwardcount(0);
			post.setReplyid(replyid);
			post.setLastreplytime(now);
			post.setSharecount(0);
			post.setShareid(0);
			post.setForwardid(0);
			post.setLikecount(0);
			post.setTypeid(pid);
			
			dao.insert(post);
			
			set("success",1);
			set("qid",replyid);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void submitComment() throws Exception {
		try {
			Integer qid = p2int("qid");
			Integer aid = p2int("aid");
			String content = p("content");
			Integer uid = getLoginUserId();
			
			if(uid==null) throw new Exception("未登录不能发表评论");
			
			if(content==null || content.trim().length()==0) {
				throw new Exception("内容不能为空");
			}
			
			Integer now = new PsfTime().getTimeInSeconds();
			
			TComment c = new TComment();
			c.setAddip(getHexIP());
			c.setAddtime(now);
			c.setContent(content);
			c.setDelflag(0);
			c.setHaschild(0);
			c.setOid(aid);
			c.setOtype(Psf.OTYPE_Question);
			c.setReplyid(0);
			c.setToid(0);
			c.setTouid(0);
			c.setUid(uid);
			dao.insert(c);
			
			String sql = "update t_post set commentcount = (select cnt from ((select count(1) cnt from t_comment where oid=#oid# and otype=#otype#) tmp)) where postid=#oid#";
			dao.prepare(sql);
			dao.bind("oid", aid);
			dao.bind("otype", Psf.OTYPE_Question);
			dao.update();
			
			set("success",1);
			set("qid",qid);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void getMoreAnswer() throws Exception {
		Integer qid = p2int("qid");
		Integer page = p2int("page");
		
		PageResult<PsfItem> answerResult = queryAnswer(qid, page);
		
		set("answerList",answerResult.getList());
		set("hasMore",answerResult.getPageCount()>page);
		
	}
	
	public void getMoreComment() throws Exception {
		Integer aid = p2int("aid");
		Integer page = p2int("page");
		
		PageResult<PsfItem> commentResult = queryComment(aid, page);
		
		set("commentList",commentResult.getList());
		set("hasMore",commentResult.getPageCount()>page);
		
	}
	
	public void addToCart() throws Exception {
		UUID.randomUUID().toString();
	}
	
	public void getCartList() throws Exception {
		
	}
	
}
