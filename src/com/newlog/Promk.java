package com.newlog;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Promk")
public class Promk extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		String pro = request.getParameter("pro");
		String pro_test = pro+"_test";
		String mk = request.getParameter("mk");
		String ot = request.getParameter("ot");
		
		String sqlpr = "INSERT INTO project (project_name) VALUES ('"+pro+"')";
		String sqlprt = "INSERT INTO project_test (project_test_name) VALUES ('"+pro_test+"')";
		
		String sqlmko = "INSERT INTO module (module_name ,pid ,tpid)  VALUES ('"
				+mk+"' , (select project_id from project where project_name='"+pro+"') ,"
				+ " (select project_test_id from project_test where project_test_name='"+pro+"') )";

		String sqlmkt = "INSERT INTO module (module_name ,pid ,tpid)  VALUES ('"
				+mk+"' , (select project_id from project where project_name='"+pro_test+"') ,"
				+ " (select project_test_id from project_test where project_test_name='"+pro_test+"') )";

		
		String sqlmk = "INSERT INTO module (module_name ,pid ,tpid)  VALUES ('"
				+mk+"' , (select project_id from project where project_name='"+pro+"') ,"
				+ " (select project_test_id from project_test where project_test_name='"+pro_test+"') )";
		
		
		
		if ( ot.equals("ot") ) {
			try {
				DB.setsql(sqlpr);
				DB.setsql(sqlprt);
				DB.setsql(sqlmk);
			}catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("false : 执行失败 sql问题 请联系管理员");
			}
			
		}if( ot.equals("o") ) {
			try {
				DB.setsql(sqlpr);
				DB.setsql(sqlmko);
			}catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("false : 执行失败 sql问题 请联系管理员");
			}
		}if( ot.equals("t") ) {
			try {
			DB.setsql(sqlprt);
			DB.setsql(sqlmkt);
			}catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("false : 执行失败 sql问题 请联系管理员");
			}
		}
		Query.closeall();
		response.getWriter().println("seccessfull : 成功");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
