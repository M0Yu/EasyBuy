package com.lyz.easybuy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyz.easybuy.base.BaseDao;

public interface AddressDao<T> extends BaseDao<T>{

	List<T> queryByUsrid(@Param("usrid") Integer usrid);
	
}