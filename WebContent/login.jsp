<!DOCTYPE html>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,
java.io.*,java.net.*,java.sql.*,java.lang.*,java.util.*" pageEncoding="UTF-8"%>




<% 



String username = request.getParameter("username");
String password = request.getParameter("password");
if(username != null || password != null){
		Query qu = new Query();
		String pass =  qu.QueryUserPass(username);
			if (username.equals(username) && password.equals(pass)){
				session.setAttribute(username,password);
				String url= "index.jsp?username="+username+"&password="+password;
				response.sendRedirect(url);  
			}else {
				out.println("用户名密码");
			} 		
}

%>



<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>login页面</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./admin/css/font.css">
	<link rel="stylesheet" href="./admin/css/xadmin.css">
    <script type="text/javascript" src="./admin.js/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./admin/js/xadmin.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="get"  action="login.jsp" class="layui-form" >
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input"  autocomplete="off" required="">
 
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input" autocomplete="off" required="">
            <hr class="hr15">
            <input  value="登录"  lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

<!--  
    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交
              form.on('submit(login)', function(data){
                // alert(888)
                layer.msg(JSON.stringify(data.field),function(){
                    location.href='index.html'
                });
                return false;
              });
            });
        })

        
    </script>
-->
    
    <!-- 底部结束 -->

</body>
</html>