package com.neusoft.domain;

public class PageInfo {
	protected int pageIndex;//��ҳ������Ҫ�ڼ�ҳ
	protected int pageSize;//ÿҳ������
	protected int pageStart;//Ҫ�ĵڼ�ҳ�Ŀ�ʼ��¼����
	
	
	public int getPageStart() {
		return pageIndex*pageSize;
	}

	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
