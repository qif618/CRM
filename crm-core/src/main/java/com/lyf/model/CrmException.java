package com.lyf.model;

public class CrmException extends RuntimeException{

	private static final long serialVersionUID = 8961456182800582681L;

	public CrmException() {
		super();
	}


	public CrmException(String message, Throwable cause) {
		super(message, cause);
	}

	public CrmException(String message) {
		super(message);
	}

	public CrmException(Throwable cause) {
		super(cause);
	}
	
	

}
