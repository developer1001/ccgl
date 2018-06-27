package com.dyj.model;

import java.util.Date;

public class ProfitsCount {
	
	private int prid;
	private Date prmonth;
	private double prsales;
	private double prbuyspend;
	private double prrefundtobuyer;
	private double prsupplierrefund;
	private double prprofits;
	private String prremarks;
	public int getPrid() {
		return prid;
	}
	public void setPrid(int prid) {
		this.prid = prid;
	}
	public Date getPrmonth() {
		return prmonth;
	}
	public void setPrmonth(Date prmonth) {
		this.prmonth = prmonth;
	}
	public double getPrsales() {
		return prsales;
	}
	public void setPrsales(double prsales) {
		this.prsales = prsales;
	}
	public double getPrbuyspend() {
		return prbuyspend;
	}
	public void setPrbuyspend(double prbuyerspend) {
		this.prbuyspend = prbuyerspend;
	}
	public double getPrrefundtobuyer() {
		return prrefundtobuyer;
	}
	public void setPrrefundtobuyer(double prrefundtobuyer) {
		this.prrefundtobuyer = prrefundtobuyer;
	}
	public double getPrsupplierrefund() {
		return prsupplierrefund;
	}
	public void setPrsupplierrefund(double prsupplierrefund) {
		this.prsupplierrefund = prsupplierrefund;
	}
	public double getPrprofits() {
		return prprofits;
	}
	public void setPrprofits(double prprofits) {
		this.prprofits = prprofits;
	}
	public String getPrremarks() {
		return prremarks;
	}
	public void setPrremarks(String prremarks) {
		this.prremarks = prremarks;
	}
}
