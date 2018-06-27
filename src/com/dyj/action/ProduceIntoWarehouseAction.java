package com.dyj.action;

import java.sql.Connection;
import java.sql.ResultSet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import com.dyj.dao.ProduceIntoWarehouseDao;
import com.dyj.model.PageBean;
import com.dyj.model.ProduceIntoWarehouse;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ProduceIntoWarehouseAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	   private ProduceIntoWarehouse produceIntoWarehouse;
	   private String page;
	   private String rows;
	   private String INID;
	   private String s_name;
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

	public ProduceIntoWarehouse getProduceIntoWarehouse() {
		return produceIntoWarehouse;
	}

	public void setProduceIntoWarehouse(ProduceIntoWarehouse produceIntoWarehouse) {
		this.produceIntoWarehouse = produceIntoWarehouse;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	DbUtil dbUtil=new DbUtil();
	ProduceIntoWarehouseDao produceIntoWarehouseDao=new  ProduceIntoWarehouseDao();
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if( produceIntoWarehouse==null){
					produceIntoWarehouse=new ProduceIntoWarehouse();
				}
			    produceIntoWarehouse.setPrname(s_name);
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray(produceIntoWarehouseDao. produceIntoWarehouseList(con, pageBean, produceIntoWarehouse));
				int total= produceIntoWarehouseDao.produceIntoWarehouseCount(con, produceIntoWarehouse);
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
				int delNums= produceIntoWarehouseDao.produceIntoWarehouseDelete(con, delIds);
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
				produceIntoWarehouse.setInid(Integer.parseInt(INID));				
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(StringUtil.isNotEmpty(INID)){
					saveNums=produceIntoWarehouseDao.produceIntoWarehouseModify(con, produceIntoWarehouse);
				}else{
					saveNums=produceIntoWarehouseDao.produceIntoWarehouseAdd(con, produceIntoWarehouse);
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
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(produceIntoWarehouseDao.produceIntoWarehouseList(con, null,null)));
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
				String headers[]={"编号","产品编号","产品名","产品类别","产品规格","成本","数量","制造商","生产日期","检验员","入库号","备注"};
				if(produceIntoWarehouse==null){
					produceIntoWarehouse=new ProduceIntoWarehouse();
				}
				produceIntoWarehouse.setPrname(s_name);
				ResultSet rs=produceIntoWarehouseDao.produceIntoWarehouseList(con, null, produceIntoWarehouse);
				ExcelUtil.fillExcelData(rs, wb, headers);
				ResponseUtil3.export(ServletActionContext.getResponse(), wb, "生产入库清单.xls");
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

		public String getINID() {
			return INID;
		}

		public void setINID(String iNID) {
			INID = iNID;
		}
}
