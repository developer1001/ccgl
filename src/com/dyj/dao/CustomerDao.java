package com.dyj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dyj.model.Customer;
import com.dyj.model.PageBean;
import com.dyj.util.StringUtil;

public class CustomerDao {
	public ResultSet customerList(Connection con,PageBean pageBean,Customer customer)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_customer");
		if(customer!=null&&StringUtil.isNotEmpty(customer.getCustomername())){
			sb.append(" and customerName like '%"+customer.getCustomername()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int customerCount(Connection con,Customer customer)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_customer");
		if(StringUtil.isNotEmpty(customer.getCustomername())){
			sb.append(" and customerName like '%"+customer.getCustomername()+"%'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	//删除客户
	public int customerDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_customer where customerId in('" + delIds + "')";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	//添加客户
	public int customerAdd(Connection con,Customer customer)throws Exception {
		String sql="insert into t_customer values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, customer.getCustomerid());
		pstmt.setString(2, customer.getCustomercompany());
		pstmt.setString(3, customer.getCustomeraddress());
		pstmt.setString(4, customer.getCustomerpostcode());
		pstmt.setString(5, customer.getCustomername());
		pstmt.setString(6, customer.getCustomerphone());
		pstmt.setString(7, customer.getCustomeremail());		
		return pstmt.executeUpdate();
	}
	
	//修改客户信息
	public int customerModify(Connection con,Customer customer)throws Exception{
		String sql="update t_customer set customerCompany=?,customerAddress=?,customerPostcode=?,customerName=?, customerPhone=?,customerEmail=? where customerId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);		
		pstmt.setString(1, customer.getCustomercompany());
		pstmt.setString(2, customer.getCustomeraddress());
		pstmt.setString(3, customer.getCustomerpostcode());
		pstmt.setString(4, customer.getCustomername());
		pstmt.setString(5, customer.getCustomerphone());
		pstmt.setString(6, customer.getCustomeremail());
		pstmt.setString(7, customer.getCustomerid());
		return pstmt.executeUpdate();
	}
	
	//获得所有采购商
		public List<Customer> getCustomers(Connection con)throws Exception{
					
			String sql="select customerId,customerCompany from t_customer ";
			PreparedStatement pstmt=con.prepareStatement(sql);
			ResultSet rs;
			rs = pstmt.executeQuery();
			Customer allcustomers ;
			List<Customer> li = new ArrayList<Customer>();
			while(rs.next()){
				allcustomers = new Customer();
				allcustomers.setCustomerid(rs.getString("customerId"));
				allcustomers.setCustomercompany(rs.getString("customerCompany"));
				li.add(allcustomers);
			}
			return li;
		}
}
