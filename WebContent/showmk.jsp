<%@page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,java.io.*,java.sql.*,java.net.ResponseCache,java.lang.*,java.util.*" pageEncoding="UTF-8"%>
<%
/*
String username = request.getParameter("username");
String password = request.getParameter("password");
String ses_pass = (String)session.getAttribute(username);
if (password != null && password.equals(ses_pass)){

}else {
	response.sendRedirect("login.jsp");
	return;
}
*/
%>

<%
	StringBuffer buf = new StringBuffer();
	String pro = request.getParameter("pro");
	List<String> mlist = new ArrayList<String>();
	Query q = new Query();
	ResultSet rs ;
	if (pro.contains("test")){
//		out.print(pro);
 		rs = q.QueryModuleTestAll(pro);
	} else { 
		rs = q.QueryModuleAll(pro);	
	}
	
	while(rs.next()) {
		mlist.add(rs.getString("module_name"));
	}
	rs.close();
	Query.closeall();
	buf.append("document.form1.mk.length = " + (mlist.size()+1) + ";\n");	
	for(int i=0; i<mlist.size(); i++) {
		buf.append("document.form1.mk.options[" + (i+1) + "].value = '" + mlist.get(i) + "';\n");
		buf.append("document.form1.mk.options[" + (i+1) + "].text = '" + mlist.get(i) + "';\n");
	}	
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0); //prevents catching at proxy server
	response.getWriter().write(buf.toString());	
%>
