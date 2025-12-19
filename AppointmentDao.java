package com.dao;

import com.model.AppointmentModel;
import java.sql.*;
import java.util.*;

public class AppointmentDao {

	public boolean save(AppointmentModel a) {
		int status = 0;
		String sql = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, pname, age, mobile, pdiseas) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, a.getPatient_id());
			ps.setInt(2, a.getDoctor_id());
			ps.setString(3, a.getAppointment_date());
			ps.setString(4, a.getAppointment_time());
			ps.setString(5, a.getPname());
			ps.setInt(6, a.getAge());
			ps.setLong(7, a.getMobile());
			ps.setString(8, a.getPdiseas());

			status = ps.executeUpdate();

			if (status != 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<AppointmentModel> getAllAppointments() {
		List<AppointmentModel> list = new ArrayList<>();
		String sql = "SELECT * FROM appointments";
		try (Connection conn = DBConnection.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {

			while (rs.next()) {
				AppointmentModel a = new AppointmentModel();
				a.setAppointment_id(rs.getInt("appointment_id"));;
				a.setPatient_id(rs.getInt("patient_id"));
				a.setDoctor_id(rs.getInt("doctor_id"));
				a.setAppointment_date(rs.getString("appointment_date"));
				a.setAppointment_time(rs.getString("appointment_time"));
				a.setPname(rs.getString("pname"));
				a.setAge(rs.getInt("age"));
				a.setMobile(rs.getLong("mobile"));
				a.setPdiseas(rs.getString("pdiseas"));
				a.setStatus(rs.getString("status"));

				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
