package com.lyz.easybuy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.easybuy.entity.Admin;
import com.lyz.easybuy.entity.Customer;
import com.lyz.easybuy.entity.page.AdminPage;
import com.lyz.easybuy.entity.util.EasyUIData;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.user.AdminService;
import com.lyz.easybuy.service.user.CustomerService;
import com.lyz.easybuy.util.HtmlUtil;
import com.lyz.easybuy.util.SessionUtils;

@Controller
@RequestMapping("system")
public class SystemController {
	@Autowired(required = false)
	private AdminService<Admin> adminService;
	@Autowired(required = false)
	private CustomerService<Customer> customerService;

	/**
	 * 程序入口，前往登录页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("login")
	public ModelAndView toLogin(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		model.setViewName("admin_login");
		return model;
	}

	@RequestMapping("index")
	public String toIndex(String type) {
		if ("admin".equals(type)) {
			return "index";
		} else if ("cust".equals(type)) {
			return "customer/customer_index";
		}
		return "redirect:login";
	}

	@RequestMapping("checkLogin")
	public ModelAndView adminLogin(String username, String password,
			String type, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView();

		if (type.equals("admin")) {
			Admin find = adminService.login(username);
			if (find != null) {
				if (!find.getPassword().equals(password)) {
					model.addObject("errMsg", "密码错误，请检查!");

				} else {
					model.setViewName("redirect:index");
					model.addObject("type", type);

					SessionUtils.setAdmin(request, find);
					return model;
				}
			} else {
				model.addObject("errMsg", "用户名错误，请检查!");
			}
		} else if (type.equals("cust")) {
			Customer find = customerService.login(username);
			if (find != null) {
				if (!find.getPassword().equals(password)) {
					model.addObject("errMsg", "密码错误，请检查!");

				} else {
					model.setViewName("redirect:index");
					model.addObject("type", type);

					SessionUtils.setCustomer(request, find);
					return model;
				}
			} else {
				model.addObject("errMsg", "用户名错误，请检查!");
			}
		}
		model.setViewName("admin_login");
		return model;
	}

	@RequestMapping("admin_register")
	public void adminRegister(Admin admin, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		Admin findadmin = adminService.login(admin.getUsername());
		if (findadmin != null) {
			result = InterfaceData.Error("该用户名已存在，请更改!");
		} else {
			adminService.register(admin);

			result = InterfaceData.SUCCESS("注册成功!");
		}
		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("customer_register")
	public String userRegister() {
		return "customer/customer_register";
	}

	@RequestMapping("logout")
	public String adminLogout(HttpServletRequest request,
			HttpServletResponse response) {
		SessionUtils.removeAdmin(request);
		SessionUtils.removeUser(request);
		return "admin_login";
	}

	@RequestMapping("admin_changePwd")
	public void admin_changePwd(String oldPassword, String newPassword,
			HttpServletRequest request, HttpServletResponse response) {
		InterfaceData result = null;

		Admin admin = SessionUtils.getAdmin(request);
		// 两次输入密码的判断交给前台
		if (!admin.getPassword().equals(oldPassword))
			result = InterfaceData.Error("原始密码错误，请检查!");
		else if (admin.getPassword().equals(newPassword)) {
			result = InterfaceData.Error("新密码与原始密码相同，请更改!");
		} else {
			admin.setPassword(newPassword);
			adminService.updateByPrimaryKeySelective(admin);

			result = InterfaceData.SUCCESS("修改密码成功!");
		}
		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("admin_editInfo")
	public void editAdminInfo(Admin editAdmin, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		Admin admin = SessionUtils.getAdmin(request);
		if (editAdmin.getAid() != admin.getAid()) {
			result = InterfaceData.Error("数据传输出现异常，请重试!");
		} else {
			// 只更改修改项
			adminService.updateByPrimaryKeySelective(editAdmin);

			admin = adminService.queryById(admin);
			SessionUtils.setAdmin(request, admin);

			result = InterfaceData.SUCCESS("修改成功!");
		}

		HtmlUtil.writerJson(response, result);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public void adminList(AdminPage page, HttpServletRequest request,
			HttpServletResponse response) {
		page = (AdminPage) adminService.queryByList(page);
		EasyUIData<AdminPage> uiData = new EasyUIData<AdminPage>();
		uiData.setRows(page.getList());
		uiData.setTotal(page.getPager().getRowCount());
		HtmlUtil.writerJson(response, uiData);
	}
}
