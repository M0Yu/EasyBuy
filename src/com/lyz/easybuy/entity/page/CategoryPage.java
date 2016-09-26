package com.lyz.easybuy.entity.page;

import com.lyz.easybuy.base.BasePage;

public class CategoryPage extends BasePage {
	private Integer cid;

	private String cname;

	private String summary;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname == null ? null : cname.trim();
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary == null ? null : summary.trim();
	}
}