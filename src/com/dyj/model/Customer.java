package com.dyj.model;
//客户信息字段   
//编号、公司名、地址、邮编、联系人、联系电话、邮箱
public class Customer {
	private String customerid;
	private String customercompany;
	private String customeraddress;
	private String customerpostcode;
	private String customername;
	private String customerphone;
	private String customeremail;
	
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getCustomercompany() {
		return customercompany;
	}
	public void setCustomercompany(String customercompany) {
		this.customercompany = customercompany;
	}
	public String getCustomeraddress() {
		return customeraddress;
	}
	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}
	public String getCustomerpostcode() {
		return customerpostcode;
	}
	public void setCustomerpostcode(String customerpostcode) {
		this.customerpostcode = customerpostcode;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getCustomerphone() {
		return customerphone;
	}
	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}
	public String getCustomeremail() {
		return customeremail;
	}
	public void setCustomeremail(String customeremail) {
		this.customeremail = customeremail;
	}
}
