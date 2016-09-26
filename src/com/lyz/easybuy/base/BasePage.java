package com.lyz.easybuy.base;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.lyz.easybuy.entity.util.Pager;

public class BasePage {
	private Integer page = 1;
	private Integer rows = 10;
	private String sort;
	private String order;
	@SuppressWarnings("rawtypes")
	private List list;
	private Boolean isasc;
	/**
	 * 分页导航
	 */
	private Pager pager = new Pager();

	public Pager getPager() {
		pager.setPageId(getPage());
		pager.setPageSize(getRows());
		String orderField = "";
		if (StringUtils.isNotBlank(sort)) {
			orderField = sort;
		}
		if (StringUtils.isNotBlank(orderField) && StringUtils.isNotBlank(order)) {
			orderField += " " + order;
		}
		pager.setOrderField(orderField);
		if (isasc != null) {
			pager.setOrderDirection(isasc);
		} else {
			pager.setOrderDirection(false);
		}
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@SuppressWarnings("rawtypes")
	public List getList() {
		return list;
	}

	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		this.list = list;
	}

	public Boolean getIsasc() {
		return isasc;
	}

	public void setIsasc(Boolean isasc) {
		this.isasc = isasc;
	}
}
