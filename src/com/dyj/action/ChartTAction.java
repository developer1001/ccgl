package com.dyj.action;

import com.opensymphony.xwork2.ActionSupport;

public class ChartTAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 public static void main(String[] args)
	    {
	        JFreeChartTest2 chart=new JFreeChartTest2("�ֿ�����״ͼ");
	        chart.pack();//�Ժ��ʵĴ�С��ʾ
	        chart.setVisible(true);
	        chart.setLocation(400, 150);
	        
	    }
	
}
