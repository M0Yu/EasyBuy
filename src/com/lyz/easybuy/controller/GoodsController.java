package com.lyz.easybuy.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyz.easybuy.entity.Good;
import com.lyz.easybuy.entity.page.GoodsPage;
import com.lyz.easybuy.entity.util.EasyUIData;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.goods.GoodService;
import com.lyz.easybuy.util.HtmlUtil;
import com.lyz.easybuy.util.SessionUtils;

@Controller
@RequestMapping("goods")
public class GoodsController {

	@Autowired(required = false)
	private GoodService<Good> goodService;

	@RequestMapping("addGoods")
	public void addGoods(Good good, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;

		if (good.getGname() != null && !"".equals(good.getGname())) {
			good.setPublishtime(new Date());

			goodService.addGoods(good);
			result = InterfaceData.SUCCESS("添加商品成功！");
		}

		HtmlUtil.writerJson(response, result);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public void list(GoodsPage page, HttpServletRequest request,
			HttpServletResponse response) {
		page = (GoodsPage) goodService.queryByList(page);
		EasyUIData<GoodsPage> uiData = new EasyUIData<GoodsPage>();
		uiData.setRows(page.getList());
		uiData.setTotal(page.getPager().getRowCount());
		HtmlUtil.writerJson(response, uiData);
	}

	@RequestMapping("search")
	public void showGoods(Good good, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;
		List<Good> goods = goodService.queryByGoods(good);
		if (goods == null || goods.isEmpty()) {
			result = InterfaceData.Error("为查询到任何数据");
		} else {
			result = InterfaceData.SUCCESS(goods);
		}
		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("goodInfo")
	public void goodInfo(Good good, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;
		if (good.getGid() != null) {
			good = goodService.queryById(good);
			SessionUtils.setAttr(request, "good", good);
			result = InterfaceData.SUCCESS(good);
		} else {
			result = InterfaceData.Error("未查询到该数据或数据已删除");
		}
		HtmlUtil.writerJson(response, result);
	}
}
