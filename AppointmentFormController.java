package com.controller;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AppointmentFormController")
public class AppointmentFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String patient_id= request.getParameter("patient_id");
		String doctor_id= request.getParameter("doctor_id");
		String appointment_date= request.getParameter("appointment_date");
		String appointment_time= request.getParameter("appointment_time");
		String pname= request.getParameter("pname");
		String age= request.getParameter("age");
		String mobile= request.getParameter("mobile");
		String pdiseas= request.getParameter("pdiseas");
		
//		System.out.println(patient_id);
//		System.out.println(doctor_id);
//		System.out.println(appointment_date);
//		System.out.println(appointment_time);
//		System.out.println(pname);
//		System.out.println(age);
//		System.out.println(mobile);
//		System.out.println(pdiseas);
		
		
		//String to -> int
		int pId= Integer.parseInt(patient_id);
		int dId= Integer.parseInt(doctor_id);
		int page= Integer.parseInt(age);
		long pmobile= Long.parseLong(mobile);
		
//		//String to -> Date Format
//		DateTimeFormatter dateFormate= DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDate date=LocalDate.parse(appointment_date, dateFormate);
//		
//		//String to -> Time Format
//		DateTimeFormatter timeFormate= DateTimeFormatter.ofPattern("HH:mm");
//		LocalTime Time =LocalTime.parse(appointment_time, timeFormate);
		
		AppointmentModel am = new AppointmentModel();
		am.setPatient_id(pId);
		am.setDoctor_id(dId);
		am.setAppointment_date(appointment_date);
		am.setAppointment_time(appointment_time);
		am.setPname(pname);
		am.setAge(page);
		am.setMobile(pmobile);
		am.setPdiseas(pdiseas);
		
		AppointmentDao ad= new AppointmentDao();
		boolean result = ad.save(am);
		
		
		 if (result) {
	            // SUCCESS MESSAGE
	            request.setAttribute("msg", "Appointment Booked Successfully!");
	            request.setAttribute("pId", am);
	            request.getRequestDispatcher("appointmentSuccess.jsp").forward(request, response);
	        } else {
	            request.setAttribute("msg", "Appointment Booking Failed!");
	            request.setAttribute("pId",am);
	            request.getRequestDispatcher("appointmentSuccess.jsp").forward(request, response);
	        }

	}

}
