package com.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName="LoginFilter",dispatcherTypes={DispatcherType.ASYNC,
		DispatcherType.ERROR,DispatcherType.FORWARD,DispatcherType.INCLUDE,
		DispatcherType.REQUEST}, urlPatterns={"/sysmenu/*","/sysMaintain/*",
		"/partner/*","/help/*","/incomingManagement/*","/financialManagement/*","/outcomingManagement/*","/storageManagement/*"})
public class LoginFilter implements Filter {
	@Override
	public void destroy() {

		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		if(session.getAttribute("currentUser") == null){
			//req.setAttribute("msg", "���½���ٲ���");
			req.getRequestDispatcher("/admin.jsp").forward(req, resp);
			
		}else{
			chain.doFilter(req,resp);
		}
		
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

}
