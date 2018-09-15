package com.newlog;

import java.io.*;
import java.net.ResponseCache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("/sweb")
public class Sweb extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String pro = request.getParameter("pro");
		String mk = request.getParameter("mk");
		String ip = request.getParameter("ip");
		String date = request.getParameter("date").replace("-", "");
		String lines = request.getParameter("lines");
		
		System.out.println(date);
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
