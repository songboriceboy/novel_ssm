package com.neusoft.vo;

import java.util.List;

import com.neusoft.domain.BookInfo;
import com.neusoft.domain.Chapter;
//传输对象
//后台controller或servlet向jsp传递，传输的对象
public class BookInfoWithChapters {

	private BookInfo book;
	private List<Chapter> chapters;
	public BookInfo getBook() {
		return book;
	}
	public void setBook(BookInfo book) {
		this.book = book;
	}
	public List<Chapter> getChapters() {
		return chapters;
	}
	public void setChapters(List<Chapter> chapters) {
		this.chapters = chapters;
	}

	
}
