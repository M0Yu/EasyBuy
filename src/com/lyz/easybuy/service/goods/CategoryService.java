package com.lyz.easybuy.service.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.base.BaseDao;
import com.lyz.easybuy.base.BaseService;
import com.lyz.easybuy.dao.CategoryDao;

@Service("categoryService")
public class CategoryService<T> extends BaseService<T> {
	@Autowired
	private CategoryDao<T> dao;

	public BaseDao<T> getDao() {
		return dao;
	}

	public void addCategory(T category) {
		dao.insert(category);
	}

	public List<T> queryByCategory(T category) {
		return dao.queryByCategory(category);
	}

	public List<T> queryAll() {
		return dao.queryAll();
	}
}
