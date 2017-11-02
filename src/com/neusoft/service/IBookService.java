package com.neusoft.service;

import java.util.List;

import com.neusoft.domain.BookInfo;
import com.neusoft.domain.BookPageInfo;
import com.neusoft.domain.PageInfo;
import com.neusoft.vo.BookInfoWithChapters;

public interface IBookService {
	int addBook(BookInfo bi);
	List<BookInfo> getAllBooks();
	BookInfoWithChapters getBookInfoByID(int id);
	BookInfo getSimpleBookInfoByID(int id);
	int saveBook(BookInfo bi);
	
	//List<BookInfo> getPagedBooks(PageInfo pageInfo);
	List<BookInfo> getPagedBooksByID(BookPageInfo pageInfo);
	
//	int getBooksCounts();
	int getBooksCounts(BookPageInfo pageInfo);
}
