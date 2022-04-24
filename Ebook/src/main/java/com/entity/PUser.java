package com.entity;

public class PUser {
	
	private int pid;
	private String pname;
	private String pno;
	private String pemail;
	private String pphone;
	private String pstate;
	private String pcity;
	private String ppin;
	private String ppass;
	
	public PUser() {
		super();
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public String getPstate() {
		return pstate;
	}
	public void setPstate(String pstate) {
		this.pstate = pstate;
	}
	public String getPcity() {
		return pcity;
	}
	public void setPcity(String pcity) {
		this.pcity = pcity;
	}
	public String getPpin() {
		return ppin;
	}
	public void setPpin(String ppin) {
		this.ppin = ppin;
	}
	public String getPpass() {
		return ppass;
	}
	public void setPpass(String ppass) {
		this.ppass = ppass;
	}
	@Override
	public String toString() {
		return "PUser [pid=" + pid + ", pname=" + pname + ", pno=" + pno + ", pemail=" + pemail + ", pphone=" + pphone
				+ ", pstate=" + pstate + ", pcity=" + pcity + ", ppin=" + ppin + ", ppass=" + ppass + "]";
	}
	
	

}
