package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dyj.model.Log;
import com.dyj.util.StringUtil;

public class JfreeChartDao {
	
	public double[][] detailCount(Connection con)throws Exception{
		StringBuffer sb1=new StringBuffer("SELECT SUM(OVERFLOW) AS over1 FROM t_checkstorage; ");
		StringBuffer sb2=new StringBuffer("SELECT SUM(PRLOSE) AS lose1 FROM t_checkstorage;");
		StringBuffer sb3=new StringBuffer("SELECT SUM(INSTORAGE) AS in1 FROM t_checkstorage;");
		StringBuffer sb4=new StringBuffer("SELECT SUM(OUTSTORAGE) AS out1 FROM t_checkstorage;");
		StringBuffer sb5=new StringBuffer("SELECT SUM(PRQUANTITY) AS total1 FROM t_checkstorage;");
		StringBuffer sb6=new StringBuffer("SELECT COUNT(*) AS over2 FROM t_checkstorage WHERE OVERFLOW > 0;");
		StringBuffer sb7=new StringBuffer("SELECT COUNT(*) AS lose2 FROM t_checkstorage WHERE PRLOSE > 0;");
		StringBuffer sb8=new StringBuffer("SELECT COUNT(*) AS total2 FROM t_checkstorage WHERE PRQUANTITY <0;");
		PreparedStatement pstmt1=con.prepareStatement(sb1.toString());
		PreparedStatement pstmt2=con.prepareStatement(sb2.toString());
		PreparedStatement pstmt3=con.prepareStatement(sb3.toString());
		PreparedStatement pstmt4=con.prepareStatement(sb4.toString());
		PreparedStatement pstmt5=con.prepareStatement(sb5.toString());
		PreparedStatement pstmt6=con.prepareStatement(sb6.toString());
		PreparedStatement pstmt7=con.prepareStatement(sb7.toString());
		PreparedStatement pstmt8=con.prepareStatement(sb8.toString());
		ResultSet rs1=pstmt1.executeQuery();
		ResultSet rs2=pstmt2.executeQuery();
		ResultSet rs3=pstmt3.executeQuery();
		ResultSet rs4=pstmt4.executeQuery();
		ResultSet rs5=pstmt5.executeQuery();
		ResultSet rs6=pstmt6.executeQuery();
		ResultSet rs7=pstmt7.executeQuery();
		ResultSet rs8=pstmt8.executeQuery();
		
		double[][] detail = new double[8][1];
				
		
		if(rs1.next()){
			detail[0][0] = rs1.getDouble("over1")/100;
		}else{
			detail[0][0] = 0;
		}
		if(rs2.next()){
			detail[1][0] = rs2.getDouble("lose1")/100;
		}else{
			detail[1][0] = 0 ;
		}
		if(rs3.next()){
			detail[2][0] = rs3.getDouble("in1")/1000;
		}else{
			detail[2][0] = 0 ;
		}
		if(rs4.next()){
			detail[3][0] = rs4.getDouble("out1")/1000;
		}else{
			detail[3][0] = 0 ;
		}
		if(rs5.next()){
			detail[4][0] = rs5.getDouble("total1")/1000;
		}else{
			detail[4][0] = 0 ;
		}
		if(rs6.next()){
			detail[5][0] = rs6.getDouble("over2");
		}else{
			detail[5][0] = 0 ;
		}
		if(rs7.next()){
			detail[6][0] = rs7.getDouble("lose2");
		}else{
			detail[6][0] = 0;
		}
		if(rs8.next()){
			detail[7][0] = rs8.getDouble("total2") ;
		}else{
			detail[7][0] = 0 ;
		}
		
		
		return detail;
	}
}
