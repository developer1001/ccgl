package com.dyj.action;

import com.opensymphony.xwork2.ActionSupport;

public class ChartTAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 public static void main(String[] args)
	    {
	        JFreeChartTest2 chart=new JFreeChartTest2("仓库库存柱状图");
	        chart.pack();//以合适的大小显示
	        chart.setVisible(true);
	        chart.setLocation(400, 150);
	        
	    }
	
}
