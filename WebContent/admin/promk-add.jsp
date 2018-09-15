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
//boolean admin_session = false;
//boolean pro_session = false;
%>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>添加产品模块名</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
   <div class="x-body">
        <form class="layui-form"  name="promk" method="get" action="Promk">
          <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>产品名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="pro" name="pro" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>慎重添加产品名
            </div>
        </div>
        <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>模块名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="mk" name="mk" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>慎重添加模块名
                </div>
         </div>
          <div class="layui-form-item">
              <label class="layui-form-label"><span class="x-red">*</span>角色</label>
              <div class="layui-input-block">
                  <select id="ot" name="ot">
                      <option value="ot">测试+运营</option>
                      <option value="t">测试</option>
                      <option value="o">运营</option>

                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add"  type="submit">
                  增加
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
          
        });
    </script>
  </body>

</html>