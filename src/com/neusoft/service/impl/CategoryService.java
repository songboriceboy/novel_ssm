package com.neusoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;
import com.neusoft.mapper.ICategoryDao;
import com.neusoft.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	private ICategoryDao icd;
	
	@Override
	public List<Category> getPagedCategory(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		return icd.getPagedCategory(pageInfo);
	}

	@Override
	public int getCategoryCounts() {
		// TODO Auto-generated method stub
		return icd.getCategoryCounts();
	}

}
