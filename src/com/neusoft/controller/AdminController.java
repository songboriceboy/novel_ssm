package com.neusoft.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.descriptor.web.LoginConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
















import com.alibaba.fastjson.JSON;
import com.neusoft.domain.BookInfo;
import com.neusoft.domain.BookPageInfo;
import com.neusoft.domain.Category;
import com.neusoft.domain.Chapter;
import com.neusoft.domain.ChapterEx;
import com.neusoft.domain.PageInfo;
import com.neusoft.domain.UserInfo;
import com.neusoft.service.IBookService;
import com.neusoft.service.ICategoryService;
import com.neusoft.service.IChapterService;
import com.neusoft.service.IUserService;
import com.neusoft.vo.BookCounts;
import com.neusoft.vo.PageData;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	IBookService ibs;
	
	@Autowired
	IChapterService ics;
	
	@Autowired
	ICategoryService iCates;
	
	
	@Autowired
	IUserService ius;
	
	@RequestMapping("/admin")
	public ModelAndView index()
	{
		//访问dao层，获得全部图书
		List<BookInfo> lstBooks = ibs.getAllBooks();
		//转发到admin_booklist.jsp
		ModelAndView mavAndView = new ModelAndView();
		mavAndView.addObject("books", lstBooks);
		mavAndView.setViewName("admin/admin_booklist");
		
		return mavAndView;
	}
	
	@RequestMapping("login")
	public String Login(UserInfo userInfo,HttpServletRequest request)
	{
		int count = ius.Login(userInfo);
		if(count > 0)
		{
			HttpSession hsHttpSession = request.getSession();
			hsHttpSession.setAttribute("userinfo", userInfo);
			return "forward:/admin/admin";
		}
		else {
			return "admin/login";
		}
	
	}
	
	@RequestMapping("admin_login")
	public String admin_login()
	{
		
		return "admin/login";
		
	
	}
	
	@RequestMapping("chapter_list/{bid}")
	public ModelAndView chapterList(@PathVariable("bid") int id)
	{
		
		List<Chapter> lstChapters = ics.getAllChaptersByBookID(id);
		//3.转发请求到admin_chapter_list.jsp

		ModelAndView mavAndView = new ModelAndView();
		mavAndView.addObject("chapters", lstChapters);
		mavAndView.addObject("book_id", id);
		mavAndView.setViewName("admin/admin_chapter_list");
		return mavAndView;
	}
	
	@RequestMapping("addbook")
	public ModelAndView addBook()
	{
		
		
		PageInfo pInfo = new PageInfo();
		pInfo.setPageIndex(0);
		pInfo.setPageSize(1000);
		List<Category> lstCategories = iCates.getPagedCategory(pInfo);
		
		
		ModelAndView maView = new ModelAndView();
		maView.addObject("categorys",lstCategories);
		maView.setViewName("admin/admin_addbook");
		return maView;
	}
	
	@RequestMapping("getbookinfo/{bookid}")
	public ModelAndView getBookInfo(@PathVariable("bookid") int id)
	{
		// 获得书籍id
	
		// 调用dao层接口，取得书籍信息
		
		BookInfo biBookInfo = ibs.getSimpleBookInfoByID(id);
		PageInfo pInfo = new PageInfo();
		pInfo.setPageIndex(0);
		pInfo.setPageSize(1000);
		List<Category> lstCategories = iCates.getPagedCategory(pInfo);
		// 转发到编辑图书那个jsp，admin_editbook.jsp
		ModelAndView mav = new ModelAndView();
		mav.addObject("book", biBookInfo);
		mav.addObject("categorys",lstCategories);
		mav.setViewName("admin/admin_editbook");
		

		return mav;
	}
	
	@RequestMapping("save_book")
	public String saveBook(@RequestParam MultipartFile bookface
			,BookInfo bookInfo,HttpServletRequest request) throws IllegalStateException, IOException
	{
		System.out.println(bookInfo.getBook_name());
		
		
		if(bookface.isEmpty())//用户未上传文件
		{
			bookInfo.setBook_url("");
			System.out.println("no file");
		}
		else {
			String fileNameString = bookface.getOriginalFilename();//haiqing.jpg
			String strPath = request.getServletContext().getRealPath("/assets/upload") + File.separator;
			
			File file = new File(strPath);
			if(!file.exists())//路径不存在
			{
				file.mkdir();
			}
			
				String strNewFileNameString = UUID.randomUUID().toString() + fileNameString;
				//文件要保存的路径
				File fileSave = new File(strPath+strNewFileNameString); 
				System.out.println(strPath+strNewFileNameString);
				
				bookface.transferTo(fileSave);
				
				bookInfo.setBook_url("upload" + File.separator + strNewFileNameString);

			
		}
		
		
		
		if(bookInfo.getId() == 0)
		{
			ibs.addBook(bookInfo);
		}
		else {
			ibs.saveBook(bookInfo);
		}	
		
		
		return "redirect:/admin/admin";
	}
	
	@RequestMapping("add_chapter/{bookid}")
	public ModelAndView addChapter(@PathVariable("bookid") int id)
	{
		ModelAndView maView = new ModelAndView();
		maView.addObject("book_id", id);
		maView.setViewName("admin/admin_add_chapter");
		return maView;
	}
	
	@RequestMapping("save_chapter")
	public String saveChapter(Chapter chapter,String editorValue,String chap_id)
	{
		// 1.拿到章节信息
		// 2.访问dao将章节信息保存到数据库
		chapter.setContent(editorValue);
		
		if(!chap_id.equals(""))//编辑
		{
			chapter.setId(Integer.parseInt(chap_id));
			ics.saveChapter(chapter);
		}
		else
		{
			ics.addChapter(chapter);
		}
		

		// 3.重定向到章节列表

		return "redirect:/admin/chapter_list/" + chapter.getBook_id();
	}
	
	@RequestMapping("edit_chapter/{cid}")
	public ModelAndView editChapter(@PathVariable int cid)
	{
		ChapterEx chapterInfo = ics.getChapterInfo(cid);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("chapter", chapterInfo);
		modelAndView.addObject("book_id", chapterInfo.getBook_id());
		
		modelAndView.setViewName("admin/admin_add_chapter");
		return modelAndView;
	}
	
	@RequestMapping("ajax_get_chapter/{cid}")
	public void ajax_get_chapter(@PathVariable int cid
			,HttpServletResponse response) throws IOException
	{
		ChapterEx chapterInfo = ics.getChapterInfo(cid);
		response.getWriter().println(chapterInfo.getContent());
		
	}

	@RequestMapping("get_category_list")
	public String getCategoryList()
	{
		return "admin/admin_categorylist";
	}
	
	@RequestMapping("get_category_count")
	public void getCategoryCount(HttpServletResponse response) throws IOException
	{
		int count = iCates.getCategoryCounts();
		PrintWriter printWriter = response.getWriter();
		printWriter.println(count);
	}
	@RequestMapping("get_paged_category")
	public void getPagedCategory(PageInfo pageInfo, HttpServletResponse response)throws IOException
	{
		List<Category> lstEs = iCates.getPagedCategory(pageInfo);
		
		PageData<Category> pageData = new PageData<Category>();
		pageData.setList(lstEs);
		
		String strJsonString = JSON.toJSONString(pageData);
		PrintWriter printWriter = response.getWriter();
		printWriter.println(strJsonString);
	}
}
