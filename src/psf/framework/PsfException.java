package psf.framework;

public class PsfException extends Exception {

	public PsfException() {
	}

	public PsfException(String message) {
		super(message);
	}

	public PsfException(Throwable cause) {
		super(cause);
	}

	public PsfException(String message, Throwable cause) {
		super(message, cause);
	}

}
