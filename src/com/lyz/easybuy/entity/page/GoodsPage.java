package com.lyz.easybuy.entity.page;

import java.util.Date;

import com.lyz.easybuy.base.BasePage;

public class GoodsPage extends BasePage {
	private Integer gid;

	private String gname;

	private Float price;

	private Float offset;

	private Date publishtime;

	private Integer total;

	private Integer cid;

	private String cname;

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getOffset() {
		return offset;
	}

	public void setOffset(Float offset) {
		this.offset = offset;
	}

	public Date getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(Date publishtime) {
		this.publishtime = publishtime;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

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
		this.cname = cname;
	}

}
