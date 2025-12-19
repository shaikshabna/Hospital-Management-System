package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.PatientDao;
import com.model.PatientModel;

@WebServlet("/PatientReg")
public class PatientRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fullName= request.getParameter("fullName");
		String userName= request.getParameter("userName");
		String mobile= request.getParameter("mobile");
		String age= request.getParameter("age");
		String password= request.getParameter("password");
		
		int page= Integer.parseInt(age);
		long pmobile= Long.parseLong(mobile);
		
//		System.out.println(fullName);
//		System.out.println(userName);
//		System.out.println(mobile);
//		System.out.println(password);
		
		PatientModel pm=new PatientModel();
		pm.setFullName(fullName);
		pm.setUserName(userName);
		pm.setAge(page);
		pm.setMobile(pmobile);
		pm.setPassword(password);
		
		PatientDao p=new PatientDao();
		p.patientReg(pm);
		
		
	}

}
