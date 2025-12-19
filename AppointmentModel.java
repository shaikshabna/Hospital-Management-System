package com.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class AppointmentModel {
	private int appointment_id;
	private int patient_id;
	private int doctor_id;
//	    private LocalDate appointment_date;
//	    private LocalTime appointment_time;
	private String appointment_date;
	private String appointment_time;
	private String pname;
	private int age;
	private long mobile;
	private String pdiseas;
	private String status;

	public int getAppointment_id() {
		return appointment_id;
	}

	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}

	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
//		public LocalDate getAppointment_date() {
//			return appointment_date;
//		}
//		public void setAppointment_date(LocalDate date) {
//			this.appointment_date = date;
//		}
//		public LocalTime getAppointment_time() {
//			return appointment_time;
//		}
//		public void setAppointment_time(LocalTime time) {
//			this.appointment_time = time;

	public String getAppointment_date() {
		return appointment_date;
	}

	public void setAppointment_date(String date) {
		this.appointment_date = date;
	}

	public String getAppointment_time() {
		return appointment_time;
	}

	public void setAppointment_time(String time) {
		this.appointment_time = time;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getPdiseas() {
		return pdiseas;
	}

	public void setPdiseas(String pdiseas) {
		this.pdiseas = pdiseas;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AppointmentModel [appointment_id=" + appointment_id + ", patient_id=" + patient_id + ", doctor_id="
				+ doctor_id + ", appointment_date=" + appointment_date + ", appointment_time=" + appointment_time
				+ ", pname=" + pname + ", age=" + age + ", mobile=" + mobile + ", pdiseas=" + pdiseas + ", status="
				+ status + "]";
	}

}
