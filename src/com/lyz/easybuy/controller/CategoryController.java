package com.lyz.easybuy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyz.easybuy.entity.Category;
import com.lyz.easybuy.entity.page.CategoryPage;
import com.lyz.easybuy.entity.util.EasyUIData;
import com.lyz.easybuy.entity.util.InterfaceData;
import com.lyz.easybuy.service.goods.CategoryService;
import com.lyz.easybuy.util.HtmlUtil;

@Controller
@RequestMapping("category")
public class CategoryController {

	@Autowired(required = false)
	private CategoryService<Category> categoryService;

	@RequestMapping("addCategory")
	public void addCategory(Category category, HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;
		if (category.getCname() != null && !"".equals(category.getCname())) {
			categoryService.addCategory(category);

			result = InterfaceData.SUCCESS("添加成功!");
		} else {

			result = InterfaceData.Error("数据错误，无法添加!");
		}

		// 将结果写入response
		HtmlUtil.writerJson(response, result);
	}

	@RequestMapping("selectList")
	public void getCategoryList(HttpServletRequest request,
			HttpServletResponse response) {
		InterfaceData result = null;
		List<Category> categories = categoryService.queryAll();
		if (categories != null && !categories.isEmpty()) {
			result = InterfaceData.SUCCESS(categories);
		} else {
			result = InterfaceData.Error("为查询到数据");
		}

		HtmlUtil.writerJson(response, result);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("list")
	public void list(CategoryPage categoryPage, HttpServletRequest request,
			HttpServletResponse response){
		categoryPage = (CategoryPage) categoryService.queryByList(categoryPage);
		if (!categoryPage.getList().isEmpty()) {
			EasyUIData<Category> easyUIData = new EasyUIData<>();
			easyUIData.setRows(categoryPage.getList());
			easyUIData.setTotal(categoryPage.getPager().getRowCount());
			HtmlUtil.writerJson(response, easyUIData);
		} else {
			InterfaceData result = InterfaceData.Error("为查询到数据");
			HtmlUtil.writerJson(response, result);
		}
		
	}

}
