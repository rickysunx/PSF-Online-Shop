package psf.framework;

import java.util.UUID;

public class SessionId {
	public static String getSessionId() {
		return UUID.randomUUID().toString();
	}
}
