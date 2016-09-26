package com.lyz.easybuy.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.base.BaseDao;
import com.lyz.easybuy.base.BaseService;
import com.lyz.easybuy.dao.OrderDao;

@Service("orderService")
public class OrderService<T> extends BaseService<T>{
	@Autowired
	private OrderDao<T> dao;

	public BaseDao<T> getDao() {
		return dao;
	}

	public void addOrder(T order) {
		dao.insert(order);
	}

	public List<T> queryByUserid(int userid) {
		return dao.queryByUserid(userid);
	}
}
