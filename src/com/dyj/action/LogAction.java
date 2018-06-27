package com.dyj.action;
import java.sql.Connection;
import java.sql.ResultSet;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import com.dyj.dao.LogDao;
import com.dyj.model.Log;
import com.dyj.model.PageBean;
import com.dyj.util.DbUtil;
import com.dyj.util.ExcelUtil;
import com.dyj.util.JsonUtil;
import com.dyj.util.ResponseUtil;
import com.dyj.util.ResponseUtil3;
import com.dyj.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class LogAction extends ActionSupport {
	   private Log log;
	   private String page;
	   private String rows;
	   private Integer logid;
	   private String s_name;
	   private String s_timefrom;
	   private String s_timeto;


	public String getS_timefrom() {
		return s_timefrom;
	}

	public void setS_timefrom(String s_timefrom) {
		this.s_timefrom = s_timefrom;
	}

	public String getS_timeto() {
		return s_timeto;
	}

	public void setS_timeto(String s_timeto) {
		this.s_timeto = s_timeto;
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
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

	public Integer getLogid() {
		return logid;
	}

	public void setLogid(Integer logid) {
		this.logid = logid;
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
	LogDao logdao = new LogDao();
//	GoodDao gooddao = new GoodDao();//
	@Override
	public String execute() throws Exception {
			Connection con=null;
			PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
			try{
				if(log==null){
					log=new Log();
				}
				log.setLoguser(s_name);//
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				JSONArray jsonArray=JsonUtil.formatRsToJsonArray(logdao.logList(con, pageBean,log,s_timefrom,s_timeto));
				int total=logdao.logCount(con,log,s_timefrom,s_timeto);
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
	
	
//		public String gradeComboList() throws Exception{
//			Connection con=null;
//			try{
//			con=dbUtil.getCon();
//			JSONArray jsonArray=new JSONArray();
//			JSONObject jsonObject=new JSONObject();
//			jsonObject.put("id", "");
//			jsonObject.put("gradeName", "锟斤拷选锟斤拷...");
//			jsonArray.add(jsonObject);
//			jsonArray.addAll(JsonUtil.formatRsToJsonArray(logdao.logList(con, null,null)));
//			ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally{
//			try {
//				dbUtil.closeCon(con);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//			return null;
//		}
		
		public String export()throws Exception{
//			Connection con=null;
//			try {
//				con=dbUtil.getCon();
//				Workbook wb=new HSSFWorkbook();
//				String headers[]={"锟酵伙拷锟斤拷锟�,"锟斤拷司锟斤拷锟�,"锟斤拷址","锟绞憋拷","锟斤拷系锟斤拷","锟斤拷系锟界话","锟斤拷锟斤拷"};
//				if(customer==null){
//					customer=new Customer();
//				}
//				customer.setCustomername(s_name);
//				ResultSet rs=customerdao.customerList(con, null, customer);
//				ExcelUtil.fillExcelData(rs, wb, headers);
//				ResponseUtil3.export(ServletActionContext.getResponse(), wb, "锟酵伙拷锟斤拷excel.xls");
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}finally{
//				try {
//					dbUtil.closeCon(con);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
			return null;
		}


		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
}
