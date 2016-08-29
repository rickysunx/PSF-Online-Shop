package psf.action.common;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import psf.Psf;
import psf.PsfAction;
import psf.common.FileNameAndType;
import psf.common.PsfImage;
import psf.common.PsfUtils;
import psf.entity.TGroup;
import psf.entity.TPic;
import psf.entity.TUser;
import psf.entity.TUser0;
import psf.framework.ActionContext;

public class PicAction extends PsfAction {
	
	public static final int ImageFileMaxSize = 10*1024*1024;
	
	public FileItem getUploadFile() throws Exception {
		HttpServletRequest request = ActionContext.currentActionContext().getRequest();
		boolean bMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
		if(bMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setSizeMax(500*1024*1024);
			List<FileItem> itemList = fileUpload.parseRequest(request);
			
			for (FileItem item : itemList) {
				if(!item.isFormField()) {
					return item;
				}
			}
		}
		return null;
	}
	
	public void getAvatarPic() throws Exception {
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		Integer d = p2int("d");
		if(d==null) d = 0;
		d = d%4;
		String uri = getURI();
		String picName = uri.substring("/avatar/".length());
		int index = picName.indexOf(".");
		if(index==-1) {
			response.sendError(404);
			return;
		}
		picName = picName.substring(0,index);
		Integer picid = 0;
		try {
			picid = Integer.parseInt(picName);
		} catch (NumberFormatException e) {
			response.sendError(404);
			return;
		}
		byte [] picData = picService.getPicData(picid, 0);
		if(picData==null) {
			response.sendError(404);
			return;
		}
		
		PsfImage oldImage = new PsfImage(picData);
		PsfImage newImage = oldImage.rotateImage(d);
		byte [] content = newImage.getBytes();
		
		response.setContentLength(content.length);
		OutputStream out = response.getOutputStream();
		out.write(content);
		out.flush();
	}

	public void getPic() throws Exception {
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		
		String uri = getURI();
		String picName = uri.substring("/pic/".length());
		FileNameAndType fnt =new FileNameAndType(picName);
		String fileName = fnt.getFileName();
		String fileType = fnt.getFileType();
		Integer picid = 0;
		Integer thumbid = 0;
		try {
			if(fileName==null) {
				response.sendError(404);
				return;
			}
			int n = fileName.indexOf("-");
			if(n!=-1) {
				picid = Integer.parseInt(fileName.substring(0,n));
				thumbid = Integer.parseInt(fileName.substring(n+1));
			} else {
				picid = Integer.parseInt(fileName);
			}
		} catch (NumberFormatException e) {
			response.sendError(404);
			return;
		}
		
		byte [] picData = picService.getPicData(picid, thumbid);
		
		if(picData==null) {
			if(thumbid!=0) {
				TPic pic = picService.queryPicByPicId(picid);
				if(pic!=null) {
					byte [] picData0 = picService.getPicData(picid, 0);
					if(picData0!=null) {
						fixThumb(pic.getPicid(),pic.getOtype(), picData0);
						picData = picService.getPicData(picid, thumbid);
					}
				}
			}
		}
		
		
		if(picData==null) {
			response.sendError(404);
		} else {
			response.setContentType("image/"+fileType);
			OutputStream out = response.getOutputStream();
			out.write(picData);
		}
		
	}
	
