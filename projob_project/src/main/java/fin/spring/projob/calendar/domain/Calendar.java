package fin.spring.projob.calendar.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Calendar {
//	ID              NOT NULL NUMBER         
//	PRO_NO                   NUMBER         
//	CAL_MEMBER_ID            VARCHAR2(300)  
//	GROUPID                  NUMBER         
//	TITLE                    VARCHAR2(300)  
//	WRITER                   VARCHAR2(50)   
//	CONTENT                  VARCHAR2(1000) 
//	START1                   VARCHAR2(50)   
//	END1                     VARCHAR2(50)   
//	ALLDAY                   VARCHAR2(5)    
//	TEXTCOLOR                VARCHAR2(50)   
//	BACKGROUNDCOLOR          VARCHAR2(50)   
//	BORDERCOLOR              VARCHAR2(50) 
	
	private int id;
	private int pro_no;
	private String cal_member_id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
	private String allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	@Override
	public String toString() {
		return "Calendar [id=" + id + ", pro_no=" + pro_no + ", cal_member_id=" + cal_member_id + ", groupId=" + groupId
				+ ", title=" + title + ", writer=" + writer + ", content=" + content + ", start=" + start + ", end="
				+ end + ", allday=" + allday + ", textColor=" + textColor + ", backgroundColor=" + backgroundColor
				+ ", borderColor=" + borderColor + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getCal_member_id() {
		return cal_member_id;
	}
	public void setCal_member_id(String cal_member_id) {
		this.cal_member_id = cal_member_id;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	
	

	
	
	
	

}
