package com.neusoft.mapper;

import java.util.List;

import com.neusoft.domain.Category;
import com.neusoft.domain.PageInfo;

public interface ICategoryDao {
	List<Category> getPagedCategory(PageInfo pageInfo);//���ĳһҳ�ķ�������
	int getCategoryCounts();//������з����¼����
}
