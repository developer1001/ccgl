package com.dyj.util;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
@WebServlet("/bakup")
public class BakupServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
					
	        try {
	            Runtime rt = Runtime.getRuntime();
	 
	            // 锟斤拷锟斤拷 锟斤拷锟斤拷mysql锟侥帮拷装目录锟斤拷锟斤拷锟斤拷      C:\\Program Files (x86)\\MySQL\\MySQL Server 5.0\\mysqldump -mydb -uroot -proot ccgl
	            //e:\\MySQL\\bin\\mysqldump -h localhost -uroot -p123 db_name
	            Process child = rt
	                    .exec("  C:\\Program Files (x86)\\MySQL\\MySQL Server 5.0\\mysqldump  -u root -p root ccgl");
	            // 锟斤拷锟矫碉拷锟斤拷锟斤拷锟斤拷为utf-8锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟絬tf-8
	            // 锟窖斤拷锟街达拷锟斤拷械目锟斤拷锟教拷锟斤拷锟斤拷息写锟斤拷.sql锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷吮锟斤拷锟斤拷募锟斤拷锟阶拷锟斤拷锟斤拷钥锟斤拷锟教拷锟较拷锟斤拷卸锟斤拷锟斤拷锟斤拷锟结导锟铰斤拷潭锟斤拷锟斤拷薹锟斤拷锟斤拷锟�
	            InputStream in = child.getInputStream();// 锟斤拷锟斤拷台锟斤拷锟斤拷锟斤拷锟较拷锟轿拷锟斤拷锟斤拷锟�
	 
	            InputStreamReader xx = new InputStreamReader(in, "utf-8");
	            // 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟轿猽tf-8锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟絬tf-8锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷卸锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
	 
	            String inStr;
	            StringBuffer sb = new StringBuffer("");
	            String outStr;
	            // 锟斤拷峡锟斤拷锟教拷锟斤拷锟斤拷息锟街凤拷
	            BufferedReader br = new BufferedReader(xx);
	            while ((inStr = br.readLine()) != null) {
	                sb.append(inStr + "\r\n");
	            }
	            outStr = sb.toString();
	 
	            // 要锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟矫碉拷sql目锟斤拷锟侥硷拷锟斤拷
	            FileOutputStream fout = new FileOutputStream("c:\\ccglbakup.sql");
	            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
	            writer.write(outStr);
	            writer.flush();
	            in.close();
	            xx.close();
	            br.close();
	            writer.close();
	            fout.close();
	 

	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	 
	    }
	}
	

