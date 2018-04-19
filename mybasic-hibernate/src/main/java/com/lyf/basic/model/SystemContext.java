package com.lyf.basic.model;

public class SystemContext {
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();//每页显示数量
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();//起始页
	private static ThreadLocal<String> sort = new ThreadLocal<String>();//排序字段
	private static ThreadLocal<String> order = new ThreadLocal<String>();//排序
	
	public static Integer getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(Integer _pageSize) {
		SystemContext.pageSize.set(_pageSize);
	}
	public static Integer getPageOffset() {
		return pageOffset.get();
	}
	public static void setPageOffset(Integer _pageOffset) {
		SystemContext.pageOffset.set(_pageOffset);
	}
	public static String getSort() {
		return sort.get();
	}
	public static void setSort(String _sort) {
		SystemContext.sort.set(_sort);
	}
	public static String getOrder() {
		return order.get();
	}
	public static void setOrder(String _order) {
		SystemContext.order.set(_order);
	}
	
	
}
