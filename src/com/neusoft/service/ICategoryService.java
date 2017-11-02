package com.neusoft.service;

import java.util.List;

import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;

public interface ICategoryService {
	List<Category> getPagedCategory(PageInfo pageInfo);//获得某一页的分类数据
	int getCategoryCounts();//获得所有分类记录条数
}
