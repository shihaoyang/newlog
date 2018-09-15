<!DOCTYPE html>
<%

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,
java.io.*,java.net.ResponseCache,java.lang.*,java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8" http-equiv="refresh" content="600">
    <title>show log jsp</title>
</head>
	<body bgcolor="black" onload="window.scrollTo(0,document.body.scrollHeight); " >

<%
String op = request.getParameter("op");
String pro = request.getParameter("pro");
String mk = request.getParameter("mk");
String ip = request.getParameter("ip");
String date = request.getParameter("date");
String words = request.getParameter("words");
String checklog = request.getParameter("checklog");
String number = request.getParameter("number");
String lines = request.getParameter("lines");
String hour = request.getParameter("hour");
if(hour == null ){
	hour = "";
}
//long number = Long.parseLong(request.getParameter("number"));
if(date != null){
	date = date.replace("-","");
}
//long lines = Long.parseLong(request.getParameter("lines"));
String dir;
if (pro != null ){
	 GetConfig gc = new GetConfig();
	String rdir= gc.GetConf("dir");
	dir = rdir+pro+"/"+mk+"/"+pro.replace("_test","")+"_"+mk+"_"+ip+"-"+date+hour+"."+"log";
}else {
	dir = "";
}

response.setContentType("text/html; charset=utf-8");
ReadFile rf = new ReadFile();
Long lis = Long.parseLong(lines);
//List<String> list = rf.readLastNLine(new File(dir), lis);
//out.print(list);
//List<String> list2 = rf.readFileByLines(dir);

File file = new File(dir);
//List<String> list = null;
	if( (pro == null || mk == null || date == null ||  lines == null ) || ( !file .exists() && !file .isDirectory()) ){
		out.println(
		"<font size='5'  color='red'>"+"请输入你要提交的参数然后点提交"+"</font>"+"<br>"+
		"<font size='4'  color='pink'>"+"貌似你查询的日志不存在"+"</font>"+"<br>"
		);				
	}else {
		 List<String> list = rf.readLastNLine(new File(dir), lis);
		 List<String> list2 = rf.readFileByLines(dir);
	     if (op.equals("news") && checklog.equals("part")) {
			 int index = 1;
			 for (String line : list) { 
	            out.println("<font size='4'  color='yellow'>"+index+" : "+"</font>"+
	            "<font size='3'  color='green'>"+line+"</font>"
	            +"<br>"
	            );
				index++;
	         }
	      }
		  if (op.equals("news") && checklog.equals("ALL")) {
			 int index=1;
	    	 for (String line : list2) {
		            out.println("<font size='4'  color='yellow'>"+index+" : "+"</font>"+
		            "<font size='3'  color='green'>"+line+"</font>"
		            +"<br>"
		            );
					index++;
		     }
	    	 
		 }
/*		  
	   	 if (op.equals("keyword") && words != null && checklog.equals("ALL") ) {
	    	 	for (String line : list2) {
	    	 		if( (line.indexOf(words) != -1 ) ){
		            	out.println(
		            	"<font size='3'  color='green'>"+line+"</font>"
		            	+"<br>"
		            	);
		     		}
	    	 	}
		 }
*/
	   	 if (op.equals("keyword") && words != null && checklog.equals("part")) {
	   		 	int index = 1;
	    	 	for (String line : list) {
	    	 		if( (line.indexOf(words) != -1 ) ){
	    	 		int nu = Integer.parseInt(number);
    	 			for(int i=(index - nu) ; i < index ;i++){
    	 				if( i-1 >= 0 && i-1<list.size() ){
	    	 				out.println("<font size='3'  color='grey'>"+i+" : "+"</font>"
	    			            	+"<font size='3'  color='green'>"+list.get(i-1)+"</font>"
	    			            	+"<br>"
	    			            	);
    	 				}else{
    	 					out.println("<font size='3'  color='grey'>关键字所在行之上没有: "+nu+"行 "
    	 							+"只有:"+index+"行</font>"
    	 							+"<br>");
    	 					break;
    	 				}
	    	 		}
		            out.println("<font size='5'  color='red'>"+index+" : "+"</font>"
		            	+"<font size='3'  color='green'>"+line+"</font>"
		            	+"<br>"
		            	);
    	 			for(int i=(index + 1) ; i <= index+nu ;i++){
    	 				if( i-1 >= 0 && i-1<list.size() ){
    	 					out.println("<font size='3'  color='pink'>"+i+" : "+"</font>"
    			            	+"<font size='3'  color='green'>"+list.get(i-1)+"</font>"
    			            	+"<br>"
    			            	);
    	 				}
    	 			}	
		     	}
	    	 	index++;	
	    	 }
		 }
	   	 if (op.equals("keyword") && words != null && checklog.equals("ALL")) {	 
	   		int index = 1;
			for (String line : list2) {
	    	   	if( (line.indexOf(words) != -1 ) ){
	    	 		int nu = Integer.parseInt(number);
	    	 		for(int i=(index - nu) ; i < index ;i++){
	    	 		  if( i-1 >= 0  && i-1 < list2.size()){
    	 				out.println("<font size='3'  color='grey'>"+i+" : "+"</font>"
	    			            	+"<font size='3'  color='green'>"+list2.get(i-1)+"</font>"
	    			            	+"<br>"
	    			            	);
	    	 		  }else{
  	 					out.println("<font size='3'  color='grey'>关键字所在行之上没有: "+nu+"行 "
	 							+"只有:"+index+"行</font>"
	 							+"<br>");
	 					break;
	 				  }
    	 			}		
 	 					out.println("<font size='5'  color='red'>"+index+" : "+"</font>"
		            		+"<font size='3'  color='green'>"+line+"</font>"
		            		+"<br>"
		            	); 
 	    	 		for(int i=(index + 1) ; i <= index+nu ;i++){
 	    	 			if( i-1  >= 0 && i-1 < list2.size() ){
 	    	 				out.println("<font size='3'  color='pink'>"+i+" : "+"</font>"
 	    			            +"<font size='3'  color='green'>"+list2.get(i-1)+"</font>"
 	    			            +"<br>"
 	    			            );
 	    	 			}
 	    	 		}	
	   			}
	    	   	index++;
			}
		}
	}
%>
	</body>
</html>