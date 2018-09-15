package com.newlog;

import java.io.File;
import java.util.*;

public class FNC {
	public static void main(String[] args) {
//		FNC f = new FNC();
//		f.Deduplication("B10","web");
//		List<String> plist = f.Deduplication("B10","webapi");
//		for (String line : plist) {
//			System.out.println(line);
//		}
	}
	
	public List<String> Deduplication(String pro , String mk){		
		List<String> flist = new ArrayList<>();
//		String dir = "d:/logs/"+pro+"/"+mk;
		GetConfig gc = new GetConfig();
		String dir = gc.GetConf("dir")+pro+"/"+mk;
		System.out.println(dir);
		File f = new File(dir);
		File[] arrf = f.listFiles();
		for ( int i = 0 ; i < arrf.length ; i++ ) {			
			if ( arrf[i].isFile()) {
//				System.out.println("文件夹中的文件内容 ："+ arrf[i]);
				String str = arrf[i].toString();
				String subString = str.substring(str.indexOf("10."),str.indexOf("-"));
				System.out.println(subString);
				flist.add(subString);
			}else {
				System.out.println("这不是文件");
			}			
		}
	    HashSet h = new HashSet(flist);   
	    flist.clear();   
	    flist.addAll(h);   
		return flist;
	}

	
}
