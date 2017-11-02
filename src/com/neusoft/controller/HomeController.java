package com.neusoft.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.neusoft.domain.BookInfo;
import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;
import com.neusoft.mapper.ICategoryDao;
import com.neusoft.service.IBookService;
import com.neusoft.service.ICategoryService;
//Ê×Ò³¿ØÖÆÆ÷
@Controller
public class HomeController {

	@Autowired
	ICategoryService ics;
	
	@RequestMapping("/")
	public ModelAndView index()
	{
		System.out.println("hello");
	
		PageInfo pInfo = new PageInfo();
		pInfo.setPageIndex(0);
		pInfo.setPageSize(1000);
		List<Category> lstCategories = ics.getPagedCategory(pInfo);
		
		
		ModelAndView maView = new ModelAndView();
		maView.addObject("categorys",lstCategories);
		maView.setViewName("front/index");
		return maView;
	}
//	get_chapter/Â½Ð¡·ï/3
//	@RequestMapping("get_chapter/{bookname}/{cid}")
//	public void test_two_param(
//			@PathVariable("bookname") String bname
//			,@PathVariable("cid") int id)
//	{
//		System.out.println(bname);
//		System.out.println(id);
//	}
	
}
