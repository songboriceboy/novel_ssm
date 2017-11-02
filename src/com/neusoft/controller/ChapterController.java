package com.neusoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import com.neusoft.domain.Chapter;
import com.neusoft.domain.ChapterEx;
import com.neusoft.service.IChapterService;

@Controller
public class ChapterController {
	
	@Autowired
	IChapterService ics;
	
	@RequestMapping("get_chapter/{cid}")
	public ModelAndView getChapter(@PathVariable("cid") int id)
	{
		ChapterEx chapterEx = ics.getChapterInfo(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("chapterinfo",chapterEx);
		mav.setViewName("front/chapter");
		return mav;
	}
	
	
}
