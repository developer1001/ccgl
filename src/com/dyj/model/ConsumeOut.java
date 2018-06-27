package com.dyj.model;

import java.util.Date;

public class ConsumeOut {
	
	private int inid;
	private String prid;
	private String prname;
	private String prkind;
	private String material;
	private String specification;
	private int prquantity;
	private Date prdate;
	private String checher;
	private String warehouse;
	private String remarks;
	
	public int getInid() {
		return inid;
	}
	public void setInid(int inid) {
		this.inid = inid;
	}
	public String getPrid() {
		return prid;
	}
	public void setPrid(String prid) {
		this.prid = prid;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getPrkind() {
		return prkind;
	}
	public void setPrkind(String prkind) {
		this.prkind = prkind;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public int getPrquantity() {
		return prquantity;
	}
	public void setPrquantity(int prquantity) {
		this.prquantity = prquantity;
	}
	public Date getPrdate() {
		return prdate;
	}
	public void setPrdate(Date prdate) {
		this.prdate = prdate;
	}
	public String getChecher() {
		return checher;
	}
	public void setChecher(String checher) {
		this.checher = checher;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
