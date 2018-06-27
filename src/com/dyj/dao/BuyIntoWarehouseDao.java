package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dyj.model.BuyIntoWarehouse;
import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.ProduceIntoWarehouse;
import com.dyj.util.StringUtil;

public class BuyIntoWarehouseDao {
	
	public ResultSet buyIntoWarehouseList(Connection con,PageBean pageBean,BuyIntoWarehouse buyIntoWarehouse)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_buyintowarehouse");
		if(buyIntoWarehouse!=null&&StringUtil.isNotEmpty(buyIntoWarehouse.getPrname())){
			sb.append(" and PRNAME like '%"+buyIntoWarehouse.getPrname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int buyIntoWarehouseCount(Connection con,BuyIntoWarehouse buyIntoWarehouse) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_buyintowarehouse");
		if(StringUtil.isNotEmpty(buyIntoWarehouse.getPrname())){
			sb.append(" and PRNAME like '%"+buyIntoWarehouse.getPrname()+"%'");
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
	public int buyIntoWarehouseDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_buyintowarehouse where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//
		String sqla = "SELECT *  FROM t_buyintowarehouse WHERE INID in(" + delIds + ")";
		PreparedStatement pstmta=con.prepareStatement(sqla);		
		ResultSet rs2=pstmta.executeQuery();		
		List<BuyIntoWarehouse> listA = new ArrayList<BuyIntoWarehouse>();
		BuyIntoWarehouse buyIntoWarehouse = null;
		while(rs2.next()){
			buyIntoWarehouse = new BuyIntoWarehouse();
			buyIntoWarehouse.setInid(rs2.getInt("INID"));
			buyIntoWarehouse.setPrid(rs2.getString("PRID"));
			buyIntoWarehouse.setPrname(rs2.getString("PRNAME"));
			buyIntoWarehouse.setPrkind(rs2.getString("PRKIND"));
			buyIntoWarehouse.setMaterial(rs2.getString("MATERIAL"));
			buyIntoWarehouse.setSpecification(rs2.getString("SPECIFICATION"));
			buyIntoWarehouse.setPrprice(rs2.getDouble("PRPRICE"));
			buyIntoWarehouse.setPrcost(rs2.getDouble("PRCOST"));
			buyIntoWarehouse.setPrquantity(rs2.getInt("PRQUANTITY"));
			buyIntoWarehouse.setSupplier(rs2.getString("SUPPLIER"));
			buyIntoWarehouse.setPrdate(rs2.getDate("PRDATE"));
			buyIntoWarehouse.setChecher(rs2.getString("CHECHER"));
			buyIntoWarehouse.setWarehouse(rs2.getString("WAREHOUSE"));
			buyIntoWarehouse.setRemarks(rs2.getString("REMARKS"));
			listA.add(buyIntoWarehouse);
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
				pstmt3.setInt(8, checkStorage.getInstorage()-listA.get(i).getPrquantity());
				pstmt3.setInt(9, checkStorage.getOutstorage());
				pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() -listA.get(i).getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
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
				pstmt4.setInt(8, -listA.get(i).getPrquantity());
				pstmt4.setInt(9, 0);
				pstmt4.setInt(10, -listA.get(i).getPrquantity());		
				pstmt4.setString(11, listA.get(i).getSupplier());		
				pstmt4.setString(12, listA.get(i).getWarehouse());
				pstmt4.setString(13, listA.get(i).getRemarks());		
			    pstmt4.executeUpdate();
			}
			
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int buyIntoWarehouseAdd(Connection con,BuyIntoWarehouse buyIntoWarehouse) throws Exception {
		String sql="insert into t_buyintowarehouse(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,PRPRICE,PRQUANTITY,PRCOST,SUPPLIER,PRDATE,CHECHER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);			
		Date utildate = buyIntoWarehouse.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,buyIntoWarehouse.getPrid());
		pstmt.setString(2,buyIntoWarehouse.getPrname());
		pstmt.setString(3,buyIntoWarehouse.getPrkind());
		pstmt.setString(4,buyIntoWarehouse.getMaterial());
		pstmt.setString(5,buyIntoWarehouse.getSpecification());
		pstmt.setDouble(6, buyIntoWarehouse.getPrprice());
		pstmt.setInt(7, buyIntoWarehouse.getPrquantity());
		pstmt.setDouble(8, buyIntoWarehouse.getPrprice() * buyIntoWarehouse.getPrquantity());
		pstmt.setString(9, buyIntoWarehouse.getSupplier());
		pstmt.setDate(10, sqldate);
		pstmt.setString(11, buyIntoWarehouse.getChecher());
		pstmt.setString(12, buyIntoWarehouse.getWarehouse());
		pstmt.setString(13, buyIntoWarehouse.getRemarks());	
		
		//
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + buyIntoWarehouse.getPrid()+"'";
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
			pstmt3.setInt(8, checkStorage.getInstorage()+buyIntoWarehouse.getPrquantity());
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +buyIntoWarehouse.getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,buyIntoWarehouse.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,buyIntoWarehouse.getPrid());
			pstmt4.setString(2,buyIntoWarehouse.getPrname());
			pstmt4.setString(3,buyIntoWarehouse.getPrkind());
			pstmt4.setString(4,buyIntoWarehouse.getMaterial());
			pstmt4.setString(5,buyIntoWarehouse.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, buyIntoWarehouse.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, buyIntoWarehouse.getPrquantity());		
			pstmt4.setString(11, buyIntoWarehouse.getSupplier());		
			pstmt4.setString(12, buyIntoWarehouse.getWarehouse());
			pstmt4.setString(13, buyIntoWarehouse.getRemarks());		
		    pstmt4.executeUpdate();
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int buyIntoWarehouseModify(Connection con,BuyIntoWarehouse buyIntoWarehouse) throws Exception{
		String sql="update t_buyintowarehouse set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,PRPRICE=?,PRQUANTITY=?,PRCOST=?,SUPPLIER=?,PRDATE=?,CHECHER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		
		Date utildate = buyIntoWarehouse.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		
		pstmt.setString(1,buyIntoWarehouse.getPrid());
		pstmt.setString(2,buyIntoWarehouse.getPrname());
		pstmt.setString(3,buyIntoWarehouse.getPrkind());
		pstmt.setString(4,buyIntoWarehouse.getMaterial());
		pstmt.setString(5,buyIntoWarehouse.getSpecification());
		pstmt.setDouble(6, buyIntoWarehouse.getPrprice());
		pstmt.setInt(7, buyIntoWarehouse.getPrquantity());
		pstmt.setDouble(8, buyIntoWarehouse.getPrprice() * buyIntoWarehouse.getPrquantity());
		pstmt.setString(9, buyIntoWarehouse.getSupplier());
		pstmt.setDate(10, sqldate);
		pstmt.setString(11, buyIntoWarehouse.getChecher());
		pstmt.setString(12, buyIntoWarehouse.getWarehouse());
		pstmt.setString(13, buyIntoWarehouse.getRemarks());	
		pstmt.setInt(14,buyIntoWarehouse.getInid());
		
		//
		String sql1 =  "select * from t_buyintowarehouse where INID = "+buyIntoWarehouse.getInid();
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		BuyIntoWarehouse p0 = new BuyIntoWarehouse();
		if(rs1.next()){
			p0.setPrquantity(rs1.getInt("PRQUANTITY"));
		}
		int originalnumber = p0.getPrquantity();
		//update t_checkstorage
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + buyIntoWarehouse.getPrid()+"'";
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
			pstmt3.setInt(8, checkStorage.getInstorage()+buyIntoWarehouse.getPrquantity()- originalnumber);
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +buyIntoWarehouse.getPrquantity() - originalnumber - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,buyIntoWarehouse.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,buyIntoWarehouse.getPrid());
			pstmt4.setString(2,buyIntoWarehouse.getPrname());
			pstmt4.setString(3,buyIntoWarehouse.getPrkind());
			pstmt4.setString(4,buyIntoWarehouse.getMaterial());
			pstmt4.setString(5,buyIntoWarehouse.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, buyIntoWarehouse.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, buyIntoWarehouse.getPrquantity());		
			pstmt4.setString(11, buyIntoWarehouse.getSupplier());		
			pstmt4.setString(12, buyIntoWarehouse.getWarehouse());
			pstmt4.setString(13, buyIntoWarehouse.getRemarks());		
		    pstmt4.executeUpdate();
		}
		
		return pstmt.executeUpdate();
	}
}
