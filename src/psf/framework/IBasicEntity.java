package psf.framework;

import java.io.Serializable;

public interface IBasicEntity extends Serializable {
	public String getTableName();
	public String [] getFields();
	public String getPrimaryKey();
	public boolean isAutoIncrease();
}
