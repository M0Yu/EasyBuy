package com.lyz.easybuy.dao;

import com.lyz.easybuy.base.BaseDao;

public interface AdminDao<T> extends BaseDao<T>{

	T queryByUsername(String username);
	
}