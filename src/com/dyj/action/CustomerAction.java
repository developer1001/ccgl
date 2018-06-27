package com.dyj.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import com.dyj.dao.CustomerDao;
import com.dyj.dao.GoodDao;
import com.dyj.model.Customer;
import com.dyj.model.PageBean;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport {
	   private Customer customer;
	   private String page;
	   private String rows;
	   private String customerId;
	   private String s_name;
	   private String delIds;
	   
	   
		public String getDelIds() {
		return delIds;
	}


	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}


		public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getRows() {
		return rows;
	}


	public void setRows(String rows) {
		this.rows = rows;
	}




	public String getCustomerId() {
		return customerId;
	}


	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	DbUtil dbUtil=new DbUtil();
	CustomerDao customerdao=new CustomerDao();
//	GoodDao gooddao = new GoodDao();//?��ɶ
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if(customer==null){
					customer=new Customer();
				}
				customer.setCustomername(s_name);//
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray(customerdao.customerList(con, pageBean,customer));
				int total=customerdao.customerCount(con,customer);
				result.put("rows", jsonArray);
				result.put("total", total);
				ResponseUtil.write(ServletActionContext.getResponse(), result);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
	}
	
	//ɾ��ͻ�
		public String delete()throws Exception{
			Connection con=null;
			try{
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				int delNums=customerdao.customerDelete(con, delIds);
				//String str[]=delIds.split(",");
//				for(int i=0;i<str.length;i++){
//					boolean f=gooddao.getGoodByGoodcategoriesId(con, str[i]);
//					if(f){
//						result.put("errorIndex",i);
//						result.put("errorMsg", "�ͻ���������Ʒ������ɾ��!");
//						ResponseUtil.write(ServletActionContext.getResponse(), result);
//						return null;
//					}
//				}
	//			int delNums=customerdao.customerDelete(con, delIds);
				if(delNums>0){
					result.put("success", "true");
					result.put("delNums", delNums);
				}else{
					result.put("errorMsg", "ɾ��ʧ��");
				}
				ResponseUtil.write(ServletActionContext.getResponse(), result);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		}
		//
		public String save()throws Exception{
			if(StringUtil.isNotEmpty(customerId)){
				customer.setCustomerid(customerId);				
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(StringUtil.isNotEmpty(customerId)){
					saveNums=customerdao.customerModify(con, customer);
				}else{
					saveNums=customerdao.customerAdd(con, customer);
				}
				if(saveNums>0){
					result.put("success", "true");
				}else{
					result.put("success", "true");
					result.put("errorMsg", "����ʧ��");
				}
				ResponseUtil.write(ServletActionContext.getResponse(), result);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		}
		public String gradeComboList() throws Exception{
			Connection con=null;
			try{
			con=dbUtil.getCon();
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("id", "");
			jsonObject.put("gradeName", "��ѡ��...");
			jsonArray.add(jsonObject);
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(customerdao.customerList(con, null,null)));
			ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			return null;
		}
		public String export()throws Exception{
			Connection con=null;
			try {
				con=dbUtil.getCon();
				Workbook wb=new HSSFWorkbook();
				String headers[]={"采购商编号","采购商公司","采购商地址","邮编","联系人","联系电话","备注"};
				if(customer==null){
					customer=new Customer();
				}
				customer.setCustomername(s_name);
				ResultSet rs=customerdao.customerList(con, null, customer);
				ExcelUtil.fillExcelData(rs, wb, headers);
				ResponseUtil3.export(ServletActionContext.getResponse(), wb, "excel.xls");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		}
		
		public void getPartner() throws Exception{			
			Connection con=null;
			try{
				con=dbUtil.getCon();
				CustomerDao customerdao = new CustomerDao();
				List<Customer> li = customerdao.getCustomers(con);
				HttpServletRequest request=(HttpServletRequest)ServletActionContext.getRequest();
				request.setAttribute("li", li);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
					} catch (Exception e) {					
						e.printStackTrace();
						}
			}
			
		}


		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
}
