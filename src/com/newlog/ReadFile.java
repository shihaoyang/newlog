package com.newlog;

import java.io.*;
import java.util.*;

public class ReadFile {
//    //Main�������������
//    public static void main(String[] args) {
//        //���ö�ȡ�����������ļ��Լ���ȡ����
//        List<String> list = readLastNLine(new File("e:/logs/B10/webapi.log"), 100L);
//        if (list != null) {
//            for (String str : list) {
//                System.out.println(str);
//            }
//        }
//    }

    /**
     * ��ȡ�ļ����N��
     * <p>
     * ���ݻ��з��жϵ�ǰ��������
     * ʹ��ͳ�����жϵ�ǰ��ȡ��N��
     * <p>
     * PS:�����List�ǵ�����Ҫ��List��ת���
     *
     * @param file    ���ļ�
     * @param numRead ��ȡ������
     * @return List<String>
     */
    public List<String> readLastNLine(File file, long numRead) {
        // ��������
        List<String> result = new ArrayList<String>();
        //����ͳ��
        long count = 0;

        // �ų����ɶ�״̬
        if (!file.exists() || file.isDirectory() || !file.canRead()) {
            return null;
        }

        // ʹ�������ȡ
        RandomAccessFile fileRead = null;
        try {
            //ʹ�ö�ģʽ
            fileRead = new RandomAccessFile(file, "r");
            //��ȡ�ļ�����
            long length = fileRead.length();
            //�����0�������ǿ��ļ���ֱ�ӷ��ؿս��
            if (length == 0L) {
                return result;
            } else {
                //��ʼ���α�
                long pos = length - 1;
                while (pos > 0) {
                    pos--;
                    //��ʼ��ȡ
                    fileRead.seek(pos);
                    //�����ȡ��\n�����Ƕ�ȡ��һ��
                    if (fileRead.readByte() == '\n') {
                        //ʹ��readLine��ȡ��ǰ��
                        String line = new String(fileRead.readLine().getBytes("ISO-8859-1"), "utf-8");
                        //������
                        result.add(line);

                        //��ӡ��ǰ��
                        //System.out.println(line);

                        //����ͳ�ƣ����������numReadָ����������������ѭ��
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
                    //�ر���Դ
                    fileRead.close();
                } catch (Exception e) {
                }
            }
        }
        Collections.reverse(result);
        return result;
    }
    
    /**
     * ���ܣ�Java��ȡtxt�ļ�������
     * ���裺1���Ȼ���ļ����
     * 2������ļ��������������һ���ֽ���������Ҫ��������������ж�ȡ
     * 3����ȡ������������Ҫ��ȡ�����ֽ���
     * 4��һ��һ�е������readline()��
     * ��ע����Ҫ���ǵ����쳣���
     * @param filePath
     */
    public  List<String> readAllFile(String filePath){
    	List<String> result2 = new ArrayList<String>();
        try {
                String encoding="utf-8";
                File file=new File(filePath);
                if(file.isFile() && file.exists()){ //�ж��ļ��Ƿ����
                    InputStreamReader read = new InputStreamReader(
                    new FileInputStream(file),encoding);//���ǵ������ʽ
                    BufferedReader bufferedReader = new BufferedReader(read);
                    String line = null;
                    while((line = bufferedReader.readLine()) != null){
                        result2.add(line);
                    }
                    read.close();
                }else{
                	System.out.println("�Ҳ���ָ�����ļ�");
                }
        } catch (Exception e) {
            System.out.println("��ȡ�ļ����ݳ���");
            e.printStackTrace();
        }
        return result2;
    }

    public  List<String> readFileByLines(String fileName) {
    	List<String> result3 = new ArrayList<String>();
        File file = new File(fileName);
        BufferedReader reader = null;
        try {
//            System.out.println("����Ϊ��λ��ȡ�ļ����ݣ�һ�ζ�һ���У�");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // һ�ζ���һ�У�ֱ������nullΪ�ļ�����
            while ((tempString = reader.readLine()) != null) {
                // ��ʾ�к�
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