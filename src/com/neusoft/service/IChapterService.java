package com.neusoft.service;

import java.util.List;

import com.neusoft.domain.Chapter;
import com.neusoft.domain.ChapterEx;

public interface IChapterService {

	ChapterEx getChapterInfo(int id);
	List<Chapter> getAllChaptersByBookID(int id);
	int addChapter(Chapter chapter);
	int saveChapter(Chapter chapter);
}
