package psf.framework;

import java.io.File;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import psf.Psf;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class PsfSqlMapClient {
	
	protected static SqlMapClient sqlMapClientInstance = null;
	protected static Map<String,Long> mapFileTime = new HashMap<String, Long>();
	protected static Object sqlMapSynObject = new Object();
	public static String sqlMapResouce = "sqlmap_config.xml";
	public static boolean checkStarted = false;
	public static List<String> sqlMapList = null;
	
	public static SqlMapClient getSqlMapInstance() throws Exception {
		synchronized (sqlMapSynObject) {
			if(sqlMapClientInstance==null) {
				long t1 = System.currentTimeMillis();
				System.out.println("====重新加载SqlMap=====");
				Resources.setDefaultClassLoader(new PsfClassLoaderForIbatis());
				Reader sqlMapReader = Resources.getResourceAsReader(sqlMapResouce);
				SqlMapClient newSqlMap = SqlMapClientBuilder.buildSqlMapClient(sqlMapReader);
				long t2 = System.currentTimeMillis();
				System.out.println("====加载SqlMap=====耗时:"+(t2-t1)+"========");
				sqlMapClientInstance = newSqlMap;
				if(!checkStarted) {
					reloadFileTime();
					startCheckSqlMapChange();
					checkStarted = true;
				}
			}
		}
		return sqlMapClientInstance;
	}
	
	public static List<String> getSqlMaps() throws Exception {
		long t1 = System.currentTimeMillis();
		List<String> sqlMapList = new ArrayList<String>();
		SAXReader reader = new SAXReader();
		Document doc = reader.read(Resources.getResourceAsReader(sqlMapResouce));
		Element root = doc.getRootElement();
		
		List<Element> eSqlMaps = root.elements("sqlMap");
		for(Element eSqlMap:eSqlMaps) {
			String sqlMapFileName = eSqlMap.attributeValue("resource");
			sqlMapList.add(sqlMapFileName);
		}
		sqlMapList.add(sqlMapResouce);
		long t2 = System.currentTimeMillis();
		System.out.println("getSqlMaps:"+(t2-t1));
		return sqlMapList;
	}
	
	public static void reloadFileTime() throws Exception {
		mapFileTime.clear();
		if(sqlMapList==null) sqlMapList = getSqlMaps();
		for(String s:sqlMapList) {
			File f = Resources.getResourceAsFile(s);
			mapFileTime.put(s, f.lastModified());
		}
	}

	public static void checkSqlMapChange() throws Exception {
		File fConfig = Resources.getResourceAsFile(sqlMapResouce);
		if((!mapFileTime.containsKey(sqlMapResouce)) || 
				(!mapFileTime.get(sqlMapResouce).equals(fConfig.lastModified()))) {
			sqlMapList = getSqlMaps();
		}
		
		for(String s:sqlMapList) {
			File f = Resources.getResourceAsFile(s);
			if((!mapFileTime.containsKey(s)) || (!mapFileTime.get(s).equals(f.lastModified()))) {
				synchronized (sqlMapSynObject) {
					sqlMapClientInstance = null;
				}
				reloadFileTime();
				return;
			}
		}
	}
	
	
	public static void startCheckSqlMapChange() {
		new Thread(new Runnable() {
			public void run() {
				while(Psf.running) {
					try {
						checkSqlMapChange();
					} catch (Exception e) {}
					try {Thread.sleep(1000);} catch (Exception e) {}
				}
			}
		},"SqlMapChangeCheckThread").start();
	}
	
}
