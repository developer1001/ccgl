package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.ProduceIntoWarehouse;
import com.dyj.model.ProfitsCount;
import com.dyj.util.StringUtil;

public class ProduceIntoWarehouseDao {
	
	public ResultSet produceIntoWarehouseList(Connection con,PageBean pageBean,ProduceIntoWarehouse produceIntoWarehouse)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_putinstorage");
		if(produceIntoWarehouse!=null&&StringUtil.isNotEmpty(produceIntoWarehouse.getPrname())){
			sb.append(" and PRNAME like '%"+produceIntoWarehouse.getPrname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int produceIntoWarehouseCount(Connection con,ProduceIntoWarehouse produceIntoWarehouse) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_putinstorage");
		if(StringUtil.isNotEmpty(produceIntoWarehouse.getPrname())){
			sb.append(" and PRNAME like '%"+produceIntoWarehouse.getPrname()+"%'");
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
	public int produceIntoWarehouseDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_putinstorage where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//search PRNAME from instorage 
		String sqla = "SELECT *  FROM t_putinstorage WHERE INID in(" + delIds + ")";
		PreparedStatement pstmta=con.prepareStatement(sqla);		
		ResultSet rs2=pstmta.executeQuery();		
	//	List<CheckStorage> list = new ArrayList<CheckStorage>();
		List<ProduceIntoWarehouse> listPIW = new ArrayList<ProduceIntoWarehouse>();
//		CheckStorage checkStorage = new CheckStorage();
		ProduceIntoWarehouse produceIntoWarehouse = null;
		while(rs2.next()){
			produceIntoWarehouse = new ProduceIntoWarehouse();
			produceIntoWarehouse.setInid(rs2.getInt("INID"));
			produceIntoWarehouse.setPrid(rs2.getString("PRID"));
			produceIntoWarehouse.setPrname(rs2.getString("PRNAME"));
			produceIntoWarehouse.setPrkind(rs2.getString("PRKIND"));
			produceIntoWarehouse.setMaterial(rs2.getString("MATERIAL"));
			produceIntoWarehouse.setSpecification(rs2.getString("SPECIFICATION"));
			produceIntoWarehouse.setPrcost(rs2.getDouble("PRCOST"));
			produceIntoWarehouse.setPrquantity(rs2.getInt("PRQUANTITY"));
			produceIntoWarehouse.setManufacturer(rs2.getString("MANUFACTURER"));
			produceIntoWarehouse.setPrdate(rs2.getDate("PRDATE"));
			produceIntoWarehouse.setChecher(rs2.getString("CHECHER"));
			produceIntoWarehouse.setWarehouse(rs2.getString("WAREHOUSE"));
			produceIntoWarehouse.setRemarks(rs2.getString("REMARKS"));
			listPIW.add(produceIntoWarehouse);
		//	String sql3 = "select * from t_checkstorage where ";
		}
		for (int i = 0; i < listPIW.size(); i++) {
//			String sql1 =  "select * from t_putinstorage where INID = "+listPIW.get(i).getInid();
//			PreparedStatement pstmt1=con.prepareStatement(sql1);
//			ResultSet rs1 = pstmt1.executeQuery();
//			ProduceIntoWarehouse p0 = new ProduceIntoWarehouse();
//			if(rs1.next()){
//				p0.setPrquantity(rs1.getInt("PRQUANTITY"));
//			}
//			int originalnumber = p0.getPrquantity();
			ResultSet rs;
			List<CheckStorage> list = new ArrayList<CheckStorage>();		
			String sql2 = "select * from t_checkstorage where PRID = '" + listPIW.get(i).getPrid()+"'";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			CheckStorage checkStorage = new CheckStorage();
			while(rs.next()){						 
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
				pstmt3.setInt(8, checkStorage.getInstorage()-listPIW.get(i).getPrquantity());
				pstmt3.setInt(9, checkStorage.getOutstorage());
				pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() -listPIW.get(i).getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
				pstmt3.setString(11, checkStorage.getSupplier());		
				pstmt3.setString(12, checkStorage.getWarehouse());
				pstmt3.setString(13,checkStorage.getRemarks());
				pstmt3.setString(14,checkStorage.getPrid());
				pstmt3.executeUpdate();
			}
			if(list.isEmpty()){
				String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt4=con.prepareStatement(sql4);
				pstmt4.setString(1,listPIW.get(i).getPrid());
				pstmt4.setString(2,listPIW.get(i).getPrname());
				pstmt4.setString(3,listPIW.get(i).getPrkind());
				pstmt4.setString(4,listPIW.get(i).getMaterial());
				pstmt4.setString(5,listPIW.get(i).getSpecification());
				pstmt4.setInt(6, 0);
				pstmt4.setInt(7, 0);
				pstmt4.setInt(8, -listPIW.get(i).getPrquantity());
				pstmt4.setInt(9, 0);
				pstmt4.setInt(10, -listPIW.get(i).getPrquantity());		
				pstmt4.setString(11, listPIW.get(i).getManufacturer());		
				pstmt4.setString(12, listPIW.get(i).getWarehouse());
				pstmt4.setString(13, listPIW.get(i).getRemarks());		
			    pstmt4.executeUpdate();
			}
			
		}
		
		return pstmt.executeUpdate();
	}
	
	//
	public int produceIntoWarehouseAdd(Connection con,ProduceIntoWarehouse produceIntoWarehouse) throws Exception {
		String sql="insert into t_putinstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,PRCOST,PRQUANTITY,MANUFACTURER,PRDATE,CHECHER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);					
		Date utildate = produceIntoWarehouse.getPrdate() ;		
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,produceIntoWarehouse.getPrid());
		pstmt.setString(2,produceIntoWarehouse.getPrname());
		pstmt.setString(3,produceIntoWarehouse.getPrkind());
		pstmt.setString(4,produceIntoWarehouse.getMaterial());
		pstmt.setString(5,produceIntoWarehouse.getSpecification());
		pstmt.setDouble(6, produceIntoWarehouse.getPrcost());
		pstmt.setInt(7, produceIntoWarehouse.getPrquantity());
		pstmt.setString(8, produceIntoWarehouse.getManufacturer());
		pstmt.setDate(9, sqldate);
		pstmt.setString(10, produceIntoWarehouse.getChecher());
		pstmt.setString(11, produceIntoWarehouse.getWarehouse());
		pstmt.setString(12, produceIntoWarehouse.getRemarks());
		//
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + produceIntoWarehouse.getPrid()+"'";
		PreparedStatement pstmt2=con.prepareStatement(sql2);
		rs=pstmt2.executeQuery();
		CheckStorage checkStorage = new CheckStorage();
		while(rs.next()){						 
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
			pstmt3.setInt(8, checkStorage.getInstorage()+produceIntoWarehouse.getPrquantity());
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +produceIntoWarehouse.getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,produceIntoWarehouse.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,produceIntoWarehouse.getPrid());
			pstmt4.setString(2,produceIntoWarehouse.getPrname());
			pstmt4.setString(3,produceIntoWarehouse.getPrkind());
			pstmt4.setString(4,produceIntoWarehouse.getMaterial());
			pstmt4.setString(5,produceIntoWarehouse.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, produceIntoWarehouse.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, produceIntoWarehouse.getPrquantity());		
			pstmt4.setString(11, produceIntoWarehouse.getManufacturer());		
			pstmt4.setString(12, produceIntoWarehouse.getWarehouse());
			pstmt4.setString(13, produceIntoWarehouse.getRemarks());		
		    pstmt4.executeUpdate();
		}
		
		return pstmt.executeUpdate();
	}
	
