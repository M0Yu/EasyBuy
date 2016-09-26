package com.lyz.easybuy.base;

import java.util.List;

/**
 * @Title: BaseService.java
 * @Package: com.winphone.payms.base
 * @Description: TODO:项目基础服务层
 * @author 何喆
 * @date 2016-3-8 下午4:38:40
 * @version 1.0.1
 * @see
 */
public abstract class BaseService<T> {

	public abstract BaseDao<T> getDao();

	public boolean insert(T t) {
		try {
			// 设置主键.字符类型采用UUID,数字类型采用自增
			getDao().insert(t);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateByPrimaryKey(T t) {
		try {
			getDao().updateByPrimaryKey(t);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateByPrimaryKeySelective(T t) {
		try {
			getDao().updateByPrimaryKeySelective(t);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteByPrimaryKey(Integer t) {
		try {
			getDao().deleteByPrimaryKey(t);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int queryByCount(BasePage page) {
		return getDao().queryByCount(page);
	}

	public BasePage queryByList(BasePage page) {
		Integer rowCount = queryByCount(page);
		page.getPager().setRowCount(rowCount);
		List<T> list = getDao().queryByList(page);
		page.setList(list);
		return page;
	}

	public BasePage listPayment(BasePage page) {
		Integer rowCount = queryByCount(page);
		page.getPager().setRowCount(rowCount);
		List<T> list = getDao().listPayment(page);
		page.setList(list);
		return page;
	}

	public T queryById(Object id) {
		return (T) getDao().queryById(id);
	}
}
