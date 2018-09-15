package com.newlog;
import java.sql.*;
public class DB {
	
	public static void main(String[] args) {
		GetConfig gc = new GetConfig();
		System.out.println(gc.GetConf("jdbc")+gc.GetConf("passwd")+gc.GetConf("username"));
	}
  // 获取连接 
//  public static Connection Getconn (String username , String passwd , String ip ,int port ,String dataname) {
  public static Connection Getconn () {
	  Connection conn = null;
	  try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	  } catch (ClassNotFoundException e) {
        System.out.println("驱动程序未找到，请加入mysql.jdbc的驱动包。。。");
		e.printStackTrace();
	  } 
	  
	  try {
		  
		  GetConfig gc = new GetConfig();
		  String username = gc.GetConf("username");
		  String passwd = gc.GetConf("passwd");
		  String jdbc= gc.GetConf("jdbc");		
		  
		  System.out.println("---------"+jdbc);
		  System.out.println(username);
		  System.out.println(passwd);
		  conn = DriverManager.getConnection(jdbc,username,passwd);
//		  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false","root","123456");
	  } 
	  catch (SQLException e) {

        System.out.println("执行数据库连接过程中出现了错误。。。");
		e.printStackTrace();
	  }
	  return conn;
  }
  // 获取表达式语句  
  public static Statement Getstmt (Connection conn) {
	  Statement	stmt = null; 
	  try {
		stmt = conn.createStatement(); 
	  } catch (SQLException e) {
        System.out.println("执行获取表达式语句过程中出现了错误。。。");
		e.printStackTrace();
	  }
	  return stmt;
  } 
  
  public static ResultSet getResultSet(String sql){
	  Statement stmt = Getstmt(Getconn());	  
	  ResultSet rs = getResultSet(stmt,sql);
	  return rs;
  }
  
  // 获取查询的结果集
  public static ResultSet getResultSet(Statement stmt,String sql){
      System.out.println(sql);
	  ResultSet rs = null;
	  try {
		 if(stmt != null) rs = stmt.executeQuery(sql);
//		 System.out.println("3 "+rs);
	  } catch (SQLException e) {
          System.out.println("执行查询过程中出现了错误。。。");
          e.printStackTrace();
	  }
	  return  rs;
  }
//  执行静态sql
  public static void setsql(String sql) {
	  System.out.println(sql);
	  try {

		Getstmt(Getconn()).executeUpdate(sql);
	} catch (SQLException e) {
		System.out.println("执行sql过程中出现了错误。。。");
		e.printStackTrace();
	}
  } 
  
/*要执行SQL语句，必须获得java.sql.Statement实例，Statement实例分为以下3种类型：   
  （1）、执行静态SQL语句。通常通过Statement实例实现
  （2）、执行动态SQL语句。通常通过PreparedStatement实例实现
  （3）、执行数据库存储过程。通常通过CallableStatement实例实现  
*/  
  
  
  
  
  
  // 关闭连接
  public static void close(Connection conn) {
      try {
          if (conn != null) {
              conn.close();
              conn = null;
          }
      } catch (SQLException e) {
          System.out.println("执行关闭数据库连接过程中出现了错误。。。");
          e.printStackTrace();
      }        
  }
  
  // 关闭表达式语句
  public static void close(Statement stmt) {
      try {
          if (stmt != null) {
              stmt.close();
              stmt = null;
          }
      } catch (SQLException e) {
          System.out.println("执行关闭表达式语句过程中出现了错误。。。");
          e.printStackTrace();
      }        
  }
  
  // 关闭结果集
  public static void close(ResultSet rs) {
      try {
          if (rs != null) {
              rs.close();
              rs = null;
          }
      } catch (SQLException e) {
          System.out.println("执行关闭结果集过程中出现了错误。。。");
          e.printStackTrace();
      }        
  }
  
}