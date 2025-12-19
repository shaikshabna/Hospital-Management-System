package com.controller;

import java.io.IOException;
import com.dao.DoctorDao;
import com.model.DoctorModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DoctorLog")
public class DoctorLogController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dname = request.getParameter("dname");
		String password = request.getParameter("password");

		DoctorModel dm = new DoctorModel();
		dm.setDname(dname);
        dm.setPassword(password);

		DoctorDao dao = new DoctorDao();
		DoctorModel dmu = dao.doctorLog(dm);

		if (dmu != null && dname.equals(dmu.getDname())) {

            // FIXED — store in SESSION
			request.getSession().setAttribute("loggedInDoctor", dmu);

			request.getRequestDispatcher("doctorDashboard.jsp").forward(request, response);

		} else {
			System.out.println("Doctor Login failed....");
			request.setAttribute("errorMsg", "Invalid username or password!");
			request.getRequestDispatcher("doctorLog.html").forward(request, response);
		}
	}
}
