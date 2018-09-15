<!DOCTYPE html>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.newlog.*,
java.io.*,java.net.*,java.sql.*,java.lang.*,java.util.*,java.util.Date,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
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

<%
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(now);
		
		Query q = new Query();
		String po = q.QueryCountPo();
		String pt = q.QueryCountPt();
		String mo = q.QueryCountMo();
		String mt = q.QueryCountMt();
%>




<html>
    <head>
        <meta charset="UTF-8">
        <title>新日志系统后台-欢迎页</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
    </head>
    <body>
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎管理员：
            <span class="x-red"><%=username%></span>！<%=time%></blockquote>
        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this">
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>产品数量-运营</h3>
                                                <p>
                                                    <cite><%=po%></cite>
                                                </p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>模块数量-运营</h3>
                                                <p>
                                                    <cite><%=mo%></cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>产品数量-测试</h3>
                                                <p>
                                                    <cite><%=pt%></cite>
                                                </p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>模块数量-测试</h3>
                                                <p>
                                                    <cite><%=mt%></cite></p>
                                            </a>
                                        </li>                                      
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统信息</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>新日志系统版本</th>
                            <td>v-1.0.0</td></tr>
                        <tr>
                            <th>服务器地址</th>
                            <td>http://third_log.pai9.net/newlog/</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>第三方运维小组
                                <a href="http://third.pai9.net/" class='x-a' target="_blank">访问官网</a></td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>brown</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">此版本用于日志系统管理后台切勿剽窃</blockquote>
    </div>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
    </body>
</html>