package com.dyj.model;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class MoneyCheck {

	
	
	private int mcid;
	private Date mctime;
	private String mcname;
	private String mcproduct;
	private double mcshould;
	private double mcalready;
	private double mcdebt;
	public int getMcid() {
		return mcid;
	}
	public void setMcid(int mcid) {
		this.mcid = mcid;
	}
	public Date getMctime() {
		return mctime;
	}
	public void setMctime(Date mctime) {
		this.mctime = mctime;
	}
	public String getMcname() {
		return mcname;
	}
	public void setMcname(String mcname) {
		this.mcname = mcname;
	}
	public String getMcproduct() {
		return mcproduct;
	}
	public void setMcproduct(String mcproduct) {
		this.mcproduct = mcproduct;
	}
	public double getMcshould() {
		return mcshould;
	}
	public void setMcshould(double mcshould) {
		this.mcshould = mcshould;
	}
	public double getMcalready() {
		return mcalready;
	}
	public void setMcalready(double mcalready) {
		this.mcalready = mcalready;
	}
	public double getMcdebt() {
		return mcdebt;
	}
	public void setMcdebt(double mcdebt) {
		this.mcdebt = mcdebt;
	}
	
}
