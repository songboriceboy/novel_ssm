package com.neusoft.domain;


public class ChapterEx extends Chapter{

	
	private int prevChapter;
	private int nextChapter;

	private String book_name;
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	

	public int getPrevChapter() {
		return prevChapter;
	}
	public void setPrevChapter(int prevChapter) {
		this.prevChapter = prevChapter;
	}
	public int getNextChapter() {
		return nextChapter;
	}
	public void setNextChapter(int nextChapter) {
		this.nextChapter = nextChapter;
	}
	
}
