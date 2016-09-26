package com.lyz.easybuy.base;

import java.util.List;

public interface BaseDao<T> {
	public int deleteByPrimaryKey(Integer id);

	public int insert(T record);

	public int insertSelective(T record);

	public int updateByPrimaryKeySelective(T record);

	public int updateByPrimaryKey(T record);

	public int queryByCount(BasePage page);

	public List<T> queryByList(BasePage page);

	public List<T> listPayment(BasePage page);

	public T queryById(Object id);
}
