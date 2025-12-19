package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.DoctorDao;
import com.model.DoctorModel;

@WebServlet("/DoctorReg")
public class DoctorRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dname = request.getParameter("dname");
		String specialization = request.getParameter("specialization");
		Long mobile = Long.parseLong(request.getParameter("mobile"));
		String password = request.getParameter("password");

		// Convert/parse numeric as needed
		// No age or mobile parse here if not required; add if needed.

		DoctorModel dm = new DoctorModel();
		dm.setDname(dname);
		dm.setSpecialization(specialization);
		dm.setMobile(mobile);
		dm.setPassword(password);

		DoctorDao dao = new DoctorDao();
		
		if(dao.doctorReg(dm)) {
			System.out.println("Doctor registration successfully");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	        rd.forward(request, response);
		}else {
			System.out.println("Doctor registration failed");
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
	        rd.forward(request, response);
		}

	}
}
