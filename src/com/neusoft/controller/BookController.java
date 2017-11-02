package com.neusoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;







import com.alibaba.fastjson.JSON;
import com.neusoft.domain.BookInfo;
import com.neusoft.domain.BookPageInfo;
import com.neusoft.domain.Chapter;
import com.neusoft.mapper.IBookDao;
import com.neusoft.service.IBookService;
import com.neusoft.vo.BookCounts;
import com.neusoft.vo.BookInfoWithChapters;
import com.neusoft.vo.PageData;

@Controller
public class BookController {

	@Autowired
	IBookService ibs;
	
	@RequestMapping("getbook/{bookid}")
	public ModelAndView getBookInfo(@PathVariable("bookid") int id)
	{
		System.out.println(id);

		//2.调用service层接口，获得书籍信息,获得图书的全部章节信息
		BookInfoWithChapters biwc = ibs.getBookInfoByID(id);

	
		//3.转发到book.jsp
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookInfo", biwc);
		mav.setViewName("front/book");
		return mav;
	}
	
//	getbookcounts/0/天
//	getbookcounts/2/"#"
	@RequestMapping("/getbookcounts/{cateid}")
	public void getBookCounts(@PathVariable int cateid
			,String bookname
			, HttpServletResponse response) throws IOException
	{
		BookPageInfo bookPageInfo = new BookPageInfo();
		bookPageInfo.setCategory_id(cateid);
		if(bookname.equals("#"))
		{
			bookname = "";
		}
		
		bookPageInfo.setBookname(bookname);
		
		int count = ibs.getBooksCounts(bookPageInfo);
//		if(cateid == 0)
//			count = ibs.getBooksCounts();
//		else {
//			count = ibs.getBooksCountsByID(cateid);
//		}
		PrintWriter pWriter = response.getWriter();
		BookCounts bookcounts = new BookCounts();
		bookcounts.setCounts(count);
		
		String strJsonString = JSON.toJSONString(bookcounts);
		pWriter.println(strJsonString);
	}
	@RequestMapping("getpagedbooks")
	public void getPagedBooks(BookPageInfo pageinfo
			,HttpServletResponse response) throws IOException
	{
		List<BookInfo> lstBookInfos = new ArrayList<BookInfo>();
//		if(pageinfo.getCategory_id() == 0)
//			lstBookInfos = ibs.getPagedBooks(pageinfo);
//		else {
//			lstBookInfos = ibs.getPagedBooksByID(pageinfo);
//		}
		
		lstBookInfos = ibs.getPagedBooksByID(pageinfo);
		PageData<BookInfo> pageData = new PageData<BookInfo>();
		pageData.setList(lstBookInfos);
		
		String strJsonString = JSON.toJSONString(pageData);
		PrintWriter pWriter = response.getWriter();
		pWriter.println(strJsonString);
	}
}
