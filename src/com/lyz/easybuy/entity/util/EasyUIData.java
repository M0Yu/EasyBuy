package com.lyz.easybuy.entity.util;

import java.util.List;
/**
 * @Title: EasyUIData.java 
 * @Package: com.winphone.payms.entity.util 
 * @Description: TODO:easyui 列表数据
 * @author 何喆  
 * @date 2016-4-21 下午1:44:52 
 * @version 1.0.1 
 * @see
 */
@SuppressWarnings("serial")
public class EasyUIData<T> implements java.io.Serializable{ 
	private int total;
	private List<T> rows;
	private String temp;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public EasyUIData(int total, List<T> rows, String temp) {
		super();
		this.total = total;
		this.rows = rows;
		this.temp = temp;
	}
	public EasyUIData() {
		super();
	}
}
