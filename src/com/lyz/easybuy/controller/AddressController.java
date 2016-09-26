package com.lyz.easybuy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyz.easybuy.entity.Address;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.user.AddressService;
import com.lyz.easybuy.util.HtmlUtil;

@Controller
@RequestMapping("address")
public class AddressController {

	@Autowired(required = false)
	private AddressService<Address> addressService;

	@RequestMapping("newAddress")
	public void newAddress(Address address, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		if (address.getUsrid() == null || "".equals(address.getUsrid())) {
			result = InterfaceData.Error("登录数据过期，请退出后重试");
		} else {
			addressService.addAddress(address);

			result = InterfaceData.SUCCESS("新建成功");
		}

		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("deleteAddress")
	public void deleteAddress(Address address, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		if (address.getUsrid() == null || "".equals(address.getUsrid())) {
			result = InterfaceData.Error("登录数据过期，请退出后重试");
		} else {
			Address find = addressService.queryById(address);
			if (find.getUsrid() == address.getUsrid()) {
				addressService.deleteById(address.getAdrrid());
				result = InterfaceData.SUCCESS("新建成功");
			} else {
				result = InterfaceData.Error("查询数据错误，请重试");
			}
		}
		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("searchAddress")
	public void searchAddress(Address address, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		if (address.getUsrid() == null || "".equals(address.getUsrid())) {
			result = InterfaceData.Error("登录数据过期，请退出后重试");
		} else {
			List<Address> list = addressService
					.queryByUsrid(address.getUsrid());

			if (list == null || list.isEmpty()) {
				result = InterfaceData.Error("未查询到地址数据");
			} else {
				result = InterfaceData.SUCCESS(list);
			}
		}

		HtmlUtil.writerJson(response, result);
	}
}
