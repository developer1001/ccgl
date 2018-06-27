package com.dyj.action;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.struts2.interceptor.ServletRequestAware;

import com.dyj.dao.LogDao;
import com.dyj.dao.UserDao;
import com.dyj.model.Log;
import com.dyj.model.User;
import com.dyj.util.DbUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil2;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String s_userName;
	private String s_password;
	private String s_code;
	private User user;

	public String getS_userName() {
		return s_userName;
	}

	public void setS_userName(String s_userName) {
		this.s_userName = s_userName;
	}

	public String getS_password() {
		return s_password;
	}

	public void setS_password(String s_password) {
		this.s_password = s_password;
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	HttpServletRequest request;
	UserDao userdao = new UserDao();
	DbUtil dbutil = new DbUtil();

	
	
	@Override
	public String execute() throws Exception {
		System.out.println(request.getParameter("s_userName"));
		System.out.println("ok");
		return super.execute();
	}

	public String login() throws Exception {
		int error;
		HttpSession session = request.getSession();
		if (StringUtil.isEmpty(s_userName)
				|| StringUtil.isEmpty(s_password)) {
			error=1;
			ResponseUtil2.write(error);
			return null;
		}
		if (StringUtil.isEmpty(s_code)){
			error = 2;
			ResponseUtil2.write(error);
			return null;
		}
		if (!s_code.equals(session.getAttribute("sRand"))) {
			error = 3;
			ResponseUtil2.write(error);
			return null;
		}
		Connection con = null;
		try {
			User newUser = new User();
			newUser.setUserName(s_userName);
			newUser.setPassword(s_password);
			con = dbutil.getCon();
			User currentUser = userdao.Login(con, newUser);
			if (currentUser == null) {
				error = 4;
				ResponseUtil2.write(error);
				return null;
			} else {
				
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				sdf.format(date);
				//登录信息插入数据库
				Log logg = new Log();
				logg.setLoguser(s_userName);
				logg.setLogtype(1);
				logg.setLogtime(sdf.format(date));
				LogDao logdao = new LogDao();
				logdao.logRecord(con, logg);
				//req.setAttribute("us", us);
				session.setAttribute("currentUser", currentUser);
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}
	public String loginOut() throws Exception{		
		HttpSession session = request.getSession();
		if(session!=null){
		//退出前把退出信息记录到数据库
		Connection con = null;
		con = dbutil.getCon();
		User outUser = (User) request.getSession().getAttribute("currentUser");
		String outname = outUser.getUserName(); 
		//
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.format(date);
		//
		Log logg = new Log();
		logg.setLoguser(outname);
		logg.setLogtype(0);
		logg.setLogtime(sdf.format(date));
		LogDao logdao = new LogDao();
		logdao.logRecord(con, logg);
		dbutil.closeCon(con);
		//注销session
		session.removeAttribute("currentUser");
		session.invalidate();//���ӵ�
		}
		return "loginOut";
	}
	public String getSystemUser(){
		User outUser = (User) request.getSession().getAttribute("currentUser");
		String outname = outUser.getUserName();
		return outname;
	}

}
