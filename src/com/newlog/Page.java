package com.newlog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class Page {
	private Integer currentPage;//��ǰҳ
    private int pageSize;//ÿҳ��ʾ��¼����
    private int totalPage;//��ҳ��
    private List<String> dataList;//ÿҳ��ʾ������
    private int star;//��ʼ����
    
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<String> getDataList() {
		return dataList;
	}
	public void setDataList(List<String> dataList) {
		this.dataList = dataList;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}



	public String fen(Page page,HttpServletRequest request){

		try {
		    //��ѯ����list����
//		    List<Data> showdata=loginService.selectyichall();	
		    
		    //�տ�ʼ��ҳ��Ϊ��һҳ
		    if (page.getCurrentPage() == null){
		        page.setCurrentPage(1);
		    } else {
		        page.setCurrentPage(page.getCurrentPage());
		    }
		    //����ÿҳ����Ϊʮ��
		    page.setPageSize(10);
		    //ÿҳ�Ŀ�ʼ��
		    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
		    //list�Ĵ�С
//		    int count = showdata.size();
		    //������ҳ��
//		    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
		    //��list���н�ȡ
//		    page.setDataList(showdata.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
		    //����������
		    request.setAttribute("paging", page);               
		    return "add/show.jsp";
		
		} catch (Exception e) {
		    // TODO Auto-generated catch block      
		    e.printStackTrace();
		    return "mistake.jsp";
		}

	}
}
