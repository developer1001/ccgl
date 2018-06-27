package com.dyj.model;

import java.util.Date;

public class BuyPlan {
	private Integer planid;
	private String plantime;
	private String plansupplier;
	private String productname;
	private double buyprice;
	private double buyccount;
	private double totalmoney;
	private double planbudget;
	public Integer getPlanid() {
		return planid;
	}
	public void setPlanid(Integer planid) {
		this.planid = planid;
	}
	public String getPlantime() {
		return plantime;
	}
	public void setPlantime(String plantime) {
		this.plantime = plantime;
	}
	public String getPlansupplier() {
		return plansupplier;
	}
	public void setPlansupplier(String plansupplier) {
		this.plansupplier = plansupplier;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(double buyprice) {
		this.buyprice = buyprice;
	}
	public double getBuyccount() {
		return buyccount;
	}
	public void setBuyccount(double buyccount) {
		this.buyccount = buyccount;
	}
	public double getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(double totalmoney) {
		this.totalmoney = totalmoney;
	}
	public double getPlanbudget() {
		return planbudget;
	}
	public void setPlanbudget(double planbudget) {
		this.planbudget = planbudget;
	}
}
