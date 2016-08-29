package psf;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.ListOrderedMap;

public class PsfItem extends ListOrderedMap {

	public PsfItem() {
	}

	public PsfItem(Map map) {
		super(map);
	}
	
	public Integer toInt(Object o) {
		if(o==null) return null;
		if(o instanceof Integer) return (Integer)o;
		if(o instanceof Long) return ((Long)o).intValue();
		return Integer.parseInt(o.toString());
	}
	
	public Integer getInt(String key) {
		return toInt(get(key));
	}
	
	public Integer getInt(int index) {
		return toInt(get(index));
	}
	
	public String getString(String key) {
		return (String) get(key);
	}
	
	public String getString(int index) {
		return (String) get(index);
	}
	
	public BigDecimal getDecimal(String key) {
		Object o = get(key);
		if(o==null) return null;
		if(o instanceof BigDecimal) return (BigDecimal) o;
		return new BigDecimal(o.toString());
	}
	
	public BigDecimal getDecimal(int index) {
		return (BigDecimal) get(index);
	}
	
	public List getList(String key) {
		return (List)get(key);
	}
	
	public List getList(int index) {
		return (List)get(index);
	}
}
