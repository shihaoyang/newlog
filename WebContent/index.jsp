<!DOCTYPE html>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,
java.io.*,java.net.*,java.sql.*,java.lang.*,java.util.*" pageEncoding="UTF-8"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
boolean admin_session = false;
boolean pro_session = false;
//Query qu = new Query();
//String pass =  qu.QueryUserPass(username);
String ses_pass = (String)session.getAttribute(username);
String project_name = null;
String project_test_name = null;
if (password != null && password.equals(ses_pass)){
	if(username.equals("admin")){
		admin_session = true;
	}else if(username.equals(username)){
		Query qu = new Query();
		project_name =  qu.QueryPro(username);
		project_test_name =  qu.QueryProT(username);
	}
}else {
	response.sendRedirect("login.jsp");
	return;
}
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日志查询系统V1.0.0</title>
    <style type="text/css"></style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        $(function() {
            $('#op').change(function() {
                if (this.value == "keyword") {
                    $('#words').show();
                } else {
                    $('#words').hide();
                }
            });
        });
        $(function() {
            $('#op').change(function() {
                if (this.value == "keyword") {
                    $('#number').show();
                } else {
                    $('#number').hide();
                }
            });
        });
        $(function() {
            $('#checklog').change(function() {
                if (this.value == "part") {
                    $('#lines').show();
                } else {
                    $('#lines').hide();
                }
            });
        });
        $(function() {
            $('#lines').change(function() {
                if (this.value == "0") {
                    $('#inum').show();
                } else {
                    $('#inum').hide();
                }
            });
        });
    </script>
    <script type="text/javascript">
		var req;
		
		function init() {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		
		function changeDrop2() {
			init();
			var url = "showmk.jsp?pro=" + escape(document.form1.pro.options[document.form1.pro.selectedIndex].value);
			req.open("GET", url, true);
			req.onreadystatechange = callback;
			req.send(null);
		}
		
		function changeip() {
			init();
			var url = "showip.jsp?pro=" + escape(document.form1.pro.options[document.form1.pro.selectedIndex].value) 
					+ "&mk=" + escape(document.form1.mk.options[document.form1.mk.selectedIndex].value);
			req.open("GET", url, true);
			req.onreadystatechange = callback;
			req.send(null);
		}
		
		function callback() {
			if(4 == req.readyState) {
		
				if(200 == req.status) {
					//alert(req.responseText);			
					eval(req.responseText); 
				}
			}
			
		}
	</script>
</head>
<body>   
<form name="form1" method="get" action="showlog.jsp" target="tijiao">
    <table>
        <div>
            <th>
                <h4>操作类型：</h4>
            </th>
            <th>
                <select name="op" id="op" >
                    <option value="news">最新日志查看</option>
                    <option value="keyword">关键字搜索</option>
<!--                <option value="realtime">实时搜索</option>
                    <option value="date">时间段搜索</option> 	--> 
                </select>&nbsp;
                <input  name="words" id="words"  type="text"
                 style="display:none" placeholder="请输入关键字"/>  
                <input  name="number" id="number"  type="number" min="0" max="10"
                 style="display:none" placeholder="行数"/>            
            </th>
			
			
            <th>
                <h4>产品：</h4>
            </th>
            <th>
                <select name="pro" id="pro" onchange ="changeDrop2();">
                    <option value="">请选择</option>
<%                   
List<String> plist = new ArrayList<String>();
Query q = new Query();
ResultSet rs = q.QueryProjectAll();
ResultSet rs_test = q.QueryProjectTestAll();
if (admin_session){
	while(rs.next()) {
		out.print("<option value="
		+"'"+rs.getString("project_name")
		+"'>"
		+rs.getString("project_name")+"</option>");	
	}
	while(rs_test.next()) {
		out.print("<option value="
		+"'"+rs_test.getString("project_test_name")
		+"'>"
		+rs_test.getString("project_test_name")+"</option>");	
	}
	rs.close();
	Query.closeall();
}else{
		out.print("<option value="
		+"'"+project_name+"'>"
		+project_name+"</option>");	

		out.print("<option value="
		+"'"+project_test_name+"'>"
		+project_test_name+"</option>");
		
		rs.close();
		Query.closeall();
}
%>               
                </select>
            </th>
            
                            
                <script language="JavaScript" type="text/javascript">

                </script>
 
            <th>
                <h4>模块：</h4>
	        </th>
            <th>
                <select name="mk" id="mk"   onchange ="changeip();">
                    <option value="">请选择</option>
                </select>
                &nbsp;
            </th>
   

            <th>
                <h4>后端节点：</h4>
            </th>
            <th>
                <select name="ip" id="ip">
                </select>
                &nbsp;
            </th>

            <th>
                <h4>日期选择：</h4>
            </th>
            <th>
                <input type="date" name="date" id="date" placeholder="now"/>
                <select name="hour" id="hour" >
                    <% 
                    	for (int i = 0 ; i < 10 ; i ++ ){
                    		String j = "0"+i; 
                    		out.println("<option value='"+j+"'>"+j+"</option>");
                    	}
	                	for (int i = 10 ; i < 24 ; i ++ ){
	                		out.println("<option value='"+i+"'>"+i+"</option>");
	                	}
                    
                    %>
                 </select>    
                &nbsp;
            </th>

            <th>
                <h4>显示日志方式：</h4>
            </th>
            <th>
                <select name="checklog" id="checklog" > 
                    <option value="part">部分</option>               	
                    <option value="ALL">ALL</option>                
                    &nbsp;
               
            </th>
            <th>
                <select name="lines" id="lines" style="display:on">
<!--                <option value="0">请选择</option>   -->     
                    <option value="10">最后10行</option>                
                    <option value="100">最后100行</option>
                    <option value="300">最后300行</option>
                    <option value="500">最后500行</option>
                    <option value="1000">最后1000行</option>
                    <option value="1000">最后5000行</option>
					&nbsp;
                </select>
            </th>
        </div>
        <div float="right" >
            <font size='4'  color='brown'>当前用户：<%=username%></font>
            <a href="./admin/office.jsp?username=<%=username%>&password=<%=password%>">后台</a>
            <a href="./login.jsp">退出</a>
  		</div> 
    </table>
    <table>
        <div>
            <button type="submit" value="提交">提交</button>&nbsp;
<!--           <button type="button" value="清空">清空</button>  --> 
        </div>&nbsp;
    </table>
</form>

	<div class="btn-group m-b-20" style="padding-top: 4px;"> 
		
		<button type="button" onclick="run(1);" class="btn btn-success waves-effect btn-xs">
		<i class="fa fa-fast-backward">第一页</i>
		</button> 

		<button type="button" onclick="run(1);" class="btn btn-success waves-effect btn-xs">
			<i class="fa fa-step-backward">上一页</i>
		</button> 
		
		<button type="button" onclick="run(1);" class="btn btn-white waves-effect btn-xs">1</button> 
		
		<button type="button" onclick="run(2);" class="btn btn-success waves-effect btn-xs">2</button> 
		
		<button type="button" onclick="run(3);" class="btn btn-success waves-effect btn-xs">3</button> 
		
		<button type="button" onclick="run(4);" class="btn btn-success waves-effect btn-xs">4</button> 
		
		<button type="button" onclick="run(5);" class="btn btn-success waves-effect btn-xs">5</button> 
		
		<button type="button" onclick="run(2);" class="btn btn-success waves-effect btn-xs">
			<i class="fa fa-step-forward">下一页</i>
		</button> 
		
		<button type="button" onclick="run(3532);" class="btn btn-success waves-effect btn-xs">
			<i class="fa fa-fast-forward">最后一页</i>
		</button> 
		
		<button type="button" class="btn btn-white waves-effect btn-xs" style="border-color: white !important;" disabled="disabled">Page 1 of 3532</button>
		
		<input name="pageInput" style="width:50px;margin-left: 5px;height: 20px;padding-left: 2px;" id="pageInput" value="1">
		
		<button type="button" onclick="pageInput();" class="btn btn-success waves-effect btn-xs pull-right">GO</button>
		
	</div>

<div>
    <iframe name="tijiao"
    src ="showlog.jsp?lines=100&number=0&username=<%=username%>&password=<%=password%>" 
    style="width: 100%; background-color: black; color: green; padding: 5px; height: 671px; min-height: 150px; max-height: 729px;"
    scrolling="yes">
</div>

</body>
</html>
