package com.newlog;

public class Module {

	private int module_id;
	private String module_name;
	private int pid;
	
	public int getModule_id() {
		return module_id;
	}
	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}
	public String getMoudle_name() {
		return module_name;
	}
	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "Module [module_id=" + module_id + ", module_name=" + module_name + ", pid=" + pid + "]";
	}
	
}
