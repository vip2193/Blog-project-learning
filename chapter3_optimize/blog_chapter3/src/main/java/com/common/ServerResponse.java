package com.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

import org.junit.Test;

public class ServerResponse<T> {
	
	private String msg;
	private int status;

	private T data;
	
	public static final int ERROR = 1;
	public static final int SUCCESS = 0;
	

	public ServerResponse() {
	    
	}
	
	public ServerResponse(String msg, int status) {
		super();
		this.msg = msg;
		this.status = status;
	}
	
	public ServerResponse(String msg, int status, T data) {
		super();
		this.msg = msg;
		this.status = status;
		this.data = data;
	}


	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "ServerResponse [msg=" + msg + ", status=" + status + "]";
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