	public void fixThumb(int picid,int otype,byte [] picData) throws Exception {
		int t = otype;
		PsfImage compressedImage = new PsfImage(picData);
		List<PsfImage> thumbList = new ArrayList<PsfImage>();
		if(t==Psf.OTYPE_Blog) {
			thumbList.add(compressedImage.createThumb(160, 160));
		} else if(t==Psf.OTYPE_Show) {
			thumbList.add(compressedImage.createThumb(-1, 135));
			thumbList.add(compressedImage.createThumb(500, -1));
		} else if(t==Psf.OTYPE_Shopexp) {
			thumbList.add(compressedImage.createThumb(-1, 50));
			thumbList.add(compressedImage.createThumb(380, -1));
		} else if(t==Psf.OTYPE_Guide) {
			thumbList.add(compressedImage.createThumb(160, 160));
		}
		for (int i = 0; i < thumbList.size(); i++) {
			picService.saveThumb(picid, i+1, thumbList.get(i).getBytes());
		}
	}
	
	
	public void saveAvatar() throws Exception {
		int d = p2int("d");
		String fileName = p("filename");
		int x = p2int("x");
		int y = p2int("y");
		int w = p2int("w");
		int h = p2int("h");
		Integer uid = getLoginUserId();
		Integer groupid = p2int("groupid");
		
		try {
			
			if(uid==null) throw new Exception("未登录");
			
			int index = fileName.lastIndexOf(".");
			Integer picid = Integer.parseInt(fileName.substring(0,index));
			
			TPic pic = picService.queryPicByPicId(picid);
			if(!pic.getUid().equals(getLoginUserId())) {
				throw new Exception("上传用户和登录用户不一致");
			}
			
			byte [] content = picService.getPicData(picid, 0);
			if(content==null) throw new Exception("查找图片出错");
			
			
			PsfImage oldImage = new PsfImage(content);
			PsfImage avatarImage = oldImage.rotateImage(d).clipImage(x*2, y*2, w*2, h*2).createThumb(180, 180);
			
			Integer avatarPicId = null;
			if(groupid == null){
				avatarPicId = picService.addPic(getLoginUserId(), fileName, avatarImage.getBytes(), uid, Psf.OTYPE_Avatar, getHexIP());
				
				TUser0 user = userService.queryUser0ByID(uid);
				user.setAvatarid(avatarPicId);
				userService.updateUser(user);
			}else{	//圈子头像
				avatarPicId = picService.addPic(getLoginUserId(), fileName, avatarImage.getBytes(), uid, Psf.OTYPE_Group, getHexIP());
				TGroup group = groupService.queryGroupById(groupid);
				group.setPicid(avatarPicId);
				groupService.updateGroup(group);
			}
			
			set("success",1);
			set("avatarPicId",avatarPicId);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
		
	}
	
	public void uploadAvatar() throws Exception {
		
		Integer uid = p2int("uid");
		
		if(uid==null) {
			set("success",0);
			set("info","未登录，不能上传图片");
			return;
		}
		
		try {
			FileItem item = getUploadFile();
			String fileName = item.getName();
			byte[] picData = item.get();
			
			PsfImage oldImage = new PsfImage(picData);
			PsfImage newImage = oldImage.createThumb(600, 600);
			
			FileNameAndType fnt = new FileNameAndType(fileName);
			fnt.setFileType("jpg");
			fileName = fnt.getFileFullName();
			
			Integer picid = picService.addPic(uid, fileName, newImage.getBytes(), uid, Psf.OTYPE_Avatar, getHexIP());
			TPic pic = picService.queryPicByPicId(picid);
			
			set("success",1);
			set("picFileName",pic.getPicid()+"."+pic.getFiletype());
				
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void uploadEditorPic() throws Exception {
		Integer uid = p2int("uid");
		if(uid==null) {
			set("success",0);
			set("info","未登录，不能上传图片");
			return;
		}
		Integer otype = p2int("otype");
		if(otype==null) {
			otype = -1;
		}
		try {
			FileItem item = getUploadFile();
			String fileName = item.getName();
			byte[] picdata = item.get();
			PsfImage oldImage = new PsfImage(picdata);
			PsfImage compressedImage = oldImage.compressImage();
			
			FileNameAndType fnt = new FileNameAndType(fileName);
			fnt.setFileType(compressedImage.getFileType());
			fileName = fnt.getFileFullName();
			
			Integer picid = picService.addPic(uid, fileName, compressedImage.getBytes(), 0, otype, getHexIP());
			
			set("success",1);
			set("picFileName",picid+"."+compressedImage.getFileType());
			set("picid", picid);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void getEcImage() throws Exception {
		HttpServletResponse response = ActionContext.currentActionContext().getResponse();
		
		String uri = getURI();
		String ecfilePrefix = "http://192.168.1.5:8080/";
		String ecfilePath = uri.substring("/ecimage/".length());
		String ecfile = ecfilePrefix+ecfilePath;
		
		byte [] bytes = PsfUtils.getUrlBytes(ecfile);
		
		response.setContentType("image/jpg");
		if(bytes==null) {
			response.sendError(404);
		} else {
			response.getOutputStream().write(bytes);
		}
	}
	
	/**
	 * 上传各种对象图片
	 * @throws Exception
	 */
	public void uploadPic() throws Exception {
		Integer uid = p2int("uid");
		if(uid==null) {
			set("success",0);
			set("info","未登录，不能上传图片");
			return;
		}
		Integer otype = p2int("type");
		if(otype==null){
			set("success",0);
			set("info","必须设置otype");
			return;
		}
		try {
			FileItem item = getUploadFile();
			String fileName = item.getName();
			byte[] picdata = item.get();
			
			PsfImage oldImage = new PsfImage(picdata);
			PsfImage compressedImage = oldImage.compressImage();
			
			FileNameAndType fnt = new FileNameAndType(fileName);
			fnt.setFileType(compressedImage.getFileType());
			fileName = fnt.getFileFullName();
			
			Integer picid = picService.addPic(uid, fileName, compressedImage.getBytes(), 0, otype, getHexIP());
			
			fixThumb(picid,otype, compressedImage.getBytes());
			
			set("success",1);
			set("picFileName",picid+"."+fnt.getFileType());
			set("picid", picid);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
}