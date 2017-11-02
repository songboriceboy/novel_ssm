package com.neusoft.mapper;

import java.util.List;

import com.neusoft.domain.BookInfo;
import com.neusoft.domain.BookPageInfo;
import com.neusoft.domain.PageInfo;

public interface IBookDao {
	int addBook(BookInfo bi);
	List<BookInfo> getAllBooks();
	BookInfo getBookInfoByID(int id);
	int saveBook(BookInfo bi);
	
	//List<BookInfo> getPagedBooks(PageInfo pageInfo);
	List<BookInfo> getPagedBooksByID(BookPageInfo pageInfo);
	
//	int getBooksCounts();
	int getBooksCounts(BookPageInfo pageInfo);
}
