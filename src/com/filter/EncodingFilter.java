package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("*")
public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		
	}
	
	//在doFilter方法中实现需求过滤
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			chain.doFilter(req,resp);//核心
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
}
