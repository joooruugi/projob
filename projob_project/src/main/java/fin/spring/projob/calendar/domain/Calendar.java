package fin.spring.projob.calendar.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Calendar {
//	CAL_NO              NOT NULL NUMBER         
//	PRO_NO              NOT NULL NUMBER         
//	CAL_ID              NOT NULL VARCHAR2(20)   
//	CAL_MEMBER_ID                VARCHAR2(300)  
//	CAL_TITLE           NOT NULL VARCHAR2(300)  
//	CAL_CONTENT                  VARCHAR2(1000) 
//	CAL_START                    TIMESTAMP(6)   
//	CAL_END                      TIMESTAMP(6)   
//	CAL_ALLDAY_YN       NOT NULL VARCHAR2(1)    
//	CAL_ALLDAY_START             TIMESTAMP(6)   
//	CAL_ALLDAY_END               TIMESTAMP(6)   
//	CAL_BACKGROUNDCOLOR          VARCHAR2(100)  
//	CAL_BORDERCOLOR              VARCHAR2(100)  
//	CAL_TEXTCOLOR                VARCHAR2(100)  
	
	private int cal_no;
	private int pro_no;
	private String cal_id;
	private String cal_member_id;
	private String id;
	private String groupId;
	private String start;
	private String end;
	private String title;
	private Boolean allDay;
	private String backgroundColor;
	private String borderColor;
	private String textColor;
	
	@Override
	public String toString() {
		return "Calendar [cal_no=" + cal_no + ", pro_no=" + pro_no + ", cal_id=" + cal_id + ", cal_member_id="
				+ cal_member_id + ", id=" + id + ", groupId=" + groupId + ", start=" + start + ", end=" + end
				+ ", title=" + title + ", allDay=" + allDay + ", backgroundColor=" + backgroundColor + ", borderColor="
				+ borderColor + ", textColor=" + textColor + "]";
	}

	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getCal_id() {
		return cal_id;
	}

	public void setCal_id(String cal_id) {
		this.cal_id = cal_id;
	}

	public String getCal_member_id() {
		return cal_member_id;
	}

	public void setCal_member_id(String cal_member_id) {
		this.cal_member_id = cal_member_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getAllDay() {
		return allDay;
	}

	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
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

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	
	
	

}
