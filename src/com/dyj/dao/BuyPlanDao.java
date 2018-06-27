package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dyj.model.BuyPlan;
import com.dyj.model.PageBean;
import com.dyj.util.StringUtil;

public class BuyPlanDao {
	public ResultSet buyPlanList(Connection con,PageBean pageBean,BuyPlan buyplan)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_buyplan");
		if(buyplan!=null&&StringUtil.isNotEmpty(buyplan.getProductname())){
			sb.append(" and productname like '%"+buyplan.getProductname()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int buyPlanCount(Connection con,BuyPlan buyplan)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_buyplan");
		if(StringUtil.isNotEmpty(buyplan.getProductname())){
			sb.append(" and productname like '%"+buyplan.getProductname()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	//删锟斤拷突锟�
	public int buyplanDelete(Connection con,String delIds)throws Exception{	
		String sql="delete from t_buyplan where planId in(" + delIds + ")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//锟斤拷涌突锟�
	public int buyPlanAdd(Connection con,BuyPlan buyplan)throws Exception {
		String sql="insert into t_buyplan(plantime,plansupplier,productname,buyprice, buyccount,totalmoney,planbudget) values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		//time cast
		//java.util.Date utildate =buyplan.getPlantime();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String time = sdf.format(utildate);
	//	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
		//java.sql.Date sqldate = null;
		//try {
			//utildate = format.parse(birthday);
			//sqldate = new java.sql.Date(utildate.getTime());
		//} 
		//person.setBirthday(sqldate);  buyplan.getPlantime()
		//java.sql.Date sqldate =  new java.sql.Date(utildate.getTime());		
		pstmt.setString(1, buyplan.getPlantime());
		pstmt.setString(2, buyplan.getPlansupplier());
		pstmt.setString(3, buyplan.getProductname());
		pstmt.setDouble(4, buyplan.getBuyprice());
		pstmt.setDouble(5, buyplan.getBuyccount());
		pstmt.setDouble(6, buyplan.getBuyprice()*buyplan.getBuyccount());//buyplan.getTotalmoney()
		pstmt.setDouble(7, buyplan.getPlanbudget());		
		return pstmt.executeUpdate();
	}
	
	//锟睫改客伙拷锟斤拷息
	public int buyplanModify(Connection con,BuyPlan buyplan)throws Exception{
		String sql="update t_buyplan set plantime=?,plansupplier=?,productname=?,buyprice=?, buyccount=?,totalmoney=?,planbudget=? where planid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);			
		pstmt.setString(1, buyplan.getPlantime());
		pstmt.setString(2, buyplan.getPlansupplier());
		pstmt.setString(3, buyplan.getProductname());
		pstmt.setDouble(4, buyplan.getBuyprice());
		pstmt.setDouble(5, buyplan.getBuyccount());
		pstmt.setDouble(6,buyplan.getBuyprice()*buyplan.getBuyccount());
		pstmt.setDouble(7, buyplan.getPlanbudget());
		pstmt.setInt(8, buyplan.getPlanid());
		return pstmt.executeUpdate();
	}
}
