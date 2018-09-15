package com.newlog;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Query {
	public static void closeall () {
		DB.close(DB.Getstmt(DB.Getconn()));
		DB.close(DB.Getconn());
		System.out.println("---query--¹Ø±Õsql---");
	}
	
	public  List<Object>  QueryProject() {
		List<Object> plist = new ArrayList<>();		
		ResultSet rs = null ;
		String sql = "select project_id ,project_name  FROM project";
		
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		try {
			while (rs.next()) {
				 Project p = new Project();
				 p.setProject_id(rs.getInt("project_id"));
				 p.setProject_name(rs.getString("project_name"));
				 
				 List<Module> mlist = QueryMoudle(p.getProject_id());
				 p.setModules(mlist);
				 plist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(plist);
		return plist;
	}
	
	public ResultSet  QueryProjectAll() {	
		ResultSet rs = null ;
		String sql = "select project_name  FROM project";		
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		return rs;
	}
	
	public ResultSet  QueryProjectTestAll() {	
		ResultSet rs = null ;
		String sql = "select project_test_name  FROM project_test";		
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		
		return rs;
	}
	
	public ResultSet  QueryModuleAll(String pro) {	
		ResultSet rs = null ;
		String sql = "select module_name FROM module where pid=(select project_id from project where project_name='"+pro+"')";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		
		return rs;
	}
	
	public ResultSet  QueryModuleAllo() {	
		ResultSet rs = null ;
		String sql = "SELECT r.module_id, r.module_name ,r.project_id, r.project_name , pt.project_test_id ,pt.project_test_name\r\n" + 
				"from (\r\n" + 
				"SELECT m.module_id, m.module_name ,m.pid , m.tpid ,p.project_id, p.project_name  \r\n" + 
				"from  (SELECT module_id, module_name , pid ,tpid from module ) m \r\n" + 
				"LEFT JOIN (SELECT project_id,project_name from project) p \r\n" + 
				"on m.pid = p.project_id ) r\r\n" + 
				"LEFT JOIN (SELECT project_test_id,project_test_name from project_test) pt\r\n" + 
				"on r.tpid=pt.project_test_id"; 
		System.out.println(sql);
	    rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		
		return rs;
	}
	
	public ResultSet  QueryModuleAllo(String pro) {	
		ResultSet rs = null ;
		String sql = "SELECT r.module_id, r.module_name ,r.project_id, r.project_name , pt.project_test_id ,pt.project_test_name\r\n" + 
				"from (\r\n" + 
				"SELECT m.module_id, m.module_name ,m.pid , m.tpid ,p.project_id, p.project_name  \r\n" + 
				"from  (SELECT module_id, module_name , pid ,tpid from module ) m \r\n" + 
				"LEFT JOIN (SELECT project_id,project_name from project) p \r\n" + 
				"on m.pid = p.project_id ) r\r\n" + 
				"LEFT JOIN (SELECT project_test_id,project_test_name from project_test) pt\r\n" + 
				"on r.tpid=pt.project_test_id "+
				"where project_name='"+pro+"' or project_test_name='"+pro+"'"; 
		System.out.println(sql);
	    rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		
		return rs;
	}
	
	public ResultSet  QueryModuleTestAll(String pro) {	
		ResultSet rs = null ;
		String sql = "select module_name FROM module where tpid=(select project_test_id from project_test where project_test_name='"+pro+"')";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		
		return rs;
	}
	
	public static  List<Module> QueryMoudle(int pid ) {
		ResultSet rs = null ;
		List<Module> mlist = new ArrayList<>();
		String sql = "select * FROM module where pid =" + pid  ;	
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		try {
			while (rs.next()) {
				 Module m = new Module();
				 m.setModule_id(rs.getInt("module_id"));
				 m.setModule_name(rs.getString("module_name"));
				 m.setPid(rs.getInt("pid"));
				 mlist.add(m);
//				 System.out.println(rs.getInt("module_id")+" : "+rs.getString("module_name"));
//				 System.out.println(mlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mlist;
	}
	
	public ResultSet  QueryUserAll(String pro) {	
		ResultSet rs = null ;
		String sql = "select username,password,"
				+ "pid,(select project_name from project where project_id=pid) "
				+ "project_name  ,"
				+ "tpid ,(select project_test_name from project_test where project_test_id=tpid) "
				+ "project_test_name from user where "
				+ "pid=(select project_id from project where project_name='"+pro+"')"
				+ "or "
				+ "tpid=(select project_test_id from project_test where project_test_name='"+pro+"')";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		return rs;
	}	
	
	public ResultSet  QueryUserAll() {	
		ResultSet rs = null ;
		String sql = "select username,password,pid,(select project_name from project where project_id=pid) project_name ,tpid,(select project_test_name from project_test where project_test_id=tpid) project_test_name from user";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		return rs;
	}	
	
	public String  QueryUserPass(String username) {	
		ResultSet rs = null ;
		String sql = "SELECT PASSWORD from user where username='"+username+"'";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("password");
			}
		}catch (SQLException e) {
			e.printStackTrace();		
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}	

	
	public String  QueryPro(String username) {	
		ResultSet rs = null ;
		String sql = "SELECT project_name from project where project_id=(" + 
				"SELECT pid from user WHERE username='"+username+"')";
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("project_name");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}
	
	public String  QueryProT(String username) {	
		ResultSet rs = null ;
		String sql = "SELECT project_test_name from project_test where project_test_id=(" + 
				"SELECT tpid from user WHERE username='"+username+"')";
		System.out.println(sql);
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("project_test_name");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}

	public String  QueryCountPo() {	
		ResultSet rs = null ;
		String sql = "select count(*) count from project";
		System.out.println(sql);
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("count");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}
	
	public String  QueryCountPt() {	
		ResultSet rs = null ;
		String sql = "select count(*) count from project_test";
		System.out.println(sql);
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("count");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}
	
	public String  QueryCountMo() {	
		ResultSet rs = null ;
		String sql = "select count(*) count from module where pid!='null';";
		System.out.println(sql);
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("count");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}
	
	public String  QueryCountMt() {	
		ResultSet rs = null ;
		String sql = "select count(*) count from module where tpid!='null';";
		System.out.println(sql);
		rs = DB.getResultSet(DB.Getstmt(DB.Getconn()), sql);		
		String pass = null;
		try {
			while(rs.next()) {
				pass = rs.getString("count");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Query.closeall();
		}
		return pass;
	}
	//	public static void main(String[] args) throws SQLException {
//		Query q = new Query();
//		System.out.println(q.QueryProT("B10_admin"));
////////		QueryMoudle(12);
////		Query	q = new Query();
////		ResultSet rs = q.QueryProjectAll();
////		while(rs.next()) {
////			System.out.println(rs.getString("project_name"));
////		}
//	}
}
