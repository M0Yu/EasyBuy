package com.lyz.easybuy.service.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.base.BaseDao;
import com.lyz.easybuy.base.BaseService;
import com.lyz.easybuy.dao.GoodDao;

@Service("goodsService")
public class GoodService<T> extends BaseService<T> {
	@Autowired
	private GoodDao<T> dao;

	public BaseDao<T> getDao() {
		return dao;
	}

	/**
	 * 添加商品
	 * 
	 * @param goods
	 */
	public void addGoods(T goods) {
		dao.insert(goods);
	}

	/**
	 * 根据提供的需求查询
	 * 
	 * @param goods
	 */
	public List<T> queryByGoods(T goods) {
		return dao.queryByGoods(goods);
	}

}
