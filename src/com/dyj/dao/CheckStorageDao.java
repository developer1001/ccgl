package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.SaleOut;
import com.dyj.util.StringUtil;

public class CheckStorageDao {
	
	public ResultSet theList(Connection con,PageBean pageBean,CheckStorage checkStorage, String s_alarm, String s_alarmto)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_checkstorage where 1 = 1 ");
		if(checkStorage != null && StringUtil.isNotEmpty(checkStorage.getPrname())){
			sb.append(" and PRNAME like '%"+checkStorage.getPrname()+"%'");
		}
		if( s_alarm != null  && StringUtil.isNotEmpty(s_alarm)){
			sb.append(" and PRQUANTITY >= "+Integer.parseInt(s_alarm));
		}
		if( s_alarmto != null  && StringUtil.isNotEmpty(s_alarmto)){
			sb.append(" and PRQUANTITY <= "+Integer.parseInt(s_alarmto));
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		
		return pstmt.executeQuery();
	}
	
	public int theCount(Connection con,CheckStorage checkStorage, String s_alarm, String s_alarmto) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_checkstorage where 1 = 1 ");
		if(StringUtil.isNotEmpty(checkStorage.getPrname())){
			sb.append(" and PRNAME like '%"+checkStorage.getPrname()+"%'");
		}
		if(s_alarm != null  && StringUtil.isNotEmpty(s_alarm)){
			sb.append(" and PRQUANTITY >= "+Integer.parseInt(s_alarm));
		}
		if( s_alarm != null && StringUtil.isNotEmpty(s_alarmto)){
			sb.append(" and PRQUANTITY <= "+Integer.parseInt(s_alarmto));
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	//
	public int theDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_checkstorage where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//
	public int theAdd(Connection con,CheckStorage checkStorage) throws Exception {
		String sql="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);			
//		Date utildate = saleOut.getPrdate() ;			
//		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,checkStorage.getPrid());
		pstmt.setString(2,checkStorage.getPrname());
		pstmt.setString(3,checkStorage.getPrkind());
		pstmt.setString(4,checkStorage.getMaterial());
		pstmt.setString(5,checkStorage.getSpecification());
		pstmt.setInt(6, checkStorage.getOverflow());
		pstmt.setInt(7, checkStorage.getPrlose());
		pstmt.setInt(8, checkStorage.getInstorage());
		pstmt.setInt(9, checkStorage.getOutstorage());
		pstmt.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
		pstmt.setString(11, checkStorage.getSupplier());		
		pstmt.setString(12, checkStorage.getWarehouse());
		pstmt.setString(13, checkStorage.getRemarks());		
		return pstmt.executeUpdate();
	}
	
	//
	public int theModify(Connection con,CheckStorage checkStorage) throws Exception{
		String sql="update t_checkstorage set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,OVERFLOW=?,PRLOSE=?,INSTORAGE=?,OUTSTORAGE=?,PRQUANTITY=?,SUPPLIER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	

		pstmt.setString(1,checkStorage.getPrid());
		pstmt.setString(2,checkStorage.getPrname());
		pstmt.setString(3,checkStorage.getPrkind());
		pstmt.setString(4,checkStorage.getMaterial());
		pstmt.setString(5,checkStorage.getSpecification());
		pstmt.setInt(6, checkStorage.getOverflow());
		pstmt.setInt(7, checkStorage.getPrlose());
		pstmt.setInt(8, checkStorage.getInstorage());
		pstmt.setInt(9, checkStorage.getOutstorage());
		pstmt.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
		pstmt.setString(11, checkStorage.getSupplier());
		pstmt.setString(12, checkStorage.getWarehouse());
		pstmt.setString(13, checkStorage.getRemarks());
		pstmt.setInt(14,checkStorage.getInid());
		return pstmt.executeUpdate();
	}
}
