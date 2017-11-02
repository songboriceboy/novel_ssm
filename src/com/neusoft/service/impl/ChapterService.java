package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.domain.Chapter;
import com.neusoft.domain.ChapterEx;
import com.neusoft.mapper.IChapterDao;
import com.neusoft.service.IChapterService;

@Service
public class ChapterService implements IChapterService{

	@Autowired
	IChapterDao icd;
	
	@Override
	public ChapterEx getChapterInfo(int id) {
		// TODO Auto-generated method stub
		ChapterEx chapterEx = icd.GetChapterInfo(id);
		int prevID = icd.getPrevChapterIDByCurrentChapterID(id);
		int nextID = icd.getNextChapterIDByCurrentChapterID(id);
		
	
	
		chapterEx.setPrevChapter(prevID);
		chapterEx.setNextChapter(nextID);
		
		return chapterEx;
	}

	@Override
	public List<Chapter> getAllChaptersByBookID(int id) {
		// TODO Auto-generated method stub
		List<Chapter> lsChapters = icd.getAllChaptersByBookID(id);
		return lsChapters;
	}

	@Override
	public int addChapter(Chapter chapter) {
		// TODO Auto-generated method stub
		return icd.addChapter(chapter);
	}

	@Override
	public int saveChapter(Chapter chapter) {
		// TODO Auto-generated method stub
		return icd.saveChapter(chapter);
	}

}
