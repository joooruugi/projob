package fin.spring.projob.project.vo;

import lombok.Data;


public class Project {

	private int pro_no;
	private String pro_title;
	private String pro_content;
	private int pro_period;
	private int pro_budget;
	private int pro_personnel;
	private int pro_field;
	private int pro_ok;
	private String pro_img;
	private String pro_comp;
	@Override
	public String toString() {
		return "Project [pro_no=" + pro_no + ", pro_title=" + pro_title + ", pro_content=" + pro_content
				+ ", pro_period=" + pro_period + ", pro_budget=" + pro_budget + ", pro_personnel=" + pro_personnel
				+ ", pro_field=" + pro_field + ", pro_ok=" + pro_ok + ", pro_img=" + pro_img + ", pro_comp=" + pro_comp
				+ "]";
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public int getPro_period() {
		return pro_period;
	}
	public void setPro_period(int pro_period) {
		this.pro_period = pro_period;
	}
	public int getPro_budget() {
		return pro_budget;
	}
	public void setPro_budget(int pro_budget) {
		this.pro_budget = pro_budget;
	}
	public int getPro_personnel() {
		return pro_personnel;
	}
	public void setPro_personnel(int pro_personnel) {
		this.pro_personnel = pro_personnel;
	}
	public int getPro_field() {
		return pro_field;
	}
	public void setPro_field(int pro_field) {
		this.pro_field = pro_field;
	}
	public int getPro_ok() {
		return pro_ok;
	}
	public void setPro_ok(int pro_ok) {
		this.pro_ok = pro_ok;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_comp() {
		return pro_comp;
	}
	public void setPro_comp(String pro_comp) {
		this.pro_comp = pro_comp;
	}
	
}
