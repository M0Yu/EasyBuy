package com.lyz.easybuy.entity.page;

import com.lyz.easybuy.base.BasePage;

public class AdminPage extends BasePage {
	private Integer aid;

	private String username;

	private String password;

	private String phone;

	private String power;

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power == null ? null : power.trim();
	}
}