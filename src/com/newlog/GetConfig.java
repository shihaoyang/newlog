package com.newlog;
import java.io.*;
//import java.util.*;
//import sun.security.krb5.Checksum;


public class GetConfig {

	 public  String GetConf( String str ) {
		try {
//			String encoding="utf-8";
//			String dirf1 = "newlog.conf"; 
//			File dirf = new File(Checksum.class.getClassLoader().getResource(dirf1).getPath());

			
			String dirf = "D:\\company\\�������\\java\\newlog\\WebContent\\WEB-INF\\classes\\newlog.conf";
			BufferedReader reader = new BufferedReader(new FileReader(dirf));
            String line = null;
            while ((line = reader.readLine()) != null) {
            	if(line.indexOf(str) != -1) {
            		String gstr = line.toString().replace(str+"=","");
                	return gstr;            
            	}
            }      
            reader.close();
		} catch (FileNotFoundException e) {
			System.out.println("�����ļ�û�ҵ�--WEB-INFO/ �²�һ��");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("�����ļ������ô���--WEB-INFO/ ���Ƿ���ڹؼ���");
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {	
		System.out.println(Class.class.getClass().getResource("/")); 
		GetConfig gc = new GetConfig();
		System.out.println(gc.GetConf("jdbc"));
		System.out.println(gc.GetConf("username"));
		System.out.println(gc.GetConf("passwd"));
		System.out.println(gc.GetConf("dir"));
	}

}

