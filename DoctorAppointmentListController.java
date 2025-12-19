package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.DoctorDao;
import com.model.AppointmentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/DoctorAppointmentListController")
public class DoctorAppointmentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String doctor_id = request.getParameter("doctor_id");
	        System.out.println("Doctor ID: " + doctor_id);

	        int did = Integer.parseInt(doctor_id);
	        
	        DoctorDao dao=new DoctorDao();
		
List<AppointmentModel> doctorAppointments = dao.getDoctorAppointments(did);
		
		if(doctorAppointments != null && !doctorAppointments.isEmpty()) {
            request.setAttribute("appointments", doctorAppointments);
            RequestDispatcher rd = request.getRequestDispatcher("AppointmentsList.jsp");
	        rd.forward(request, response);
        } else {
            request.setAttribute("appointments", null);System.out.println("Docter Login failed....");
			RequestDispatcher rd = request.getRequestDispatcher("doctorDashboard.jsp");
	        rd.forward(request, response);
        }

		
	}

}
