package com.lyz.easybuy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyz.easybuy.entity.Customer;
import com.lyz.easybuy.entity.page.CustomerPage;
import com.lyz.easybuy.entity.page.GoodsPage;
import com.lyz.easybuy.entity.util.EasyUIData;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.user.CustomerService;
import com.lyz.easybuy.util.HtmlUtil;
import com.lyz.easybuy.util.SessionUtils;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired(required = false)
	private CustomerService<Customer> customerService;
	
	@RequestMapping("register")
	public void register(Customer customer,HttpServletRequest request,
			HttpServletResponse response){
		InterfaceData result = null;

		Customer find = customerService.login(customer.getCustname());
		if (find != null) {
			result = InterfaceData.Error("该用户名已存在，请更改!");
		} else {
			customerService.register(customer);

			find = customerService.login(customer.getCustname());
			SessionUtils.setCustomer(request, find);
			
			result = InterfaceData.SUCCESS("注册成功!");
		}
		HtmlUtil.writerJson(response, result);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public void list(CustomerPage page, HttpServletRequest request,
			HttpServletResponse response) {
		page = (CustomerPage) customerService.queryByList(page);
		EasyUIData<GoodsPage> uiData = new EasyUIData<GoodsPage>();
		uiData.setRows(page.getList());
		uiData.setTotal(page.getPager().getRowCount());
		HtmlUtil.writerJson(response, uiData);
	}
	
	@RequestMapping("setting")
	public String toSetting(HttpServletRequest request,
			HttpServletResponse response){
		return "customer/customerSetting";
	}
	
	@RequestMapping("shopingCart")
	public String toShoppingCart(HttpServletRequest request,
			HttpServletResponse response){
		return "customer/shoppingCart";
	}
	
	@RequestMapping("orders")
	public String toOrders(HttpServletRequest request,
			HttpServletResponse response){
		return "customer/customer_orders";
	}
}
