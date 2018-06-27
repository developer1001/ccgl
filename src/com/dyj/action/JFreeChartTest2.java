package com.dyj.action;

import java.awt.Font;
import javax.swing.JPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ApplicationFrame;

public class JFreeChartTest2 extends ApplicationFrame
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JFreeChartTest2(String title)
    {
        super(title);
        this.setContentPane(createPanel()); //构造函数中自动创建Java的panel面板
    }
    
    public static CategoryDataset createDataset() //创建柱状图数据集
    {
        DefaultCategoryDataset dataset=new DefaultCategoryDataset();
        dataset.setValue(10,"一季度","1月");
        dataset.setValue(20,"一季度","2月");
        dataset.setValue(30,"一季度","3月");
        dataset.setValue(15,"二季度","4月");
        dataset.setValue(5,"二季度","5月");
        dataset.setValue(20,"二季度","6月");
        dataset.setValue(42,"三季度","7月");
        dataset.setValue(22,"三季度","8月");
        dataset.setValue(30,"三季度","9月");
        dataset.setValue(70,"四季度","10月");
        dataset.setValue(19,"四季度","11月");
        dataset.setValue(2,"四季度","12月");
        return dataset;
    }
    
    public static JFreeChart createChart(CategoryDataset dataset) //用数据集创建一个图表
    {
        JFreeChart chart=ChartFactory.createBarChart("hi", "总库存量", 
                "总库存量", dataset, PlotOrientation.VERTICAL, true, true, false); //创建一个JFreeChart
        chart.setTitle(new TextTitle("仓库库存柱状图",new Font("宋体",Font.BOLD+Font.ITALIC,20)));//可以重新设置标题，替换“hi”标题
        CategoryPlot plot=(CategoryPlot)chart.getPlot();//获得图标中间部分，即plot
        CategoryAxis categoryAxis=plot.getDomainAxis();//获得横坐标
        categoryAxis.setLabelFont(new Font("微软雅黑",Font.BOLD,12));//设置横坐标字体
        return chart;
    }
    
    public static JPanel createPanel()
    {
        JFreeChart chart =createChart(createDataset());
        return new ChartPanel(chart); //将chart对象放入Panel面板中去，ChartPanel类已继承Jpanel
    }
    
   
}