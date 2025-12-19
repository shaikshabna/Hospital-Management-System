package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.PatientDao;
import com.model.AppointmentModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PatientAppointmentListController")
public class PatientAppointmentListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patient_id = request.getParameter("patient_id");
        System.out.println("Patient ID: " + patient_id);

        int pid = Integer.parseInt(patient_id);

        PatientDao pd = new PatientDao();
        List<AppointmentModel> patientAppointments = pd.getPatientAppointments(pid);
        
        System.out.println(patientAppointments);

        if (patientAppointments != null && !patientAppointments.isEmpty()) {
            request.setAttribute("appointments", patientAppointments);
        } else {
            request.setAttribute("appointments", null);
        }

        // Forward to JSP
        request.getRequestDispatcher("AppointmentsList.jsp").forward(request, response);
    }
}
