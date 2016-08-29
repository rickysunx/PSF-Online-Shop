package psf.common;

public class FileNameAndType {
	protected String fileName = null;
	protected String fileType = "";
	
	public FileNameAndType(String fileFullName) {
		int index = fileFullName.lastIndexOf(".");
		if(index!=-1) {
			fileName = fileFullName.substring(0,index);
			fileType = fileFullName.substring(index+1,fileFullName.length());
		}
	}
	
	public FileNameAndType(String fileName,String fileType) {
		this.fileName = fileName;
		this.fileType = fileType;
	}

	public String getFileFullName() {
		return fileName+((fileType.trim().length()>0)?("."+fileType):"");
	}

	public String getFileName() {
		return fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	
	
}
