package com.neusoft.mapper;

import java.util.List;

import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;

public interface ICategoryDao {
	List<Category> getPagedCategory(PageInfo pageInfo);//获得某一页的分类数据
	int getCategoryCounts();//获得所有分类记录条数
}
