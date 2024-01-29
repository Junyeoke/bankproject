package com.tenco.bank.handler.exception;

import org.springframework.http.HttpStatus;

import com.tenco.bank.repository.entity.User;

public class UnAuthorizedException extends RuntimeException {
	
	private HttpStatus httpStatus;
	
	public UnAuthorizedException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}
