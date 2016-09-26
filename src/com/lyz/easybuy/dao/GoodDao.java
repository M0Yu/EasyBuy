package com.lyz.easybuy.dao;

import java.util.List;

import com.lyz.easybuy.base.BaseDao;

public interface GoodDao<T> extends BaseDao<T> {

	List<T> queryByGoods(T record);
}