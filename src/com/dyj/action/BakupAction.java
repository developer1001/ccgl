package com.dyj.action;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class BakupAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void  bakupdb()  {

		

		//mysqldump -hlocalhost -P3306 -uroot -proot my > C:\my.sql 
				
		//第一种手动备份方式
//		 String str = "D:\\Navicat for MySQL\\navicat.exe";
//		       try {    
//		               Runtime rt=Runtime.getRuntime();  
//		               rt.exec(" "+str);  
//		       } catch (IOException e) {    		        
//		           e.printStackTrace();    	                 
//		       } 
	   //手动备份结束
		          
	  // 第二种方式，自动备份
//		       Process process = null;
		SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		Date date = new Date();
		String time = sdf.format(date);
			try {
				 Runtime.getRuntime().exec("cmd /c C:\\mysqldump -hlocalhost "  + 
				           " -p3306 "+" -uroot " + " -proot "  + " smis > C:\\smis.sql" );
			} catch (IOException e) {
				e.printStackTrace();
			}			
//		       try {
//				InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}  		       		       		       
	  //自动备份结束	       
		
    }
	public void recoverdb(){
		//还原数据库
		/**一
		 * 1.>mysql -uroot -proot 
		 * 2.>use my;
		 * 3.>source c:my.sql;
		 * 二
		 * >mysql -uroot -proot && use my && source c:\my.sql
		 * 三
		 * >mysql -hlocalhost -uroot -proot  my < C:\my.sql
		 */
		try {
			 Runtime.getRuntime().exec("cmd /c C:\\mysql -hlocalhost "  + 
			           " -uroot " + " -proot "  + " smis < C:\\smis.sql" );
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
