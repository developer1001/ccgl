package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dyj.model.CheckStorage;
import com.dyj.model.MaterialReturn;
import com.dyj.model.PageBean;
import com.dyj.model.SalesReturn;
import com.dyj.util.StringUtil;

public class MaterialReturnDao {
	public ResultSet theList(Connection con,PageBean pageBean,MaterialReturn materialReturn)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_materialReturn");
		if(materialReturn!=null&&StringUtil.isNotEmpty(materialReturn.getPrname())){
			sb.append(" and PRNAME like '%"+materialReturn.getPrname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int theCount(Connection con,MaterialReturn materialReturn) throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_materialReturn");
		if(StringUtil.isNotEmpty(materialReturn.getPrname())){
			sb.append(" and PRNAME like '%"+materialReturn.getPrname()+"%'");
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
		String sql="delete from t_materialReturn where INID in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//
		String sqla = "SELECT *  FROM t_materialreturn WHERE INID in(" + delIds + ")";
		PreparedStatement pstmta=con.prepareStatement(sqla);		
		ResultSet rs2=pstmta.executeQuery();		
		List<MaterialReturn> listA = new ArrayList<MaterialReturn>();
		MaterialReturn materialReturn = null;
		while(rs2.next()){
			materialReturn = new MaterialReturn();
			materialReturn.setInid(rs2.getInt("INID"));
			materialReturn.setPrid(rs2.getString("PRID"));
			materialReturn.setPrname(rs2.getString("PRNAME"));
			materialReturn.setPrkind(rs2.getString("PRKIND"));
			materialReturn.setMaterial(rs2.getString("MATERIAL"));
			materialReturn.setSpecification(rs2.getString("SPECIFICATION"));
			materialReturn.setPrquantity(rs2.getInt("PRQUANTITY"));
			materialReturn.setPrdate(rs2.getDate("PRDATE"));
			materialReturn.setChecher(rs2.getString("CHECHER"));
			materialReturn.setWarehouse(rs2.getString("WAREHOUSE"));
			materialReturn.setRemarks(rs2.getString("REMARKS"));
			listA.add(materialReturn);
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
				pstmt4.setString(11, "");		
				pstmt4.setString(12, listA.get(i).getWarehouse());
				pstmt4.setString(13, listA.get(i).getRemarks());		
			    pstmt4.executeUpdate();
			}
			
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int theAdd(Connection con,MaterialReturn materialReturn) throws Exception {
		String sql="insert into t_materialReturn(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,PRQUANTITY,PRDATE,CHECHER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);			
		Date utildate = materialReturn.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,materialReturn.getPrid());
		pstmt.setString(2,materialReturn.getPrname());
		pstmt.setString(3,materialReturn.getPrkind());
		pstmt.setString(4,materialReturn.getMaterial());
		pstmt.setString(5,materialReturn.getSpecification());
		pstmt.setInt(6, materialReturn.getPrquantity());
		pstmt.setDate(7, sqldate);
		pstmt.setString(8, materialReturn.getChecher());
		pstmt.setString(9, materialReturn.getWarehouse());
		pstmt.setString(10, materialReturn.getRemarks());
		
		//
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + materialReturn.getPrid()+"'";
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
			pstmt3.setInt(8, checkStorage.getInstorage()+materialReturn.getPrquantity());
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +materialReturn.getPrquantity() - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,materialReturn.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,materialReturn.getPrid());
			pstmt4.setString(2,materialReturn.getPrname());
			pstmt4.setString(3,materialReturn.getPrkind());
			pstmt4.setString(4,materialReturn.getMaterial());
			pstmt4.setString(5,materialReturn.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, materialReturn.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, materialReturn.getPrquantity());		
//			pstmt4.setString(11, "");		
			pstmt4.setString(11, materialReturn.getWarehouse());
			pstmt4.setString(12, materialReturn.getRemarks());		
		    pstmt4.executeUpdate();
		}
		return pstmt.executeUpdate();
	}
	
	//
	public int theModify(Connection con,MaterialReturn materialReturn) throws Exception{
		String sql="update t_materialReturn set PRID=?,PRNAME=?,PRKIND=?,MATERIAL=?, SPECIFICATION=?,PRQUANTITY=?,PRDATE=?,CHECHER=?,WAREHOUSE=?,REMARKS=? where INID=?";
		PreparedStatement pstmt=con.prepareStatement(sql);	
		Date utildate = materialReturn.getPrdate() ;			
		java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());
		pstmt.setString(1,materialReturn.getPrid());
		pstmt.setString(2,materialReturn.getPrname());
		pstmt.setString(3,materialReturn.getPrkind());
		pstmt.setString(4,materialReturn.getMaterial());
		pstmt.setString(5,materialReturn.getSpecification());
		pstmt.setInt(6, materialReturn.getPrquantity());
		pstmt.setDate(7, sqldate);
		pstmt.setString(8, materialReturn.getChecher());
		pstmt.setString(9, materialReturn.getWarehouse());
		pstmt.setString(10, materialReturn.getRemarks());	
		pstmt.setInt(11,materialReturn.getInid());
		
		//
		String sql1 =  "select * from t_materialreturn where INID = "+materialReturn.getInid();
		PreparedStatement pstmt1=con.prepareStatement(sql1);
		ResultSet rs1 = pstmt1.executeQuery();
		MaterialReturn p0 = new MaterialReturn();
		if(rs1.next()){
			p0.setPrquantity(rs1.getInt("PRQUANTITY"));
		}
		int originalnumber = p0.getPrquantity();
		ResultSet rs;
		List<CheckStorage> list = new ArrayList<CheckStorage>();		
		String sql2 = "select * from t_checkstorage where PRID = '" + materialReturn.getPrid()+"'";
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
			pstmt3.setInt(8, checkStorage.getInstorage()+materialReturn.getPrquantity()- originalnumber);
			pstmt3.setInt(9, checkStorage.getOutstorage());
			pstmt3.setInt(10, checkStorage.getOverflow() +  checkStorage.getInstorage() +materialReturn.getPrquantity() - originalnumber - checkStorage.getPrlose() - checkStorage.getOutstorage());		
			pstmt3.setString(11, checkStorage.getSupplier());		
			pstmt3.setString(12, checkStorage.getWarehouse());
			pstmt3.setString(13,materialReturn.getRemarks());
			pstmt3.setString(14,checkStorage.getPrid());
			pstmt3.executeUpdate();
		}
		if(list.isEmpty()){
			String sql4 ="insert into t_checkstorage(PRID,PRNAME,PRKIND,MATERIAL,SPECIFICATION,OVERFLOW,PRLOSE,INSTORAGE,OUTSTORAGE,PRQUANTITY,SUPPLIER,WAREHOUSE,REMARKS) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt4=con.prepareStatement(sql4);
			pstmt4.setString(1,materialReturn.getPrid());
			pstmt4.setString(2,materialReturn.getPrname());
			pstmt4.setString(3,materialReturn.getPrkind());
			pstmt4.setString(4,materialReturn.getMaterial());
			pstmt4.setString(5,materialReturn.getSpecification());
			pstmt4.setInt(6, 0);
			pstmt4.setInt(7, 0);
			pstmt4.setInt(8, materialReturn.getPrquantity());
			pstmt4.setInt(9, 0);
			pstmt4.setInt(10, materialReturn.getPrquantity());		
			pstmt4.setString(11, "");		
			pstmt4.setString(12, materialReturn.getWarehouse());
			pstmt4.setString(13, materialReturn.getRemarks());		
		    pstmt4.executeUpdate();
		}
		
		return pstmt.executeUpdate();
	}
	
}
