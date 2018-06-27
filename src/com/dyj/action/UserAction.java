package com.dyj.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import com.dyj.dao.CustomerDao;
import com.dyj.dao.UserDao;
import com.dyj.model.Customer;
import com.dyj.model.PageBean;
import com.dyj.model.User;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.mysql.jdbc.ResultSet;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	   private User user;
	   private String page;
	   private String rows;
	   private int    id  ;
	   private String s_name;
	   private String delIds;
	   
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	DbUtil dbUtil=new DbUtil();
	UserDao userdao=new UserDao();
//	GoodDao gooddao = new GoodDao();//?��ɶ
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if(user==null){
					user=new User();
				}
				HttpServletRequest request=(HttpServletRequest)ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				User outUser = (User) session.getAttribute("currentUser");
				String outname = outUser.getUserName(); 
				
				user.setUserName(s_name);//
				user.setPassword(outname);//实际为目前登录用户的用户名
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray(userdao.adminList(con, pageBean,user));
				int total=userdao.userCount(con,user);
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
				int delNums=userdao.adminDelete(con, delIds);
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
		//������Ӻ���޸ĺ�Ĺ���Ա��Ϣ
		public String save()throws Exception{
			if(id!=0){				
				user.setId(id);
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(id!=0){
					saveNums=userdao.adminModify(con, user);
				}else{
					saveNums=userdao.adminAdd(con, user);
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
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(userdao.adminList(con, null,null)));
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
		
		//��������Ա�˻����ܽ���
		public String export()throws Exception{
			Connection con=null;
			try {
				con=dbUtil.getCon();
				Workbook wb=new HSSFWorkbook();
				String headers[]={"�ͻ����","��˾���","��ַ","�ʱ�","��ϵ��","��ϵ�绰","����"};
				if(user==null){
					user=new User();
				}
				user.setUserName(s_name);
				ResultSet rs=(ResultSet) userdao.adminList(con, null, user);
				ExcelUtil.fillExcelData(rs, wb, headers);
				ResponseUtil3.export(ServletActionContext.getResponse(), wb, "�ͻ���excel.xls");
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


		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
}
