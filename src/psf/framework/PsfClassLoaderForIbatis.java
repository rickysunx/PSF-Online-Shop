package psf.framework;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import psf.Psf;

public class PsfClassLoaderForIbatis extends ClassLoader {

	@Override
	public InputStream getResourceAsStream(String name) {
		String fileName = Psf.webRoot+"WEB-INF/classes/"+name;
		File f = new File(fileName);
		if(f.exists()) {
			try {
				FileInputStream fin = new FileInputStream(f);
				return fin;
			} catch (FileNotFoundException e) {
				return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
			}
		}
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
	}

	@Override
	public URL getResource(String name) {
		
		String fileName = Psf.webRoot+"WEB-INF/classes/"+name;
		File f = new File(fileName);
		if(f.exists()) {
			try {
				return f.toURI().toURL();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return Thread.currentThread().getContextClassLoader().getResource(name);
	}

}
