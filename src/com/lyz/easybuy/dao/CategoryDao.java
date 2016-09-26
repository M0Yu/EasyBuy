package com.lyz.easybuy.dao;

import java.util.List;

import com.lyz.easybuy.base.BaseDao;

public interface CategoryDao<T> extends BaseDao<T>{

	List<T> queryByCategory(T record);
	
	List<T> queryAll();
}