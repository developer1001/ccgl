package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.SaleOut;
import com.dyj.model.SalesReturn;
import com.dyj.util.StringUtil;

public class SaleOutDao {
	
	public ResultSet theList(Connection con,PageBean pageBean,SaleOut saleOut)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_saleout");
		if(saleOut != null && StringUtil.isNotEmpty(saleOut.getPrname())){
			sb.append(" and PRNAME like '%"+saleOut.getPrname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int theCount(Connection con,SaleOut saleOut) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_saleout");
		if(StringUtil.isNotEmpty(saleOut.getPrname())){
			sb.append(" and PRNAME like '%"+saleOut.getPrname()+"%'");
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
		String sql="delete from t_saleout where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//
		String sqla = "SELECT *  FROM t_saleout WHERE INID in(" + delIds + ")";
		PreparedStatement pstmta=con.prepareStatement(sqla);		
		ResultSet rs2=pstmta.executeQuery();		
		List<SaleOut> listA = new ArrayList<SaleOut>();
		SaleOut saleOut = null;
		while(rs2.next()){
			saleOut = new SaleOut();
			saleOut.setInid(rs2.getInt("INID"));
			saleOut.setPrid(rs2.getString("PRID"));
			saleOut.setPrname(rs2.getString("PRNAME"));
			saleOut.setPrkind(rs2.getString("PRKIND"));
			saleOut.setMaterial(rs2.getString("MATERIAL"));
			saleOut.setSpecification(rs2.getString("SPECIFICATION"));
			saleOut.setOriginalprice(rs2.getDouble("ORIGINALPRICE"));
			saleOut.setPrprice(rs2.getDouble("PRPRICE"));
			saleOut.setPrcost(rs2.getDouble("PRCOST"));
			saleOut.setPrquantity(rs2.getInt("PRQUANTITY"));
			saleOut.setPrprofits(rs2.getDouble("PRPROFITS"));
			saleOut.setManufacturer(rs2.getString("MANUFACTURER"));
			saleOut.setPrdate(rs2.getDate("PRDATE"));
			saleOut.setChecher(rs2.getString("CHECHER"));
			saleOut.setWarehouse(rs2.getString("WAREHOUSE"));
			saleOut.setRemarks(rs2.getString("REMARKS"));						
			listA.add(saleOut);
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
				pstmt4.setString(11, listA.get(i).getManufacturer());		
				pstmt4.setString(12, listA.get(i).getWarehouse());
				pstmt4.setString(13, listA.get(i).getRemarks());		
			    pstmt4.executeUpdate();
			}
			
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int theAdd(Connection con,SaleOut saleOut) throws Exception {
		String sql="insert into t_saleOut(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,ORIGINALPRICE,PRPRICE,PRQUANTITY,PRCOST,PRPROFITS,MANUFACTURER,PRDATE,CHECHER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);			
		Date utildate = saleOut.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,saleOut.getPrid());
		pstmt.setString(2,saleOut.getPrname());
		pstmt.setString(3,saleOut.getPrkind());
		pstmt.setString(4,saleOut.getMaterial());
		pstmt.setString(5,saleOut.getSpecification());
		pstmt.setDouble(6, saleOut.getOriginalprice());
		pstmt.setDouble(7, saleOut.getPrprice());
		pstmt.setInt(8, saleOut.getPrquantity());
		pstmt.setDouble(9, saleOut.getPrprice() *  saleOut.getPrquantity());
		pstmt.setDouble(10, saleOut.getPrprice() *  saleOut.getPrquantity() - saleOut.getOriginalprice() * saleOut.getPrquantity() );
		pstmt.setString(11, saleOut.getManufacturer());
		pstmt.setDate(12, sqldate);
		pstmt.setString(13, saleOut.getChecher());
		pstmt.setString(14, saleOut.getWarehouse());
		pstmt.setString(15, saleOut.getRemarks());
		
		//
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + saleOut.getPrid()+"'";
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
			pstmt3.setInt(9, checkStorage.getOutstorage() + saleOut.getPrquantity());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() - saleOut.getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,saleOut.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,saleOut.getPrid());
			pstmt4.setString(2,saleOut.getPrname());
			pstmt4.setString(3,saleOut.getPrkind());
			pstmt4.setString(4,saleOut.getMaterial());
			pstmt4.setString(5,saleOut.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, 0);
			pstmt4.setInt(9, saleOut.getPrquantity());
			pstmt4.setInt(10, -saleOut.getPrquantity());		
			pstmt4.setString(11, saleOut.getManufacturer());		
			pstmt4.setString(12, saleOut.getWarehouse());
			pstmt4.setString(13, saleOut.getRemarks());		
		    pstmt4.executeUpdate();
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int theModify(Connection con,SaleOut saleOut) throws Exception{
		String sql="update t_saleout set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,ORIGINALPRICE=?,PRPRICE=?,PRQUANTITY=?,PRCOST=?,PRPROFITS=?,MANUFACTURER=?,PRDATE=?,CHECHER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		
		Date utildate = saleOut.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,saleOut.getPrid());
		pstmt.setString(2,saleOut.getPrname());
		pstmt.setString(3,saleOut.getPrkind());
		pstmt.setString(4,saleOut.getMaterial());
		pstmt.setString(5,saleOut.getSpecification());
		pstmt.setDouble(6, saleOut.getOriginalprice());
		pstmt.setDouble(7, saleOut.getPrprice());
		pstmt.setInt(8, saleOut.getPrquantity());
		pstmt.setDouble(9, saleOut.getPrprice() *  saleOut.getPrquantity());
		pstmt.setDouble(10, saleOut.getPrprice() *  saleOut.getPrquantity() - saleOut.getOriginalprice() * saleOut.getPrquantity());
		pstmt.setString(11, saleOut.getManufacturer());
		pstmt.setDate(12, sqldate);
		pstmt.setString(13, saleOut.getChecher());
		pstmt.setString(14, saleOut.getWarehouse());
		pstmt.setString(15, saleOut.getRemarks());
		pstmt.setInt(16,saleOut.getInid());
		
		//
		String sql1 =  "select * from t_saleout where INID = "+saleOut.getInid();
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		SaleOut p0 = new SaleOut();
		if(rs1.next()){
			p0.setPrquantity(rs1.getInt("PRQUANTITY"));
		}
		int originalnumber = p0.getPrquantity();
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + saleOut.getPrid()+"'";
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
			pstmt3.setInt(9, checkStorage.getOutstorage()+saleOut.getPrquantity()- originalnumber);
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() -saleOut.getPrquantity() + originalnumber - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,saleOut.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,saleOut.getPrid());
			pstmt4.setString(2,saleOut.getPrname());
			pstmt4.setString(3,saleOut.getPrkind());
			pstmt4.setString(4,saleOut.getMaterial());
			pstmt4.setString(5,saleOut.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, 0);
			pstmt4.setInt(9, saleOut.getPrquantity());
			pstmt4.setInt(10, saleOut.getPrquantity());		
			pstmt4.setString(11, saleOut.getManufacturer());		
			pstmt4.setString(12, saleOut.getWarehouse());
			pstmt4.setString(13, saleOut.getRemarks());		
		    pstmt4.executeUpdate();
		}
		
		return pstmt.executeUpdate();
	}
}
