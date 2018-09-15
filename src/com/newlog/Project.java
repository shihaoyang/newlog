package com.newlog;

import java.util.ArrayList;
import java.util.List;

public class Project {

	@Override
	public String toString() {
		return "Project [project_id=" + project_id + ", project_name=" + project_name + ", modules=" + modules + "]";
	}
	private int project_id;
	private String project_name;
	List<Module> modules; 
	
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public List<Module> getModules() {
		return modules;
	}
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}


//	public String  toString() {
//		return "";
//	}
//	
}
