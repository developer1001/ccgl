package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dyj.model.BuyReturnOut;
import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.SaleOut;
import com.dyj.util.StringUtil;

public class BuyReturnOutDao {
	
	public ResultSet theList(Connection con,PageBean pageBean,BuyReturnOut buyReturnOut)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_buyreturnout");
		if(buyReturnOut!=null&&StringUtil.isNotEmpty(buyReturnOut.getPrname())){
			sb.append(" and PRNAME like '%"+buyReturnOut.getPrname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int theCount(Connection con,BuyReturnOut buyReturnOut) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_buyreturnout");
		if(StringUtil.isNotEmpty(buyReturnOut.getPrname())){
			sb.append(" and PRNAME like '%"+buyReturnOut.getPrname()+"%'");
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
	public int theDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_buyreturnout where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//
		String sqla = "SELECT *  FROM t_buyreturnout WHERE INID in(" + delIds + ")";
		PreparedStatement pstmta=con.prepareStatement(sqla);		
		ResultSet rs2=pstmta.executeQuery();		
		List<BuyReturnOut> listA = new ArrayList<BuyReturnOut>();
		BuyReturnOut buyReturnOut = null;
		while(rs2.next()){
			buyReturnOut = new BuyReturnOut();
			buyReturnOut.setInid(rs2.getInt("INID"));
			buyReturnOut.setPrid(rs2.getString("PRID"));
			buyReturnOut.setPrname(rs2.getString("PRNAME"));
			buyReturnOut.setPrkind(rs2.getString("PRKIND"));
			buyReturnOut.setMaterial(rs2.getString("MATERIAL"));
			buyReturnOut.setSpecification(rs2.getString("SPECIFICATION"));
			buyReturnOut.setPrprice(rs2.getDouble("PRPRICE"));
			buyReturnOut.setPrcost(rs2.getDouble("PRCOST"));
			buyReturnOut.setPrquantity(rs2.getInt("PRQUANTITY"));
			buyReturnOut.setSupplier(rs2.getString("SUPPLIER"));
			buyReturnOut.setPrdate(rs2.getDate("PRDATE"));
			buyReturnOut.setChecher(rs2.getString("CHECHER"));
			buyReturnOut.setWarehouse(rs2.getString("WAREHOUSE"));
			buyReturnOut.setRemarks(rs2.getString("REMARKS"));						
			listA.add(buyReturnOut);
		}
		for (int i = 0; i < listA.size(); i++) {
			ResultSet rs;
			List<CheckStorage> list = new ArrayList<CheckStorage>();		
			String sql2 = "select * from t_checkstorage where PRID = '" + listA.get(i).getPrid()+"'";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			CheckStorage checkStorage = null;
			while(rs.next()){
				checkStorage = new CheckStorage();
				checkStorage.setInid(rs.getInt("INID"));
				checkStorage.setPrid(rs.getString("PRID"));
				checkStorage.setPrname(rs.getString("PRNAME"));
				checkStorage.setPrkind(rs.getString("PRKIND"));
				checkStorage.setMaterial(rs.getString("MATERIAL"));
				checkStorage.setSpecification(rs.getString("SPECIFICATION"));
				checkStorage.setOverflow(rs.getInt("OVERFLOW"));
				checkStorage.setPrlose(rs.getInt("PRLOSE"));
				checkStorage.setInstorage(rs.getInt("INSTORAGE"));
				checkStorage.setOutstorage(rs.getInt("OUTSTORAGE"));
				checkStorage.setPrquantity(rs.getInt("PRQUANTITY"));
				checkStorage.setSupplier(rs.getString("SUPPLIER"));
				checkStorage.setWarehouse(rs.getString("WAREHOUSE"));
				checkStorage.setRemarks(rs.getString("REMARKS"));
				list.add(checkStorage);
			}
			if(list != null && list.size()==1){
				String sql3 = "update t_checkstorage set INID=?,PRNAME=?,PRKIND=?,MATERIAL=?,SPECIFICATION=?,"+
							"OVERFLOW=?,PRLOSE=?,INSTORAGE=?,OUTSTORAGE=?,PRQUANTITY=?,SUPPLIER=?,WAREHOUSE=?,REMARKS=? WHERE PRID=?";
				PreparedStatement pstmt3=con.prepareStatement(sql3);
				pstmt3.setInt(1,checkStorage.getInid());
				pstmt3.setString(2,checkStorage.getPrname());
				pstmt3.setString(3,checkStorage.getPrkind());
				pstmt3.setString(4,checkStorage.getMaterial());
				pstmt3.setString(5,checkStorage.getSpecification());
				pstmt3.setInt(6, checkStorage.getOverflow());
				pstmt3.setInt(7, checkStorage.getPrlose());
				pstmt3.setInt(8, checkStorage.getInstorage());
				pstmt3.setInt(9, checkStorage.getOutstorage()- listA.get(i).getPrquantity());
				pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() + listA.get(i).getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
				pstmt3.setString(11, checkStorage.getSupplier());		
				pstmt3.setString(12, checkStorage.getWarehouse());
				pstmt3.setString(13,checkStorage.getRemarks());
				pstmt3.setString(14,checkStorage.getPrid());
				pstmt3.executeUpdate();
			}
			if(list.isEmpty()){
				String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt4=con.prepareStatement(sql4);
				pstmt4.setString(1,listA.get(i).getPrid());
				pstmt4.setString(2,listA.get(i).getPrname());
				pstmt4.setString(3,listA.get(i).getPrkind());
				pstmt4.setString(4,listA.get(i).getMaterial());
				pstmt4.setString(5,listA.get(i).getSpecification());
				pstmt4.setInt(6, 0);
				pstmt4.setInt(7, 0);
				pstmt4.setInt(8, 0);
				pstmt4.setInt(9, listA.get(i).getPrquantity());
				pstmt4.setInt(10, listA.get(i).getPrquantity());		
				pstmt4.setString(11, listA.get(i).getSupplier());		
				pstmt4.setString(12, listA.get(i).getWarehouse());
				pstmt4.setString(13, listA.get(i).getRemarks());		
			    pstmt4.executeUpdate();
			}
		}
		return pstmt.executeUpdate();
	  }
	
	//
	public int theAdd(Connection con,BuyReturnOut buyReturnOut) throws Exception {
		String sql="insert into t_buyreturnout(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,PRPRICE,PRQUANTITY,PRCOST,SUPPLIER,PRDATE,CHECHER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);			
		Date utildate = buyReturnOut.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,buyReturnOut.getPrid());
		pstmt.setString(2,buyReturnOut.getPrname());
		pstmt.setString(3,buyReturnOut.getPrkind());
		pstmt.setString(4,buyReturnOut.getMaterial());
		pstmt.setString(5,buyReturnOut.getSpecification());
		pstmt.setDouble(6, buyReturnOut.getPrprice());
		pstmt.setInt(7, buyReturnOut.getPrquantity());
		pstmt.setDouble(8, buyReturnOut.getPrprice() * buyReturnOut.getPrquantity());
		pstmt.setString(9, buyReturnOut.getSupplier());
		pstmt.setDate(10, sqldate);
		pstmt.setString(11, buyReturnOut.getChecher());
		pstmt.setString(12, buyReturnOut.getWarehouse());
		pstmt.setString(13, buyReturnOut.getRemarks());	
		
		//
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + buyReturnOut.getPrid()+"'";
		PreparedStatement pstmt2=con.prepareStatement(sql2);
		rs=pstmt2.executeQuery();
		CheckStorage checkStorage = null;
		while(rs.next()){
			checkStorage = new CheckStorage();
			checkStorage.setInid(rs.getInt("INID"));
			checkStorage.setPrid(rs.getString("PRID"));
			checkStorage.setPrname(rs.getString("PRNAME"));
			checkStorage.setPrkind(rs.getString("PRKIND"));
			checkStorage.setMaterial(rs.getString("MATERIAL"));
			checkStorage.setSpecification(rs.getString("SPECIFICATION"));
			checkStorage.setOverflow(rs.getInt("OVERFLOW"));
			checkStorage.setPrlose(rs.getInt("PRLOSE"));
			checkStorage.setInstorage(rs.getInt("INSTORAGE"));
			checkStorage.setOutstorage(rs.getInt("OUTSTORAGE"));
			checkStorage.setPrquantity(rs.getInt("PRQUANTITY"));
			checkStorage.setSupplier(rs.getString("SUPPLIER"));
			checkStorage.setWarehouse(rs.getString("WAREHOUSE"));
			checkStorage.setRemarks(rs.getString("REMARKS"));
			list.add(checkStorage);
		}
		if(list != null && list.size()==1){
			String sql3 = "update t_checkstorage set INID=?,PRNAME=?,PRKIND=?,MATERIAL=?,SPECIFICATION=?,"+
						"OVERFLOW=?,PRLOSE=?,INSTORAGE=?,OUTSTORAGE=?,PRQUANTITY=?,SUPPLIER=?,WAREHOUSE=?,REMARKS=? WHERE PRID=?";
			PreparedStatement pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1,checkStorage.getInid());
//			pstmt3.setString(1,checkStorage.getPrid());
			pstmt3.setString(2,checkStorage.getPrname());
			pstmt3.setString(3,checkStorage.getPrkind());
			pstmt3.setString(4,checkStorage.getMaterial());
			pstmt3.setString(5,checkStorage.getSpecification());
			pstmt3.setInt(6, checkStorage.getOverflow());
			pstmt3.setInt(7, checkStorage.getPrlose());
			pstmt3.setInt(8, checkStorage.getInstorage());
			pstmt3.setInt(9, checkStorage.getOutstorage() + buyReturnOut.getPrquantity());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() - buyReturnOut.getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,buyReturnOut.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,buyReturnOut.getPrid());
			pstmt4.setString(2,buyReturnOut.getPrname());
			pstmt4.setString(3,buyReturnOut.getPrkind());
			pstmt4.setString(4,buyReturnOut.getMaterial());
			pstmt4.setString(5,buyReturnOut.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, 0);
			pstmt4.setInt(9, buyReturnOut.getPrquantity());
			pstmt4.setInt(10, -buyReturnOut.getPrquantity());		
			pstmt4.setString(11, buyReturnOut.getSupplier());		
			pstmt4.setString(12, buyReturnOut.getWarehouse());
			pstmt4.setString(13, buyReturnOut.getRemarks());		
		    pstmt4.executeUpdate();
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int theModify(Connection con,BuyReturnOut buyReturnOut) throws Exception{
		String sql="update t_buyreturnout set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,PRPRICE=?,PRQUANTITY=?,PRCOST=?,SUPPLIER=?,PRDATE=?,CHECHER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		
		Date utildate = buyReturnOut.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		
		pstmt.setString(1,buyReturnOut.getPrid());
		pstmt.setString(2,buyReturnOut.getPrname());
		pstmt.setString(3,buyReturnOut.getPrkind());
		pstmt.setString(4,buyReturnOut.getMaterial());
		pstmt.setString(5,buyReturnOut.getSpecification());
		pstmt.setDouble(6, buyReturnOut.getPrprice());
		pstmt.setInt(7, buyReturnOut.getPrquantity());
		pstmt.setDouble(8, buyReturnOut.getPrprice() * buyReturnOut.getPrquantity());
		pstmt.setString(9, buyReturnOut.getSupplier());
		pstmt.setDate(10, sqldate);
		pstmt.setString(11, buyReturnOut.getChecher());
		pstmt.setString(12, buyReturnOut.getWarehouse());
		pstmt.setString(13, buyReturnOut.getRemarks());	
		pstmt.setInt(14,buyReturnOut.getInid());
		
		//
		String sql1 =  "select * from t_buyreturnout where INID = "+buyReturnOut.getInid();
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		BuyReturnOut p0 = new BuyReturnOut();
		if(rs1.next()){
			p0.setPrquantity(rs1.getInt("PRQUANTITY"));
		}
		int originalnumber = p0.getPrquantity();
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + buyReturnOut.getPrid()+"'";
		PreparedStatement pstmt2=con.prepareStatement(sql2);
		rs=pstmt2.executeQuery();
		CheckStorage checkStorage = null;
		while(rs.next()){
			checkStorage =  new CheckStorage();
			checkStorage.setInid(rs.getInt("INID"));
			checkStorage.setPrid(rs.getString("PRID"));
			checkStorage.setPrname(rs.getString("PRNAME"));
			checkStorage.setPrkind(rs.getString("PRKIND"));
			checkStorage.setMaterial(rs.getString("MATERIAL"));
			checkStorage.setSpecification(rs.getString("SPECIFICATION"));
			checkStorage.setOverflow(rs.getInt("OVERFLOW"));
			checkStorage.setPrlose(rs.getInt("PRLOSE"));
			checkStorage.setInstorage(rs.getInt("INSTORAGE"));
			checkStorage.setOutstorage(rs.getInt("OUTSTORAGE"));
			checkStorage.setPrquantity(rs.getInt("PRQUANTITY"));
			checkStorage.setSupplier(rs.getString("SUPPLIER"));
			checkStorage.setWarehouse(rs.getString("WAREHOUSE"));
			checkStorage.setRemarks(rs.getString("REMARKS"));
			list.add(checkStorage);
		}
		if(list != null && list.size()==1){
			String sql3 = "update t_checkstorage set INID=?,PRNAME=?,PRKIND=?,MATERIAL=?,SPECIFICATION=?,"+
						"OVERFLOW=?,PRLOSE=?,INSTORAGE=?,OUTSTORAGE=?,PRQUANTITY=?,SUPPLIER=?,WAREHOUSE=?,REMARKS=? WHERE PRID=?";
			PreparedStatement pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1,checkStorage.getInid());
			pstmt3.setString(2,checkStorage.getPrname());
			pstmt3.setString(3,checkStorage.getPrkind());
			pstmt3.setString(4,checkStorage.getMaterial());
			pstmt3.setString(5,checkStorage.getSpecification());
			pstmt3.setInt(6, checkStorage.getOverflow());
			pstmt3.setInt(7, checkStorage.getPrlose());
			pstmt3.setInt(8, checkStorage.getInstorage());
			pstmt3.setInt(9, checkStorage.getOutstorage()+buyReturnOut.getPrquantity()- originalnumber);
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() -buyReturnOut.getPrquantity() + originalnumber - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,buyReturnOut.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,buyReturnOut.getPrid());
			pstmt4.setString(2,buyReturnOut.getPrname());
			pstmt4.setString(3,buyReturnOut.getPrkind());
			pstmt4.setString(4,buyReturnOut.getMaterial());
			pstmt4.setString(5,buyReturnOut.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, 0);
			pstmt4.setInt(9, buyReturnOut.getPrquantity());
			pstmt4.setInt(10, buyReturnOut.getPrquantity());		
			pstmt4.setString(11, buyReturnOut.getSupplier());		
			pstmt4.setString(12, buyReturnOut.getWarehouse());
			pstmt4.setString(13, buyReturnOut.getRemarks());		
		    pstmt4.executeUpdate();
		}
		return pstmt.executeUpdate();
	}
	
}
