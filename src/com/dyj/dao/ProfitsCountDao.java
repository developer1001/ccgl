package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dyj.model.PageBean;
import com.dyj.model.ProfitsCount;
import com.dyj.util.StringUtil;

public class ProfitsCountDao {
	public ResultSet profitsCountList(Connection con,PageBean pageBean,ProfitsCount profitsCount)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_profitscount");
		if(profitsCount!=null&&StringUtil.isNotEmpty(profitsCount.getPrremarks())){
			sb.append(" and PRREMARKS like '%"+profitsCount.getPrremarks()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int profitsCountCount(Connection con,ProfitsCount profitsCount)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_profitscount");
		if(StringUtil.isNotEmpty(profitsCount.getPrremarks())){
			sb.append(" and mcname like '%"+profitsCount.getPrremarks()+"%'");
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
	public int profitsCountDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_profitscount where PRID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//
	public int profitsCountAdd(Connection con,ProfitsCount profitsCount)throws Exception {
		String sql="insert into t_profitscount(PRMONTH,PRSALES,PRBUYSPEND,PRREFUNDTOBUYER,PRSUPPLIERREFUND,PRPROFITS,PRREMARKS) values(?,?,?,?,?,?,?)";
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
		Date utildate = profitsCount.getPrmonth() ;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
//		sdf.format(utildate);;				
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setDate(1, sqldate);
		pstmt.setDouble(2, profitsCount.getPrsales());
		pstmt.setDouble(3, profitsCount.getPrbuyspend());
		pstmt.setDouble(4, profitsCount.getPrrefundtobuyer());
		pstmt.setDouble(5, profitsCount.getPrsupplierrefund());
		pstmt.setDouble(6, profitsCount.getPrsales()+profitsCount.getPrsupplierrefund()-profitsCount.getPrrefundtobuyer()-profitsCount.getPrbuyspend());
		pstmt.setString(7, profitsCount.getPrremarks());
		return pstmt.executeUpdate();
	}
	
	//
	public int profitsCountModify(Connection con,ProfitsCount profitsCount)throws Exception{
		String sql="update t_profitscount set PRMONTH=?,PRSALES=?,PRBUYSPEND=?,PRREFUNDTOBUYER=?, PRSUPPLIERREFUND=?,PRPROFITS=?,PRREMARKS=? where PRID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		Date utildate = profitsCount.getPrmonth() ;
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");	
		//String time= sdf.format(utildate);;				
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setDate(1, sqldate);
		pstmt.setDouble(2, profitsCount.getPrsales());
		pstmt.setDouble(3, profitsCount.getPrbuyspend());
		pstmt.setDouble(4, profitsCount.getPrrefundtobuyer());
		pstmt.setDouble(5, profitsCount.getPrsupplierrefund());
		pstmt.setDouble(6, profitsCount.getPrsales()+profitsCount.getPrsupplierrefund()-profitsCount.getPrrefundtobuyer()-profitsCount.getPrbuyspend());
		pstmt.setString(7, profitsCount.getPrremarks());
		pstmt.setInt(8, profitsCount.getPrid());
		return pstmt.executeUpdate();
	}
}
