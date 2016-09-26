package com.lyz.easybuy.dao;

import com.lyz.easybuy.base.BaseDao;

public interface CustomerDao<T> extends BaseDao<T> {

	T queryByUsername(String custname);
}