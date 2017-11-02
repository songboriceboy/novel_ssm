package com.neusoft.domain;

public class PageInfo {
	protected int pageIndex;//分页索引，要第几页
	protected int pageSize;//每页多少条
	protected int pageStart;//要的第几页的开始记录索引
	
	
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
