package com.newlog;
import java.sql.*;
public class DB {
	
	public static void main(String[] args) {
		GetConfig gc = new GetConfig();
		System.out.println(gc.GetConf("jdbc")+gc.GetConf("passwd")+gc.GetConf("username"));
	}
  // ��ȡ���� 
//  public static Connection Getconn (String username , String passwd , String ip ,int port ,String dataname) {
  public static Connection Getconn () {
	  Connection conn = null;
	  try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	  } catch (ClassNotFoundException e) {
        System.out.println("��������δ�ҵ��������mysql.jdbc��������������");
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

        System.out.println("ִ�����ݿ����ӹ����г����˴��󡣡���");
		e.printStackTrace();
	  }
	  return conn;
  }
  // ��ȡ���ʽ���  
  public static Statement Getstmt (Connection conn) {
	  Statement	stmt = null; 
	  try {
		stmt = conn.createStatement(); 
	  } catch (SQLException e) {
        System.out.println("ִ�л�ȡ���ʽ�������г����˴��󡣡���");
		e.printStackTrace();
	  }
	  return stmt;
  } 
  
  public static ResultSet getResultSet(String sql){
	  Statement stmt = Getstmt(Getconn());	  
	  ResultSet rs = getResultSet(stmt,sql);
	  return rs;
  }
  
  // ��ȡ��ѯ�Ľ����
  public static ResultSet getResultSet(Statement stmt,String sql){
      System.out.println(sql);
	  ResultSet rs = null;
	  try {
		 if(stmt != null) rs = stmt.executeQuery(sql);
//		 System.out.println("3 "+rs);
	  } catch (SQLException e) {
          System.out.println("ִ�в�ѯ�����г����˴��󡣡���");
          e.printStackTrace();
	  }
	  return  rs;
  }
//  ִ�о�̬sql
  public static void setsql(String sql) {
	  System.out.println(sql);
	  try {

		Getstmt(Getconn()).executeUpdate(sql);
	} catch (SQLException e) {
		System.out.println("ִ��sql�����г����˴��󡣡���");
		e.printStackTrace();
	}
  } 
  
/*Ҫִ��SQL��䣬������java.sql.Statementʵ����Statementʵ����Ϊ����3�����ͣ�   
  ��1����ִ�о�̬SQL��䡣ͨ��ͨ��Statementʵ��ʵ��
  ��2����ִ�ж�̬SQL��䡣ͨ��ͨ��PreparedStatementʵ��ʵ��
  ��3����ִ�����ݿ�洢���̡�ͨ��ͨ��CallableStatementʵ��ʵ��  
*/  
  
  
  
  
  
  // �ر�����
  public static void close(Connection conn) {
      try {
          if (conn != null) {
              conn.close();
              conn = null;
          }
      } catch (SQLException e) {
          System.out.println("ִ�йر����ݿ����ӹ����г����˴��󡣡���");
          e.printStackTrace();
      }        
  }
  
  // �رձ��ʽ���
  public static void close(Statement stmt) {
      try {
          if (stmt != null) {
              stmt.close();
              stmt = null;
          }
      } catch (SQLException e) {
          System.out.println("ִ�йرձ��ʽ�������г����˴��󡣡���");
          e.printStackTrace();
      }        
  }
  
  // �رս����
  public static void close(ResultSet rs) {
      try {
          if (rs != null) {
              rs.close();
              rs = null;
          }
      } catch (SQLException e) {
          System.out.println("ִ�йرս���������г����˴��󡣡���");
          e.printStackTrace();
      }        
  }
  
}