package psf.framework;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import psf.Psf;

public class FilterAndActionManager {
	protected static FilterAndActionManager instance = null;
	protected static Object lock = new Object();
	protected static String fileName = Psf.webRoot+"WEB-INF/psf/actions.xml";
	protected static long fileTime = 0L;
	
	protected Map<String, ActionMapping> actionMap = new HashMap<String, ActionMapping>(); //绝对位置映射
	protected ActionMapping [] starEndActionMappings = null;  //星号结尾的映射
	protected FilterMapping [] filterMappings = null;
	
	
	public static FilterAndActionManager getInstance() throws Exception {
		if(instance==null) {
			instance = new FilterAndActionManager();
			instance.loadXml();
			new Thread(new Runnable() {
				public void run() {
					while(Psf.running) {
						try {
							File f = new File(fileName);
							if(f.lastModified()!=fileTime) {
								instance.loadXml();
							}
						} catch (Exception e) {}
						
						try {Thread.sleep(2000);} catch (Exception e) {}
					}
				}
			},"MappingChangeCheckThread").start();
		}
		return instance;
	}
	
	public void loadXml() throws Exception {
		System.out.println("========加载Action文件======");
		File f = new File(fileName);
		fileTime = f.lastModified();
		Map<String, ActionMapping> map = new HashMap<String, ActionMapping>();
		ActionMapping [] mappings = null;
		List<ActionMapping> mappingList = new ArrayList<ActionMapping>();
		
		SAXReader reader = new SAXReader();
		Document doc = reader.read(f);
		Element root = doc.getRootElement();
		List<Element> filters = root.elements("filter");
		List<FilterMapping> filterMappingList = new ArrayList<FilterMapping>();
		for(Element efilter:filters) {
			String sUrl = efilter.attributeValue("url");
			String sClass = efilter.attributeValue("class");
			FilterMapping fm = new FilterMapping();
			if(sUrl.endsWith("*")) {
				fm.setStarEnd(true);
				fm.setUrl(sUrl.substring(0,sUrl.length()-1));
			} else {
				fm.setStarEnd(false);
				fm.setUrl(sUrl);
			}
			fm.setTheClass(sClass);
			filterMappingList.add(fm);
		}
		filterMappings = new FilterMapping[filterMappingList.size()];
		filterMappingList.toArray(filterMappings);
		
		List<Element> actions = root.elements("action");
		for(Element eaction:actions) {
			String sUrl = eaction.attributeValue("url");
			String sClass = eaction.attributeValue("class");
			String sMethod = eaction.attributeValue("method");
			String sForward = eaction.attributeValue("forward");
			String sRedirect = eaction.attributeValue("redirect");
			String sResult = eaction.attributeValue("result");
			String sTrasaction = eaction.attributeValue("trasaction");
			
			ActionMapping action = new ActionMapping();
			action.setTheClass(sClass);
			action.setMethod((sMethod==null||sMethod.trim().length()==0)?"execute":sMethod);
			action.setForward(sForward);
			action.setResult(sResult);
			action.setRedirect((sRedirect!=null&&sRedirect.trim().equalsIgnoreCase("true")));
			action.setTrasaction((sTrasaction==null||sTrasaction.trim().length()==0||sTrasaction.trim().equalsIgnoreCase("true")));
			
			if(sUrl.endsWith("*")) {
				action.setUrl(sUrl.substring(0, sUrl.length()-1));
				mappingList.add(action);
			} else {
				action.setUrl(sUrl);
				map.put(sUrl, action);
			}
			
			List<Element> forwards = eaction.elements("forward");
			for (Element eforward:forwards) {
				String fName = eforward.attributeValue("name");
				String fRedirect = eforward.attributeValue("redirect");
				String fResult = eforward.attributeValue("result");
				String fPage = eforward.getStringValue();
				
				ActionForward forward = new ActionForward();
				forward.setName(fName);
				forward.setResult(fResult);
				forward.setRedirect((fRedirect!=null&&fRedirect.trim().equalsIgnoreCase("true")));
				forward.setPage(fPage);
				
				action.putForward(fName, forward);
			}
			
			
		}
		
		mappings = new ActionMapping[mappingList.size()];
		mappingList.toArray(mappings);
		
		actionMap = map;
		starEndActionMappings = mappings;
		
	}
	
	public ActionMapping getActionMapping(String uri) throws Exception {
		ActionMapping mapping = actionMap.get(uri);
		if(mapping!=null) return mapping;
		if(starEndActionMappings!=null) {
			for (ActionMapping m:starEndActionMappings) {
				if(uri.startsWith(m.getUrl())) {
					return m;
				}
			}
		}
		return null;
	}

	public FilterMapping[] getFilterMappings() {
		return filterMappings;
	}
	
}
