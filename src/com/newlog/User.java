package com.newlog;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/User")
public class User extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String username = request.getParameter("username");
		String pro = request.getParameter("pro");
		String pro_test = request.getParameter("pro_test");
		String pass1 = request.getParameter("pass");
		String pass2 = request.getParameter("repass");
	
		
		if( pass1.equals(pass2)) {	
			String pass = pass2;
			String csql = "select * from user where username='"+username+"'";
			String addsql = "INSERT INTO user "
					+ "(username,password,pid,tpid) VALUES "
					+ "('"+username+"',"
					+ "'"+pass+"',"
					+ "(SELECT project_id from project where project_name='"+pro+"')"
					+ ",(SELECT project_test_id from project_test where project_test_name='"+pro_test+"')"
					+ ")";
			ResultSet rs = DB.getResultSet(csql);			
			try {
				if (rs.first()) {				
					response.getWriter().println("false : 用户名重复");
				}
				else {
					System.out.println("sql : "+addsql);
					DB.setsql(addsql);
					ResultSet rs2 = DB.getResultSet(csql);
					if (rs2.first()) {
						response.getWriter().println("seccessfull : 成功");
					}else {
						response.getWriter().println("false : 执行失败 sql问题 请联系管理员");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					Query.closeall();
			}
		}else {
			response.getWriter().println("false : 可能你的输入有问题，密码不一致");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