	//
	public int produceIntoWarehouseModify(Connection con,ProduceIntoWarehouse produceIntoWarehouse) throws Exception{
		String sql="update t_putinstorage set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,PRCOST=?,PRQUANTITY=?,MANUFACTURER=?,PRDATE=?,CHECHER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		
		PreparedStatement pstmt=con.prepareStatement(sql);	
		Date utildate = produceIntoWarehouse.getPrdate() ;				
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,produceIntoWarehouse.getPrid());
		pstmt.setString(2,produceIntoWarehouse.getPrname());
		pstmt.setString(3,produceIntoWarehouse.getPrkind());
		pstmt.setString(4,produceIntoWarehouse.getMaterial());
		pstmt.setString(5,produceIntoWarehouse.getSpecification());
		pstmt.setDouble(6, produceIntoWarehouse.getPrcost());
		pstmt.setInt(7, produceIntoWarehouse.getPrquantity());
		pstmt.setString(8, produceIntoWarehouse.getManufacturer());
		pstmt.setDate(9, sqldate);
		pstmt.setString(10, produceIntoWarehouse.getChecher());
		pstmt.setString(11, produceIntoWarehouse.getWarehouse());
		pstmt.setString(12, produceIntoWarehouse.getRemarks());
		pstmt.setInt(13,produceIntoWarehouse.getInid());
		//更改入库记录时，去入库表查询被修改记录的产品原来入库数量，originalnumber
		String sql1 =  "select * from t_putinstorage where INID = "+produceIntoWarehouse.getInid();
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		ProduceIntoWarehouse p0 = new ProduceIntoWarehouse();
		if(rs1.next()){
			p0.setPrquantity(rs1.getInt("PRQUANTITY"));
		}
		int originalnumber = p0.getPrquantity();
		//update t_checkstorage
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + produceIntoWarehouse.getPrid()+"'";
		PreparedStatement pstmt2=con.prepareStatement(sql2);
		rs=pstmt2.executeQuery();
		CheckStorage checkStorage = new CheckStorage();
		while(rs.next()){						 
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
			pstmt3.setInt(8, checkStorage.getInstorage()+produceIntoWarehouse.getPrquantity()- originalnumber);
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +produceIntoWarehouse.getPrquantity() - originalnumber - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,produceIntoWarehouse.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,produceIntoWarehouse.getPrid());
			pstmt4.setString(2,produceIntoWarehouse.getPrname());
			pstmt4.setString(3,produceIntoWarehouse.getPrkind());
			pstmt4.setString(4,produceIntoWarehouse.getMaterial());
			pstmt4.setString(5,produceIntoWarehouse.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, produceIntoWarehouse.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, produceIntoWarehouse.getPrquantity());		
			pstmt4.setString(11, produceIntoWarehouse.getManufacturer());		
			pstmt4.setString(12, produceIntoWarehouse.getWarehouse());
			pstmt4.setString(13, produceIntoWarehouse.getRemarks());		
		    pstmt4.executeUpdate();
		}
		
		return pstmt.executeUpdate();
	}
}
