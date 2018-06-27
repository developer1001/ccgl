package com.dyj.model;

public class Log {
	private Integer logid;
	private String loguser;
    private String logtime;
	private Integer logtype;	
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public Integer getLogid() {
		return logid;
	}
	public void setLogid(Integer logid) {
		this.logid = logid;
	}
	public String getLoguser() {
		return loguser;
	}
	public void setLoguser(String loguser) {
		this.loguser = loguser;
	}

	public Integer getLogtype() {
		return logtype;
	}
	public void setLogtype(Integer logtype) {
		this.logtype = logtype;
	}


}
