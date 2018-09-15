<!doctype html>
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

}else {
	out.print("你的账号没权限，请联系运维");
//	response.sendRedirect("../login.jsp");
	return;
}
%>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新日志系统后台</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.html">新日志系统后台</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a href="../login.jsp">退出</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item to-index"><a href="http://third-log.pai9.net/newlog">前台首页</a></li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
<!--       	<li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>日志展示</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="../index.jsp?username=<%=username%>&password=<%=password%>">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>showlog</cite>
                            
                        </a>
                    </li >
                </ul>
            </li>
--> 
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>账号管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="user-list.jsp?username=<%=username%>&password=<%=password%>">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>账号列表</cite>
                            
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>产品模块操作</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="promk-list.jsp?username=<%=username%>&password=<%=password%>">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>展示产品模块</cite>
                            
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='./top.jsp?username=<%=username%>&password=<%=password%>' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">此版本用于日志系统管理后台切勿剽窃</div>
    </div>
    <!-- 底部结束 -->
</body>
</html>