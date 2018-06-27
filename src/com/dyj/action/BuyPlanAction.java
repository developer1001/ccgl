package com.dyj.action;

import java.sql.Connection;
import java.sql.ResultSet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import com.dyj.dao.BuyPlanDao;
import com.dyj.model.BuyPlan;
import com.dyj.model.PageBean;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class BuyPlanAction extends ActionSupport {
	  private BuyPlan buyplan;
	   private String page;
	   private String rows;
	   private String planid;
	   private String s_name;
	   private String delIds;
	   
	   
	public BuyPlan getBuyplan() {
		return buyplan;
	}

	public void setBuyplan(BuyPlan buyplan) {
		this.buyplan = buyplan;
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

	public String getPlanid() {
		return planid;
	}

	public void setPlanid(String planid) {
		this.planid = planid;
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
	BuyPlanDao buyplandao=new  BuyPlanDao();
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if( buyplan==null){
					 buyplan=new BuyPlan();
				}
				 buyplan.setProductname(s_name);//
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray( buyplandao. buyPlanList(con, pageBean, buyplan));
				int total= buyplandao. buyPlanCount(con, buyplan);
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
				int delNums= buyplandao.buyplanDelete(con, delIds);
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
			if(StringUtil.isNotEmpty(planid)){
				 buyplan.setPlanid(Integer.parseInt(planid));				
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(StringUtil.isNotEmpty(planid)){
					saveNums=buyplandao.buyplanModify(con, buyplan);
				}else{
					saveNums=buyplandao.buyPlanAdd(con, buyplan);
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
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(buyplandao.buyPlanList(con, null,null)));
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
				String headers[]={"�ͻ����","��˾���","��ַ","�ʱ�","��ϵ��","��ϵ�绰","����",""};
				if(buyplan==null){
					buyplan=new BuyPlan();
				}
				buyplan.setProductname(s_name);
				ResultSet rs=buyplandao.buyPlanList(con, null, buyplan);
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
