package com.lyz.easybuy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyz.easybuy.base.BaseDao;

public interface OrderDao<T> extends BaseDao<T> {

	List<T> queryByUserid(@Param("userid") Integer userid);
}