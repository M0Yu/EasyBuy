package com.lyz.easybuy.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyz.easybuy.entity.Order;
import com.lyz.easybuy.entity.page.GoodsPage;
import com.lyz.easybuy.entity.page.OrderPage;
import com.lyz.easybuy.entity.util.EasyUIData;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.user.OrderService;
import com.lyz.easybuy.util.HtmlUtil;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired(required = false)
	private OrderService<Order> orderService;

	@RequestMapping("addToCart")
	public void addToCart(Order order, HttpServletRequest request,
			HttpServletResponse response) {

		InterfaceData result = null;
		if (order.getGid() == null || "".equals(order.getGid())) {
			result = InterfaceData.Error("获取商品失败，请重试");
		} else if (order.getUserid() == null || "".equals(order.getUserid())) {
			result = InterfaceData.Error("登录已超时，请重新登录");
		} else {
			order.setStatus("购物车");
			orderService.addOrder(order);

			result = InterfaceData.SUCCESS("已添加到购物车");
		}

		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("shoppingCart")
	public void checkCart(OrderPage page, HttpServletRequest request,
			HttpServletResponse response) {

		InterfaceData result = null;
		if (page.getUserid() == null || "".equals(page.getUserid())) {
			result = InterfaceData.Error("登录已超时，请重新登录");
		} else {
			page.setStatus("购物车");
			page = (OrderPage) orderService.queryByList(page);
			result = InterfaceData.SUCCESS(page);
		}

		HtmlUtil.writerJson(response, result);
	}
	
	@RequestMapping("orderList")
	public void orderList(OrderPage page, HttpServletRequest request,
			HttpServletResponse response) {

		InterfaceData result = null;
		if (page.getUserid() == null || "".equals(page.getUserid())) {
			result = InterfaceData.Error("登录已超时，请重新登录");
		} else {
			page.setStatus("交易成功");
			page = (OrderPage) orderService.queryByList(page);
			result = InterfaceData.SUCCESS(page);
		}

		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("balance")
	public void balance(int[] ids, int addrid, HttpServletRequest request,
			HttpServletResponse response) {

		InterfaceData result = null;
		if (ids == null || addrid == 0) {
			result = InterfaceData.Error("获取数据失败，请重试！");
		} else {
			Order order = null;
			for (int id : ids) {
				order = orderService.queryById(id);
				order.setAddrid(addrid);
				order.setOrdertime(new Date());
				order.setOrderno("" + order.getOrdertime().getTime() + order.getGid()
						+ order.getUserid() + order.getAddrid());
				order.setStatus("交易成功");
				
				orderService.updateByPrimaryKeySelective(order);
			}
			
			result =InterfaceData.SUCCESS("结算成功！");
		}

		HtmlUtil.writerJson(response, result);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public void list(OrderPage page, HttpServletRequest request,
			HttpServletResponse response) {
		page.setStatus("交易成功");
		page = (OrderPage) orderService.queryByList(page);
		EasyUIData<GoodsPage> uiData = new EasyUIData<GoodsPage>();
		uiData.setRows(page.getList());
		uiData.setTotal(page.getPager().getRowCount());
		HtmlUtil.writerJson(response, uiData);
	}
}
