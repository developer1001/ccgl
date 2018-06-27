package com.dyj.action;
import com.dyj.dao.JfreeChartDao;
import com.dyj.util.DbUtil;
import com.opensymphony.xwork2.ActionSupport;

import java.awt.Color;  
import java.awt.Font;  
import java.sql.Connection;
import java.util.Random;    

import org.jfree.chart.ChartFactory;  
import org.jfree.chart.JFreeChart;  
import org.jfree.chart.axis.AxisLocation;  
import org.jfree.chart.labels.ItemLabelAnchor;  
import org.jfree.chart.labels.ItemLabelPosition;  
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;  
import org.jfree.chart.plot.CategoryPlot;  
import org.jfree.chart.plot.PlotOrientation;  
import org.jfree.chart.renderer.category.BarRenderer3D;  
import org.jfree.data.category.CategoryDataset;  
import org.jfree.data.category.DefaultCategoryDataset;  
import org.jfree.data.general.DatasetUtilities;  
import org.jfree.data.general.DefaultPieDataset;  
import org.jfree.data.general.PieDataset;  
import org.jfree.ui.TextAnchor;  
public class ShowChartAction extends ActionSupport {

	/**
	 * 
	 */
	 private static final long serialVersionUID = 1L;	
	 private JFreeChart chart; 
	 private JFreeChart chart1;
	 private JFreeChart chart2;
     
	    public String execute(){  	  	          
	        return SUCCESS;  
	    }  
	  
	    public JFreeChart getChart() {  
	      /*  //创建主题样式    
	           StandardChartTheme standardChartTheme=new StandardChartTheme("CN");    
	           //设置标题字体    
	           standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));    
	           //设置图例的字体    
	           standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,12));    
	           //设置轴向的字体    
	           standardChartTheme.setLargeFont(new Font("宋书",Font.ITALIC,8));    
	           //应用主题样式    
	           ChartFactory.setChartTheme(standardChartTheme);  */
	             
	      /*  chart1 = ChartFactory.createPieChart3D("图书销量统计图",  
	                getDateSetpie(),true,false, false);  */
	          
	      /*  chart2 = ChartFactory.createBarChart("柱状图", "图书种类", "销售量", getDataSet(),  PlotOrientation.VERTICAL,  true, false, false);  */
	    

	        chart = ChartFactory.createBarChart3D("库存盘点分析柱状图", "","库存",getDataSet2(), PlotOrientation.VERTICAL,true,false,false); 
	        
	        CategoryPlot plot = chart.getCategoryPlot();  
	        //设置网格背景颜色  
	        plot.setBackgroundPaint(Color.white);  
	        //设置网格竖线颜色  
	        plot.setDomainGridlinePaint(Color.pink);  
	        //设置网格横线颜色  
	        plot.setRangeGridlinePaint(Color.pink);  
	        //显示每个柱的数值，并修改该数值的字体属性  
	  
	        BarRenderer3D renderer = new BarRenderer3D();  
	        renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());  
	        renderer.setBaseItemLabelsVisible(true);  
	        //默认的数字显示在柱子中，通过如下两句可调整数字的显示  
	        //注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题  
	        renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));  
	        renderer.setItemLabelAnchorOffset(10D);  
	        //设置每个地区所包含的平行柱的之间距离  
	        //renderer.setItemMargin(0.3);  
	        plot.setRenderer(renderer);  
	        //设置地区、销量的显示位置  
	        //将下方的“肉类”放到上方  
	        plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);  
	        //将默认放在左边的“销量”放到右方  
	        //plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);  
	          
	          
	        return chart;  
	    }  
 
	  
	    private CategoryDataset getDataSet2(){ 
	    	DbUtil dbUtil=new DbUtil();
	    	JfreeChartDao jfreechartdao = new JfreeChartDao();
	    	Connection con=null;
	    	double[][] detail = null;
	    	try {
				con=dbUtil.getCon();
				 detail = jfreechartdao.detailCount(con);
			} catch (Exception e) {				
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
//	        double[][] data = new double[][] {{1110},  
//	                {720},  
//	                {1030},  
//	                {930},
//	                {1000},
//	                {30},
//	                {30},
//	                {30},}; 
	    	double[][] data = detail;
	        String[] rowKeys = {"报溢总量(百件)", "报损总量(百件)","入库总量(千件)","出库总量(千件)","库存总量(千件)","报溢产品(种)","报损产品(种)","负库存产品(种)"};  
	        String[] columnKeys = {""};  
	        CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);  
	        return dataset;  
	    }  
	      
	  
	    private CategoryDataset getDataSet() {  
	        Random r =new Random();  
	        DefaultCategoryDataset data =new DefaultCategoryDataset() ;  
	        data.setValue(r.nextInt(200), "小说", "小说");  
	        data.setValue(r.nextInt(200), "新闻", "新闻");  
	        data.setValue(r.nextInt(200), "报纸", "报纸");  
	        data.setValue(r.nextInt(200), "教材", "教材");  
	        data.setValue(r.nextInt(200), "期刊", "期刊");  
	        data.setValue(r.nextInt(200), "宣传册", "宣传册");  
	          
	        return data;  
	    }  
	  
	    private PieDataset getDateSetpie() {  
	        DefaultPieDataset data = new DefaultPieDataset();  
	        data.setValue("科技图书",1000);  
	        data.setValue("社会哲学图书",300);  
	        data.setValue("大众生活图书",700);  
	        data.setValue("小说类图书",1700);  
	        return data;  
	    }

		public JFreeChart getChart1() {
			chart1 = ChartFactory.createPieChart3D("图书销量统计图",  
	                getDateSetpie(),true,false, false);  
			
			return chart1;
		}

		/*public void setChart1(JFreeChart chart1) {
			this.chart1 = chart1;
		}*/

		public JFreeChart getChart2() {
			 chart2 = ChartFactory.createBarChart("柱状图", "图书种类", "销售量", getDataSet(),  PlotOrientation.VERTICAL,  true, false, false); 
			return chart2;
		}

		/*public void setChart2(JFreeChart chart2) {
			this.chart2 = chart2;
		}  */
}
