package com.lyf.web;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CrmSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		CrmSessionContext.removeSession(event.getSession());
		System.out.println("移除了Session:"+event.getSession().getId());
	}

}
