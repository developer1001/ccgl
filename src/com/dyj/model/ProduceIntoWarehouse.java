package com.dyj.model;

import java.util.Date;

public class ProduceIntoWarehouse {
	private int inid;
	private String prid;
	private String prname;
	private String prkind;
	private String material;
	private String specification;
	private double prcost;
	private int prquantity;
	private String manufacturer;
	private Date prdate;
	private String checher;
	private String warehouse;
	private String remarks;
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
	public double getPrcost() {
		return prcost;
	}
	public void setPrcost(double prcost) {
		this.prcost = prcost;
	}
	public int getPrquantity() {
		return prquantity;
	}
	public void setPrquantity(int prquantity) {
		this.prquantity = prquantity;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
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
	public int getInid() {
		return inid;
	}
	public void setInid(int inid) {
		this.inid = inid;
	}
}
