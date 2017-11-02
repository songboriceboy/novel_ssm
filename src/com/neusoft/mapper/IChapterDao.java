package com.neusoft.mapper;

import java.util.List;

import com.neusoft.domain.Chapter;
import com.neusoft.domain.ChapterEx;

public interface IChapterDao {
	List<Chapter> getAllChaptersByBookID(int id);
				  
	int addChapter(Chapter chapter);
	
	int saveChapter(Chapter chapter);
	ChapterEx GetChapterInfo(int id);
	
	int getPrevChapterIDByCurrentChapterID(int chapterid);
	int getNextChapterIDByCurrentChapterID(int chapterid);
}
