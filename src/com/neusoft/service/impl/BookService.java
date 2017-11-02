package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.domain.BookInfo;
import com.neusoft.domain.BookPageInfo;
import com.neusoft.domain.Chapter;
import com.neusoft.domain.PageInfo;
import com.neusoft.mapper.IBookDao;
import com.neusoft.mapper.IChapterDao;
import com.neusoft.service.IBookService;
import com.neusoft.vo.BookInfoWithChapters;

@Service
public class BookService implements IBookService{

	
	@Autowired
	IBookDao ibd;
	@Autowired
	IChapterDao icd;
	
	
	@Override
	public List<BookInfo> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookInfo> lstBookInfos = ibd.getAllBooks();
		return lstBookInfos;
	}


	@Override
	public int addBook(BookInfo bi) {
		// TODO Auto-generated method stub
		return ibd.addBook(bi);
	}


	@Override
	public BookInfoWithChapters getBookInfoByID(int id) {
		// TODO Auto-generated method stub
		BookInfo biBookInfo = ibd.getBookInfoByID(id);
		List<Chapter> lstChapters = icd.getAllChaptersByBookID(id);
		
		BookInfoWithChapters biwcBookInfoWithChapters= new BookInfoWithChapters();
		biwcBookInfoWithChapters.setBook(biBookInfo);
		biwcBookInfoWithChapters.setChapters(lstChapters);
		//喝茶看报纸打游戏
		return biwcBookInfoWithChapters;
	}


	@Override
	public int saveBook(BookInfo bi) {
		// TODO Auto-generated method stub
		return ibd.saveBook(bi);
	}


	@Override
	public BookInfo getSimpleBookInfoByID(int id) {
		// TODO Auto-generated method stub
		BookInfo biBookInfo = ibd.getBookInfoByID(id);
		return biBookInfo;
	}


//	@Override
//	public List<BookInfo> getPagedBooks(PageInfo pageInfo) {
//		// TODO Auto-generated method stub
//		return ibd.getPagedBooks(pageInfo);
//	}


//	@Override
//	public int getBooksCounts() {
//		// TODO Auto-generated method stub
//		return ibd.getBooksCounts();
//	}


	@Override
	public int getBooksCounts(BookPageInfo pageInfo) {
		// TODO Auto-generated method stub
		return ibd.getBooksCounts(pageInfo);
	}


	@Override
	public List<BookInfo> getPagedBooksByID(BookPageInfo pageInfo) {
		// TODO Auto-generated method stub
		return ibd.getPagedBooksByID(pageInfo);
	}

}
