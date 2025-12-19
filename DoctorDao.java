package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.AppointmentModel;
import com.model.DoctorModel;

public class DoctorDao {

    public boolean doctorReg(DoctorModel dm) {
        System.out.println("Registering doctor…");
        
//		System.out.println(dm.dname());
//		System.out.println(dm.specialization());
//		System.out.println(pm.getMobile());

        
        String sql = "INSERT INTO doctors (dname, specialization, mobile, psw) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, dm.getDname());
            ps.setString(2, dm.getSpecialization());
            ps.setLong(3, dm.getMobile());
            ps.setString(4, dm.getPassword());
            
            
            int status = ps.executeUpdate();
            
            if(status!=0) {
            	return true;
            }else {
            	
            	return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    

    public DoctorModel doctorLog(DoctorModel dm) {
        DoctorModel dmu = new DoctorModel();
        String sql = "SELECT * FROM doctors WHERE dname = ? AND psw = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, dm.getDname());
            ps.setString(2, dm.getPassword());
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    dmu.setDoctorId(rs.getInt("doctor_id"));
                    dmu.setDname(rs.getString("dname"));
                    dmu.setSpecialization(rs.getString("specialization"));
                    dmu.setMobile(rs.getLong("mobile"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dmu;
    }
    
    
    //Getting All Doctors List
    public List<DoctorModel> getAllDoctors() {
    	
    	List<DoctorModel> doctorList = new ArrayList<>();
    			
        String sql = "SELECT * FROM doctors";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            try (ResultSet rs = ps.executeQuery()) {
            	
               while(rs.next()) {
            	   
            	   DoctorModel dmu = new DoctorModel();
                    dmu.setDoctorId(rs.getInt("doctor_id"));
                    dmu.setDname(rs.getString("dname"));
                    dmu.setSpecialization(rs.getString("specialization"));
                    dmu.setMobile(rs.getLong("mobile"));
                    
                    if(dmu!=null) {
                    	doctorList.add(dmu);
                    }
                }
               
            }
            
            return doctorList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
 // Getting doctor All appointments List
 	public List<AppointmentModel> getDoctorAppointments(int doctor_id) {
 	    AppointmentDao ad = new AppointmentDao();
 	    
 	    List<AppointmentModel> doctorAppointments = new ArrayList<>();
 	    
 	    List<AppointmentModel> allAppointments = ad.getAllAppointments();
 	    
 	    if (allAppointments != null) {
 	        for (AppointmentModel appointment : allAppointments) {
 	            if (appointment.getDoctor_id() == doctor_id) {
 	            	doctorAppointments.add(appointment);
 	            }
 	        }
 	    }
 	    
 	    return doctorAppointments;
 	}
}
