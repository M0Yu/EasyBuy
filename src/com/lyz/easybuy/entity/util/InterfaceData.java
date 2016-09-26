package com.lyz.easybuy.entity.util;

import java.io.Serializable;

/**
 * 接口返回值
 */
@SuppressWarnings("serial")
public class InterfaceData implements Serializable {
	private Object result;// 返回结果
	private boolean status;// 响应状态
	private String msg;// 响应信息

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public InterfaceData(Object result, boolean status, String msg) {
		super();
		this.result = result;
		this.status = status;
		this.msg = msg;
	}

	public InterfaceData(Object result) {
		super();
		this.result = result;
		this.status = true;
		this.msg = "OK";
	}

	public InterfaceData(String msg, boolean status) {
		super();
		this.msg = msg;
		this.status = status;
	}

	public static InterfaceData Error(String msg) {
		return new InterfaceData(msg, false);
	}

	public static InterfaceData Error() {
		return new InterfaceData("操作失败", false);
	}

	public static InterfaceData SUCCESS(String msg) {
		return new InterfaceData(null, true, msg);
	}

	public static InterfaceData SUCCESS(Object result) {
		return new InterfaceData(result, true, "操作成功");
	}

	public static InterfaceData SUCCESS(String msg, Object result) {
		return new InterfaceData(result, true, msg);
	}

	public InterfaceData() {
		super();
	}
}
