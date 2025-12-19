package com.model;

public class PatientModel {
	private int patient_id;
    private	String fullName;
    private	String userName;
	private int age;
    private	String Password;
	private long Mobile;
	
	
	public int getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public long getMobile() {
		return Mobile;
	}
	public void setMobile(long mobile) {
		Mobile = mobile;
	}
	@Override
	public String toString() {
		return "PatientModel [patient_id=" + patient_id + ", fullName=" + fullName + ", userName=" + userName + ", age="
				+ age + ", Password=" + Password + ", Mobile=" + Mobile + "]";
	}
	
	
}
