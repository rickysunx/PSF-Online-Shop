package psf.service.common;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.FileNameAndType;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfImage;
import psf.common.PsfTime;
import psf.entity.TPic;
import psf.entity.TPicContent;

/**
 * 图片
 * 
 * @author 王艳芳
 */
public class PicService extends PsfService {
	/**
	 * 新增图片
	 */
	public Integer addPic(Integer uid, String fileName, byte[] picdata, Integer oid, Integer otype, String addip) throws Exception {
		int addtime = new PsfTime().getTimeInSeconds();
		int iscover = 0;
		
		int _fileSize = picdata.length;
		FileNameAndType fnt = new FileNameAndType(fileName);
		String _fileName = fnt.getFileName();
		String _fileType = fnt.getFileType();
		
		TPic pic = new TPic();
		pic.setAddip(addip);	
		pic.setAddtime(addtime);	
		pic.setFilename(_fileName);	
		pic.setFilesize(_fileSize);	
		pic.setFiletype(_fileType);	
		pic.setIscover(iscover);	
		pic.setOid(oid);	
		pic.setOtype(otype);	
		pic.setPictitle(null);	
		pic.setUid(uid);	
		Integer picid = dao.insert(pic);
		
		TPicContent picContent = new TPicContent();
		picContent.setPicid(picid);
		picContent.setThumbid(0);
		PsfImage psfImage = new PsfImage(picdata);
		BufferedImage bfImage = psfImage.getImage();
		picContent.setHeight(bfImage.getHeight());
		picContent.setWidth(bfImage.getWidth());
		picContent.setContent(picdata);
		dao.insert(picContent);
		
		return picid;
	}
	
	public void saveThumb(Integer picid,Integer thumbid,byte [] content) throws Exception {
		TPicContent pc = new TPicContent();
		pc.setPicid(picid);
		pc.setThumbid(thumbid);
		PsfImage psfImage = new PsfImage(content);
		BufferedImage bfImage = psfImage.getImage();
		pc.setHeight(bfImage.getHeight());
		pc.setWidth(bfImage.getWidth());
		pc.setContent(content);
		sqlmap.delete("pic.delPicContent",pc);
		dao.insert(pc);
	}

	/**
	 * 读取图片信息
	 */
	public byte[] getPicData(Integer picid, Integer thumbid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("picid", picid);
		param.put("thumbid", thumbid);
		TPicContent picContent = (TPicContent) sqlmap.queryForObject("pic.getPicContent", param);
		
		return picContent==null?null:picContent.getContent();
	}

	/**
	 * 更新图片
	 */
	public void updatePic(Integer picid, Integer oid, int otype) throws Exception {
		updatePic(new Integer[] { picid }, oid, otype);
	}

	/**
	 * 更新图片
	 */
	public void updatePic(Integer[] picids, Integer oid, int otype) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("picids", picids);
		param.put("otype", otype);
		param.put("oid", oid);
		sqlmap.update("pic.updatePic", param);
	}
	
	public void updatePic(TPic pic) throws Exception {
		dao.update(pic);
	}
	
	/**
	 * 根据PicID查询图片
	 */
	public TPic queryPicByPicId(Integer picid) throws Exception {
		return (TPic)sqlmap.queryForObject("pic.queryByPicId", picid);
	}
	
	/**
	 * 根据对象ID和对象类型查询图片,如果分页参数为null，则为不分页查询
	 */
	public PageResult<TPic> queryPicByOid(Integer otype, Integer oid, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		if(pp == null){
			List<TPic> piclist = sqlmap.queryForList("pic.queryPicByOid", param);
			return new PageResult<TPic>(piclist);
 		}else{
 			Integer count = (Integer) sqlmap.queryForObject("pic.queryPicByOidForCount", param);
 			param.put("offset", pp.getOffset());
 			param.put("pageSize", pp.getPageSize());
 			List<TPic> piclist = sqlmap.queryForList("pic.queryPicByOidForPage", param);
 			return new PageResult<TPic>(piclist, count, pp.getPageSize());
 		}
	}
	
	/**
	 * @author 肖慧
	 * @param picid
	 * @throws Exception
	 */
	public void delPic(Integer picid) throws Exception {
		sqlmap.delete("pic.deleteByPicId", picid);
	}
	
	/**
	 * 更新所有图片的宽度和高度
	 * @throws Exception
	 */
	public void updataAllPicContent() throws Exception {
		List<TPicContent> pcs = sqlmap.queryForList("pic.queryAllPicContent");
		for(TPicContent pc : pcs){
			BufferedImage bfImage = new PsfImage(pc.getContent()).getImage();
			if(bfImage != null){
				pc.setWidth(bfImage.getWidth());
				pc.setHeight(bfImage.getHeight());
			}else{
				pc.setWidth(0);
				pc.setHeight(0);
			}
			sqlmap.update("pic.updataPicContent", pc);
		}
	}
}
