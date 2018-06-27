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
        this.setContentPane(createPanel()); //���캯�����Զ�����Java��panel���
    }
    
    public static CategoryDataset createDataset() //������״ͼ���ݼ�
    {
        DefaultCategoryDataset dataset=new DefaultCategoryDataset();
        dataset.setValue(10,"һ����","1��");
        dataset.setValue(20,"һ����","2��");
        dataset.setValue(30,"һ����","3��");
        dataset.setValue(15,"������","4��");
        dataset.setValue(5,"������","5��");
        dataset.setValue(20,"������","6��");
        dataset.setValue(42,"������","7��");
        dataset.setValue(22,"������","8��");
        dataset.setValue(30,"������","9��");
        dataset.setValue(70,"�ļ���","10��");
        dataset.setValue(19,"�ļ���","11��");
        dataset.setValue(2,"�ļ���","12��");
        return dataset;
    }
    
    public static JFreeChart createChart(CategoryDataset dataset) //�����ݼ�����һ��ͼ��
    {
        JFreeChart chart=ChartFactory.createBarChart("hi", "�ܿ����", 
                "�ܿ����", dataset, PlotOrientation.VERTICAL, true, true, false); //����һ��JFreeChart
        chart.setTitle(new TextTitle("�ֿ�����״ͼ",new Font("����",Font.BOLD+Font.ITALIC,20)));//�����������ñ��⣬�滻��hi������
        CategoryPlot plot=(CategoryPlot)chart.getPlot();//���ͼ���м䲿�֣���plot
        CategoryAxis categoryAxis=plot.getDomainAxis();//��ú�����
        categoryAxis.setLabelFont(new Font("΢���ź�",Font.BOLD,12));//���ú���������
        return chart;
    }
    
    public static JPanel createPanel()
    {
        JFreeChart chart =createChart(createDataset());
        return new ChartPanel(chart); //��chart�������Panel�����ȥ��ChartPanel���Ѽ̳�Jpanel
    }
    
   
}