package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.dyj.model.Customer;
import com.dyj.model.PageBean;
import com.dyj.model.User;
import com.dyj.util.StringUtil;


public class UserDao {
	
	
//	HttpServletRequest request=(HttpServletRequest)ServletActionContext.getRequest();
	
//	c_na=(String) request.getSession(true).getAttribute("currentUser");//c_na表示用户名
//	HttpSession session=ServletActionContext.getRequest().getSession();
//	HttpServletRequest request;
	
//	HttpSession session = request.getSession();
//	User outUser = (User) session.getAttribute("currentUser");
//	String outname = outUser.getUserName(); 
	
	//用户登录验证
  public User Login (Connection con,User user) throws Exception{
	  User ResultUser = null;
	  String sql = "select * from t_user where userName=? and password=?";
	  PreparedStatement pstmt = con.prepareStatement(sql);
	  pstmt.setString(1,user.getUserName());
	  pstmt.setString(2,user.getPassword());
	  ResultSet rs = pstmt.executeQuery();
	  while(rs.next()){
		  ResultUser = new User();
		  ResultUser.setUserName(rs.getString("userName"));
		  ResultUser.setPassword(rs.getString("password"));
	  }
	  return ResultUser;
  }
  
  
  public ResultSet adminList(Connection con,PageBean pageBean,User user)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_user where 1 = 1 ");
//		if(user!=null&&StringUtil.isNotEmpty(user.getUserName())){
//			sb.append(" and userName like '%"+user.getUserName()+"%'");			
//		}	
		
		sb.append(" and userName = '" + user.getPassword() + "'");
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	public int userCount(Connection con,User user)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_user where 1 = 1 ");
//		if(StringUtil.isNotEmpty(user.getUserName())){
//			sb.append(" and userName like '%"+user.getUserName()+"%'");
//		}
		
		sb.append("and userName = '" + user.getPassword() + "'");
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	//删除用户
	public int adminDelete(Connection con,String delIds)throws Exception{
		
	
		
		String sql="delete from t_user where id in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//添加用户
	public int adminAdd(Connection con,User user)throws Exception {
		String sql="insert into t_user values(?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, user.getId());
		pstmt.setString(2, user.getUserName());
		pstmt.setString(3, user.getPassword());		
		return pstmt.executeUpdate();
	}
	
	//修改用户
	public int adminModify(Connection con,User user)throws Exception{
		String sql="update t_user set userName=?,password=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);		
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassword());
		pstmt.setInt(3, user.getId());
		return pstmt.executeUpdate();
	}


	
}
