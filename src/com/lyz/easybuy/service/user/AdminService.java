package com.lyz.easybuy.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.base.BaseDao;
import com.lyz.easybuy.base.BaseService;
import com.lyz.easybuy.dao.AdminDao;

@Service("adminService")
public class AdminService<T> extends BaseService<T>{
	@Autowired
	private AdminDao<T> dao;
	
	public BaseDao<T> getDao() {
		return dao;
	}

	/**
	 * 注册新用户
	 * 
	 * @param admin
	 */
	public void register(T admin) {
		dao.insert(admin);
	}

	/**
	 * 登陆时查询数据库
	 * @param admin
	 * @return
	 */
	public T login(String username) {
		T findAdmin = (T) dao.queryByUsername(username);
		return findAdmin;
	}



}
