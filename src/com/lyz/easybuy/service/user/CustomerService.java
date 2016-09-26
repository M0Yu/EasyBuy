package com.lyz.easybuy.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.base.BaseDao;
import com.lyz.easybuy.base.BaseService;
import com.lyz.easybuy.dao.CustomerDao;

@Service("customerService")
public class CustomerService<T> extends BaseService<T>{

	@Autowired
	private CustomerDao<T> dao;

	public BaseDao<T> getDao() {
		return dao;
	}

	public void register(T customer) {
		dao.insert(customer);
	}
	
	public T login(String custname) {
		T findAdmin = (T) dao.queryByUsername(custname);
		return findAdmin;	
	}
}
