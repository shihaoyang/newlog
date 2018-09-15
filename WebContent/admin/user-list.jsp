<!DOCTYPE html>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,
java.io.*,java.net.*,java.sql.*,java.lang.*,java.util.*" pageEncoding="UTF-8"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
//Query qu = new Query();
//String pass =  qu.QueryUserPass(username);
String admin_pass = (String)session.getAttribute("admin");
String ses_pass = (String)session.getAttribute(username);
if (password != null && username != null && username.equals("admin") && password.equals(admin_pass)){
//	out.print("++++"+password);
}else {
	out.print("你的账号没权限，请联系运维");
//	response.sendRedirect("../login.jsp");
	return;
}
%>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>用户列表查询页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="./js/html5.min.js"></script>
    <script src="./js/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.html">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
      </a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" method="get" action="user-list.jsp?username=<%=username%>&password=<%=password%>" >
<!--      <form class="layui-form layui-col-md12 x-so" method="get" action="user-list.jsp?username=<%//=username%>&password=<%//=password%>">
-->       <select id="pro" name="pro" >
          	   <option value=""  >请选择所属产品</option>
               <option value="*" >ALL</option>
               <% 
//               		int in = 0;
		    		List<String> plist = new ArrayList<String>();
                	Query q = new Query();
                	ResultSet rs = q.QueryProjectAll();
       				while(rs.next()) {
        					out.print("<option value="
       							+"\""+rs.getString("project_name")
       							+"\">"
       							+rs.getString("project_name")+"</option>");	
       				}
//                	List plist = new Query().QueryProject(); 	

            		List<String> plist_test = new ArrayList<String>();
                	ResultSet rs_test = q.QueryProjectTestAll();
       				while(rs_test.next()) {
        				out.print("<option value="
       					+"\""+rs_test.getString("project_test_name")
       					+"\">"
       					+rs_test.getString("project_test_name")+"</option>");	
					}
   					rs.close();
   					Query.closeall();
//                	List plist = new Query().QueryProject(); 
                %> 
          </select>
          <button type="submit" value="提交">提交</button>
          <button class="layui-btn"  lay-submit="" lay-filter="sreach">查询 <i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./user-add.jsp?username=<%=username%>&password=<%=password%>',600,400)"><i class="layui-icon">
        	</i>添加
        </button>

      </xblock>
      <table class="layui-table"> 
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>用户名</th>
            <th>密码</th>
            <th>PID</th>
            <th>所属运营产品</th>  
            <th>TPID</th>
            <th>所属运测产品</th>  
          </tr>
        </thead>
        <tbody>
<%
String pro = request.getParameter("pro");
String pro_test = request.getParameter("pro");
List<String> ulist = new ArrayList<String>();
int in = 0;
if(pro == null ){
	
}else{ 
		if(pro.equals("*")){
    	ResultSet urs = q.QueryUserAll();
    	while(urs.next()) {
          	out.print("<tr>"
        				  +"<th>"
        				  +"	<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'><i class='layui-icon'>&#xe605;</i></div>"
        				  +"</th>"       							
        				  +"<th>"+urs.getString("username")+"</th>"
        				  +"<th>"+urs.getString("password")+"</th>"
        				  +"<th>"+urs.getString("pid")+"</th>"
        				  +"<th>"+urs.getString("project_name")+"</th>"
                		  +"<th>"+urs.getString("tpid")+"</th>"
                		  +"<th>"+urs.getString("project_test_name")+"</th>"        				  
        				  +"</tr>"
        				  ); 				
       }
		rs.close();
		Query.closeall();
		urs.last();
		in = urs.getRow();
    	out.println("<span class='x-right' style='line-height:40px'>共有数据："+in+" 条</span>" );
	}else{
		ResultSet urs = null;
		urs = q.QueryUserAll(pro);
    	while(urs.next()) {
          	out.print("<tr>"
  				  +"<th>"
  				  +"	<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'><i class='layui-icon'>&#xe605;</i></div>"
  				  +"</th>"       							
  				  +"<th>"+urs.getString("username")+"</th>"
  				  +"<th>"+urs.getString("password")+"</th>"
  				  +"<th>"+urs.getString("pid")+"</th>"
  				  +"<th>"+urs.getString("project_name")+"</th>"
          		  +"<th>"+urs.getString("tpid")+"</th>"
          		  +"<th>"+urs.getString("project_test_name")+"</th>"        				  
  				  +"</tr>"
  				  );    
        }
		urs.last();
		in = urs.getRow();
		rs.close();
		Query.closeall();
    	out.println("<span class='x-right' style='line-height:40px'>共有数据："+in+" 条</span>" );
	}
}
%>				            
          </tr>
        </tbody>
      </table>
      <div class="page">
        <div>
          <a class="prev" href="">&lt;&lt;</a>
          <span class="current">1</span>
          <a class="num" href="">2</a>
          <a class="num" href="">n-1</a>
          <a class="num" href="">n</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });


    </script>
  </body>

</html>