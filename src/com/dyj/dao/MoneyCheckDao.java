package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dyj.model.MoneyCheck;
import com.dyj.model.PageBean;
import com.dyj.util.StringUtil;

public class MoneyCheckDao {
	public ResultSet moneyCheckList(Connection con,PageBean pageBean,MoneyCheck moneyCheck)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_moneycheck");
		if(moneyCheck!=null&&StringUtil.isNotEmpty(moneyCheck.getMcname())){
			sb.append(" and mcname like '%"+moneyCheck.getMcname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int moneyCheckCount(Connection con,MoneyCheck moneyCheck)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_moneycheck");
		if(StringUtil.isNotEmpty(moneyCheck.getMcname())){
			sb.append(" and mcname like '%"+moneyCheck.getMcname()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	//
	public int moneyCheckDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_moneycheck where mcid in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//
	public int moneyCheckAdd(Connection con,MoneyCheck moneyCheck)throws Exception {
		String sql="insert into t_moneycheck(mctime,mcname,mcproduct,mcshould,mcalready,mcdebt) values(?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date utdate;
//		java.sql.Date sqldate = null;
//		try {
//			utdate = format.parse(birthday);
//			sqldate = new java.sql.Date(utdate.getTime());
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		person.setBirthday(sqldate);
		Date utildate = moneyCheck.getMctime() ;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		sdf.format(utildate);;				
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setDate(1, sqldate);
		pstmt.setString(2, moneyCheck.getMcname());
		pstmt.setString(3, moneyCheck.getMcproduct());
		pstmt.setDouble(4, moneyCheck.getMcshould());
		pstmt.setDouble(5, moneyCheck.getMcalready());
		pstmt.setDouble(6, moneyCheck.getMcshould()-moneyCheck.getMcalready());	
		return pstmt.executeUpdate();
	}
	
	//
	public int moneyCheckModify(Connection con,MoneyCheck moneyCheck)throws Exception{
		String sql="update t_moneycheck set mctime=?,mcname=?,mcproduct=?,mcshould=?, mcalready=?,mcdebt=? where mcid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		Date utildate = moneyCheck.getMctime() ;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
//		sdf.format(utildate);;				
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setDate(1, sqldate);
		pstmt.setString(2, moneyCheck.getMcname());
		pstmt.setString(3, moneyCheck.getMcproduct());
		pstmt.setDouble(4, moneyCheck.getMcshould());
		pstmt.setDouble(5, moneyCheck.getMcalready());
		pstmt.setDouble(6, moneyCheck.getMcshould()-moneyCheck.getMcalready());	
		pstmt.setInt(7,moneyCheck.getMcid());
		return pstmt.executeUpdate();
	}
}
