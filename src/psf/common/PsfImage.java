package psf.common;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.MemoryCacheImageInputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.imageio.plugins.bmp.BMPImageReader;
import com.sun.imageio.plugins.gif.GIFImageReader;
import com.sun.imageio.plugins.jpeg.JPEGImageReader;
import com.sun.imageio.plugins.png.PNGImageReader;


public class PsfImage {
	
	public static final int PsfImageType_Invalid = 0;
	public static final int PsfImageType_JPG = 1;
	public static final int PsfImageType_BMP = 2;
	public static final int PsfImageType_GIF = 3;
	public static final int PsfImageType_GIF_A = 4;
	public static final int PsfImageType_PNG = 5;
	
	public static final String [] FileTypes = new String []{
		"","jpg","bmp","gif","gif","png"
	};
	
	protected byte [] picData = null;
	protected int imageType = -1;
	protected BufferedImage image = null;
	
	public PsfImage(byte[] picData) {
		this.picData = picData;
	}
	
	public PsfImage(BufferedImage image) {
		this.image = image;
	}
	
	public BufferedImage getImage() throws Exception {
		if(image==null) {
			image = ImageIO.read(new ByteArrayInputStream(picData));
		}
		return image;
	}
	
	/**
	 * 判断数据是否合法，是否为图片
	 * @return
	 * @throws Exception
	 */
	public boolean isImage() throws Exception {
		return getImageType()!=PsfImageType_Invalid;
	}
	
	/**
	 * 获取当前图片类型
	 * @return
	 * @throws Exception
	 */
	public int getImageType() throws Exception {
		if(imageType==-1) {
			imageType = PsfImageType_Invalid;
			if(picData==null) {
				if(image==null) {
					return PsfImageType_Invalid;
				} else {
					return PsfImageType_JPG;
				}
			}
			ByteArrayInputStream is = null;
			MemoryCacheImageInputStream mcis = null;
			try {
				is = new ByteArrayInputStream(picData);
				mcis = new MemoryCacheImageInputStream(is);
				Iterator itr = ImageIO.getImageReaders(mcis);
				while (itr.hasNext()) {
					ImageReader reader = (ImageReader) itr.next();
					if (reader instanceof GIFImageReader) {
						GIFImageReader gifReader = (GIFImageReader) reader;
						int num = gifReader.getNumImages(true);
						imageType = (num==1)?PsfImageType_GIF:PsfImageType_GIF_A;
					} else if (reader instanceof JPEGImageReader) {
						imageType = PsfImageType_JPG;
					} else if (reader instanceof PNGImageReader) {
						imageType = PsfImageType_PNG;
					} else if (reader instanceof BMPImageReader) {
						imageType = PsfImageType_BMP;
					}
					reader.dispose();
				}
			} catch (Exception e) {
			} finally {
				if(is!=null) try {is.close();} catch (Exception ex){}
				if(mcis!=null) try {mcis.close();} catch (Exception ex) {}
			}
		}
		return imageType;
	}
	
	public String getFileType() throws Exception {
		return FileTypes[getImageType()];
	}
	
	public PsfImage clipImage(int x,int y,int w,int h) throws Exception {
		BufferedImage oldImage = getImage();
		BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = (Graphics2D)newImage.getGraphics();
		g2d.setColor(Color.WHITE);
		g2d.fillRect(0, 0, w, h);
		g2d.drawImage(oldImage, 0, 0, w, h, x, y, x+w, y+h, null);
		return new PsfImage(newImage);
	}
	
	public PsfImage rotateImage(Integer angle) throws Exception {
		Image oldImage = getImage();
		int old_w = oldImage.getWidth(null);
		int old_h = oldImage.getHeight(null);
		int new_w = old_w;
		int new_h = old_h;
		if(angle==1||angle==3) {
			new_w = old_h;
			new_h = old_w;
		}
		
		int rotate_w = Math.max(old_w, old_h);
		
		BufferedImage bigImage = new BufferedImage(rotate_w, rotate_w, BufferedImage.TYPE_INT_RGB);
		Graphics2D bigG2d = (Graphics2D)bigImage.getGraphics();
		bigG2d.setColor(Color.WHITE);
		bigG2d.fillRect(0, 0, old_w, old_h);
		bigG2d.rotate(Math.toRadians((double)angle*90.0d),rotate_w/2,rotate_w/2);
		bigG2d.drawImage(oldImage, (rotate_w-old_w)/2,(rotate_w-old_h)/2,null);
		
		BufferedImage newImage = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = (Graphics2D) newImage.getGraphics();
		g2d.setColor(Color.WHITE);
		g2d.fillRect(0, 0, rotate_w, rotate_w);
		int sx1 = (rotate_w-new_w)/2;
		int sy1 = (rotate_w-new_h)/2;
		int sx2 = sx1+new_w;
		int sy2 = sy1+new_h;
		g2d.drawImage(bigImage,0,0,new_w,new_h,sx1,sy1,sx2,sy2,null);
		
		return new PsfImage(newImage);
	}
	
	public PsfImage compressImage() throws Exception {
		int imageType = getImageType();
		if(imageType!=PsfImageType_GIF_A) {
			PsfImage newImage = new PsfImage(encodeImage(getImage()));
			return newImage;
		}
		return this;
	}
	
	protected byte [] encodeImage(BufferedImage image) throws Exception {
		int w = image.getWidth();
		int h = image.getHeight();
		BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = (Graphics2D) newImage.getGraphics();
		g2d.setColor(Color.BLACK);
		g2d.fillRect(0, 0, w, h);
		g2d.drawImage(image, 0, 0, null);
		
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bout);
		JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(newImage);
		jep.setQuality(0.8f, true);
		encoder.encode(newImage,jep);
		return bout.toByteArray();
	}
	
	public PsfImage createThumb(int width,int height) throws Exception {
		return createThumb(width, height,false);
	}
	
	public PsfImage createThumb(int width,int height,boolean zoom) throws Exception {
		int newWidth = width;
		int newHeight = height;
		int oldWidth = getImage().getWidth();
		int oldHeight = getImage().getHeight();
		
		if(width<=0 && height<=0) return null;
		
		if(width==-1) {
			newWidth = oldWidth*height/oldHeight;
		} else if(height==-1) {
			newHeight = oldHeight*width/oldWidth;
		} else {
			newWidth = oldWidth*height/oldHeight;
			newHeight = oldHeight*width/oldWidth;
			newWidth = Math.min(newWidth, width);
			newHeight = Math.min(newHeight, height);
			
			if(!zoom) {
				if(newWidth>oldWidth && newHeight>oldHeight) {
					newWidth = oldWidth;
					newHeight = oldHeight;
				}
			}
			
		}
		
		BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = (Graphics2D) newImage.getGraphics();
		g2d.setColor(Color.WHITE);
		g2d.fillRect(0, 0, newWidth, newHeight);
		g2d.drawImage(getImage(), 0, 0, newWidth, newHeight, 0, 0, oldWidth, oldHeight, null);
		
		return new PsfImage(newImage);
	}
	
	public byte [] getBytes() throws Exception {
		if(picData==null) {
			if(image!=null) {
				picData = encodeImage(image);
			} else {
				return null;
			}
		}
		return picData;
	}
}
