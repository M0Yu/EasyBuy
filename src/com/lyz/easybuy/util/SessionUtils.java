package com.lyz.easybuy.util;

import javax.servlet.http.HttpServletRequest;

import com.lyz.easybuy.entity.Admin;
import com.lyz.easybuy.entity.Customer;

public final class SessionUtils {

	/**
	 * 设置session的值
	 * 
	 * @param request
	 * @param key
	 * @param value
	 */
	public static void setAttr(HttpServletRequest request, String key,
			Object value) {
		request.getSession(true).setAttribute(key, value);
	}

	/**
	 * 获取session的值
	 * 
	 * @param request
	 * @param key
	 * @param value
	 */
	public static Object getAttr(HttpServletRequest request, String key) {
		return request.getSession(true).getAttribute(key);
	}

	/**
	 * 删除Session值
	 * 
	 * @param request
	 * @param key
	 */
	public static void removeAttr(HttpServletRequest request, String key) {
		request.getSession(true).removeAttribute(key);
	}

	/**
	 * 设置客户信息 到session
	 * 
	 * @param request
	 * @param user
	 */
	public static void setCustomer(HttpServletRequest request, Customer customer) {
		request.getSession(true).setAttribute(Constent.SESSION_CUST, customer);
	}

	/**
	 * 从session中获取客户信息
	 * 
	 * @param request
	 * @return Customer
	 */
	public static Customer get(HttpServletRequest request) {
		return (Customer) request.getSession(true).getAttribute(
				Constent.SESSION_CUST);
	}

	/**
	 * 从session中移除信息
	 * 
	 * @param request
	 */
	public static void removeUser(HttpServletRequest request) {
		removeAttr(request, Constent.SESSION_CUST);
	}

	/**
	 * @Description 从session中获取管理员信息
	 * 
	 * @param request
	 * @return
	 */
	public static Admin getAdmin(HttpServletRequest request) {
		return (Admin) request.getSession(true).getAttribute(
				Constent.SESSION_ADMIN);
	}

	/**
	 * @Description 在session中设置管理员信息
	 * 
	 * @param request
	 * 
	 */
	public static void setAdmin(HttpServletRequest request, Admin admin) {
		request.getSession(true).setAttribute(Constent.SESSION_ADMIN, admin);
	}

	/**
	 * 从session中移除管理员信息
	 * 
	 * @param request
	 */
	public static void removeAdmin(HttpServletRequest request) {
		removeAttr(request, Constent.SESSION_ADMIN);
	}

}