package com.neusoft.service;

import java.util.List;

import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;

public interface ICategoryService {
	List<Category> getPagedCategory(PageInfo pageInfo);//���ĳһҳ�ķ�������
	int getCategoryCounts();//������з����¼����
}
