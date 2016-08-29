package psf.framework;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import psf.Psf;



/**
 * @author 孙锐
 * @date 2011-5-23
 */
public class AppListener implements ServletContextListener {

	public AppListener() {
	}

	public void contextDestroyed(ServletContextEvent sce) {
		Psf.running = false;
	}
	
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Psf.running = true;
			Psf.webRoot = sce.getServletContext().getRealPath("/");
			FilterAndActionManager.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
