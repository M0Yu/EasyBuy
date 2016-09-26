package com.lyz.easybuy.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyz.easybuy.dao.AddressDao;

@Service("addressService")
public class AddressService<T>{
	@Autowired
	private AddressDao<T> dao;

	public void addAddress(T address) {
		dao.insert(address);
	}

	public List<T> queryByUsrid(int usrid) {
		return dao.queryByUsrid(usrid);
	}
	
	public T queryById(T record){
		return dao.queryById(record);
	}
	
	public void deleteById(Integer id){
		dao.deleteByPrimaryKey(id);
	}
}
