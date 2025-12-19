package com.model;

public class DoctorModel {
	
    private int doctorId;
    private String dname;
    private String specialization;
    private long mobile;
    private	String Password;
    
    
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	@Override
	public String toString() {
		return "DoctorModel [doctorId=" + doctorId + ", dname=" + dname + ", specialization=" + specialization
				+ ", mobile=" + mobile + ", Password=" + Password + "]";
	}
	
	
	
}

