package com.newlog;

import java.io.*;
import java.util.*;

public class ReadFile {
//    //Main函数，程序入口
//    public static void main(String[] args) {
//        //调用读取方法，定义文件以及读取行数
//        List<String> list = readLastNLine(new File("e:/logs/B10/webapi.log"), 100L);
//        if (list != null) {
//            for (String str : list) {
//                System.out.println(str);
//            }
//        }
//    }

    /**
     * 读取文件最后N行
     * <p>
     * 根据换行符判断当前的行数，
     * 使用统计来判断当前读取第N行
     * <p>
     * PS:输出的List是倒叙，需要对List反转输出
     *
     * @param file    待文件
     * @param numRead 读取的行数
     * @return List<String>
     */
    public List<String> readLastNLine(File file, long numRead) {
        // 定义结果集
        List<String> result = new ArrayList<String>();
        //行数统计
        long count = 0;

        // 排除不可读状态
        if (!file.exists() || file.isDirectory() || !file.canRead()) {
            return null;
        }

        // 使用随机读取
        RandomAccessFile fileRead = null;
        try {
            //使用读模式
            fileRead = new RandomAccessFile(file, "r");
            //读取文件长度
            long length = fileRead.length();
            //如果是0，代表是空文件，直接返回空结果
            if (length == 0L) {
                return result;
            } else {
                //初始化游标
                long pos = length - 1;
                while (pos > 0) {
                    pos--;
                    //开始读取
                    fileRead.seek(pos);
                    //如果读取到\n代表是读取到一行
                    if (fileRead.readByte() == '\n') {
                        //使用readLine获取当前行
                        String line = new String(fileRead.readLine().getBytes("ISO-8859-1"), "utf-8");
                        //保存结果
                        result.add(line);

                        //打印当前行
                        //System.out.println(line);

                        //行数统计，如果到达了numRead指定的行数，就跳出循环
                        count++;
                        if (count == numRead) {
                            break;
                        }
                    }
                }
                if (pos == 0) {
                    fileRead.seek(0);
                    result.add(fileRead.readLine());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fileRead != null) {
                try {
                    //关闭资源
                    fileRead.close();
                } catch (Exception e) {
                }
            }
        }
        Collections.reverse(result);
        return result;
    }
    
    /**
     * 功能：Java读取txt文件的内容
     * 步骤：1：先获得文件句柄
     * 2：获得文件句柄当做是输入一个字节码流，需要对这个输入流进行读取
     * 3：读取到输入流后，需要读取生成字节流
     * 4：一行一行的输出。readline()。
     * 备注：需要考虑的是异常情况
     * @param filePath
     */
    public  List<String> readAllFile(String filePath){
    	List<String> result2 = new ArrayList<String>();
        try {
                String encoding="utf-8";
                File file=new File(filePath);
                if(file.isFile() && file.exists()){ //判断文件是否存在
                    InputStreamReader read = new InputStreamReader(
                    new FileInputStream(file),encoding);//考虑到编码格式
                    BufferedReader bufferedReader = new BufferedReader(read);
                    String line = null;
                    while((line = bufferedReader.readLine()) != null){
                        result2.add(line);
                    }
                    read.close();
                }else{
                	System.out.println("找不到指定的文件");
                }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return result2;
    }

    public  List<String> readFileByLines(String fileName) {
    	List<String> result3 = new ArrayList<String>();
        File file = new File(fileName);
        BufferedReader reader = null;
        try {
//            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
            	result3.add(tempString);
//                System.out.println("line " + line + ": " + tempString);
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        return result3;
    }


}