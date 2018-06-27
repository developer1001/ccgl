package com.dyj.action;

import java.sql.Connection;
import java.sql.ResultSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import com.dyj.dao.CheckStorageDao;
import com.dyj.dao.SaleOutDao;
import com.dyj.model.CheckStorage;
import com.dyj.model.PageBean;
import com.dyj.model.SaleOut;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class CheckstorageAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	  private CheckStorage checkStorage;
	   private String page;
	   private String rows;
	   private String INID;
	   private String s_name;
	   private String s_alarm ;
	   private String s_alarmto ;
	   private String delIds;	   	   	

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

	
	public String getS_alarm() {
		return s_alarm;
	}

	public void setS_alarm(String s_alarm) {
		this.s_alarm = s_alarm;
	}

	public String getS_alarmto() {
		return s_alarmto;
	}

	public void setS_alarmto(String s_alarmto) {
		this.s_alarmto = s_alarmto;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getINID() {
		return INID;
	}

	public void setINID(String iNID) {
		INID = iNID;
	}
		
	public CheckStorage getCheckStorage() {
		return checkStorage;
	}

	public void setCheckStorage(CheckStorage checkStorage) {
		this.checkStorage = checkStorage;
	}


	DbUtil dbUtil=new DbUtil();
	CheckStorageDao checkStorageDao=new  CheckStorageDao();
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if( checkStorage==null){
					checkStorage=new CheckStorage();
				}
				checkStorage.setPrname(s_name);
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray(checkStorageDao. theList(con, pageBean, checkStorage,s_alarm,s_alarmto));
				int total= checkStorageDao.theCount(con, checkStorage,s_alarm,s_alarmto);
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
		public String delete() throws Exception{
			Connection con=null;
			try{
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				int delNums= checkStorageDao.theDelete(con, delIds);
				if(delNums>0){
					result.put("success", "true");
					result.put("delNums", delNums);
				}else{
					result.put("errorMsg", "error");
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
		//
		public String save() throws Exception{
			if(StringUtil.isNotEmpty(INID)){
				checkStorage.setInid(Integer.parseInt(INID));				
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(StringUtil.isNotEmpty(INID)){
					saveNums=checkStorageDao.theModify(con, checkStorage);
				}else{
					saveNums=checkStorageDao.theAdd(con, checkStorage);
				}
				if(saveNums>0){
					result.put("success", "true");
				}else{
					result.put("success", "true");
					result.put("errorMsg", "error");
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
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(checkStorageDao.theList(con, null,null, s_alarm, s_alarmto)));
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
				String headers[]={"编号","产品编号","产品名","产品类别","材质","产品规格","报溢","报损","出库","入库","库存","合作商","仓库号","备注"};
				if(checkStorage==null){
					checkStorage=new CheckStorage();
				}
				checkStorage.setPrname(s_name);
				ResultSet rs=checkStorageDao.theList(con, null, checkStorage, s_alarm, s_alarmto);
				ExcelUtil.fillExcelData(rs, wb, headers);
				ResponseUtil3.export(ServletActionContext.getResponse(), wb, "print.xls");
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

		

		
	
}
