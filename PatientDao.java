package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.AppointmentModel;
import com.model.DoctorModel;
import com.model.PatientModel;

public class PatientDao {

	public void patientReg(PatientModel pm) {

		System.out.println("Pd");

//		System.out.println(pm.getFullName());
//		System.out.println(pm.getUserName());
//		System.out.println(pm.getAge());
//		System.out.println(pm.getMobile());
//		System.out.println(pm.getPassword());

		int status = 0;
		String sql = "INSERT INTO patients (fullname, username, age, mobile, psw ) VALUES (?, ?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection();

				PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, pm.getFullName());
			ps.setString(2, pm.getUserName());
			ps.setInt(3, pm.getAge());
			ps.setLong(4, pm.getMobile());
			ps.setString(5, pm.getPassword());

			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(status);

	}

	public PatientModel patientLog(PatientModel pm) {
//	    System.out.println(pm.getUserName());
//	    System.out.println(pm.getPassword());

		PatientModel pmu = new PatientModel();

		String sql = "SELECT * FROM patients WHERE username = ? AND psw = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, pm.getUserName());
			ps.setString(2, pm.getPassword());

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {

					pmu.setPatient_id(rs.getInt("patient_id"));
					pmu.setFullName(rs.getString("fullname"));
					pmu.setUserName(rs.getString("username"));
					pmu.setAge(rs.getInt("age"));
					pmu.setMobile(rs.getLong("mobile"));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pmu;
	}

	// Getting Patients List
	public PatientModel getAllPatient(PatientModel pm) {
//	    System.out.println(pm.Dname());
//	    System.out.println(pm.getPassword());

		PatientModel pmu = new PatientModel();

		String sql = "SELECT * FROM patients WHERE username = ? AND psw = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, pm.getUserName());
			ps.setString(2, pm.getPassword());

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {

					pmu.setPatient_id(rs.getInt("patient_id"));
					pmu.setFullName(rs.getString("fullname"));
					pmu.setUserName(rs.getString("username"));
					pmu.setAge(rs.getInt("age"));
					pmu.setMobile(rs.getLong("mobile"));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pmu;
	}

	// Getting All Doctors List
	public List<DoctorModel> getAllDoctors() {
		DoctorDao d = new DoctorDao();
		List<DoctorModel> doctorList = d.getAllDoctors();

		if (doctorList != null) {
			return doctorList;
		}

		return null;
	}

	// Getting patient All appointments List
	public List<AppointmentModel> getPatientAppointments(int patient_id) {
	    AppointmentDao ad = new AppointmentDao();
	    
	    List<AppointmentModel> patientAppointments = new ArrayList<>();
	    
	    List<AppointmentModel> allAppointments = ad.getAllAppointments();
	    
	    if (allAppointments != null) {
	        for (AppointmentModel appointment : allAppointments) {
	            if (appointment.getPatient_id() == patient_id) {
	                patientAppointments.add(appointment);
	            }
	        }
	    }
	    
	    return patientAppointments;
	}


}
