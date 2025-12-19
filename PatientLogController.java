package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.PatientDao;
import com.model.DoctorModel;
import com.model.PatientModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PatientLog")
public class PatientLogController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        PatientModel pm = new PatientModel();
        pm.setUserName(userName);
        pm.setPassword(password);

        PatientDao p = new PatientDao();
        PatientModel pmu = p.patientLog(pm);

        if (pmu != null && userName.equals(pmu.getUserName())) {
            System.out.println("Login successfully....");

            List<DoctorModel> doctorList = p.getAllDoctors();
            
//            System.out.println(doctorList);

            // store doctor list in request or session
            request.setAttribute("doctorList", doctorList);

            HttpSession session = request.getSession();
            session.setAttribute("loggedInPatient", pmu);

            // forward to home.jsp
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);

        } else {
            System.out.println("Login failed....");
            request.setAttribute("error", "Invalid username or password.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
    
}
