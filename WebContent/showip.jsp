<%@page language="java" contentType="text/html; charset=UTF-8" 
import="com.newlog.*,java.io.*,java.sql.*,java.net.ResponseCache,java.lang.*,java.util.*" 
pageEncoding="UTF-8"%>

<%
	StringBuffer buf = new StringBuffer();
	String pro = request.getParameter("pro");
	String mk = request.getParameter("mk");
	FNC fnc = new FNC();
	List<String> plist = new ArrayList<String>();
	if( pro == null || mk == null ){
		out.println("请输入模块名和产品");
	}else {
		try{
			plist = fnc.Deduplication(pro,mk);			
		}finally{
			buf.append("document.form1.ip.length = " + (plist.size()) + ";\n");			
			for(int i=0; i<plist.size(); i++) {
				buf.append("document.form1.ip.options[" + (i) + "].value = '" + plist.get(i) + "';\n");
				buf.append("document.form1.ip.options[" + (i) + "].text = '" + plist.get(i) + "';\n");
			}	
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-store"); //HTTP1.1
			response.setHeader("Pragma", "no-cache"); //HTTP1.0
			response.setDateHeader("Expires", 0); //prevents catching at proxy server
			response.getWriter().write(buf.toString());
		}	
	}
	

//	out.println( (plist.size()+1) );

%>
