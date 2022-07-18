package fin.spring.projob.calendar.domain;

import org.springframework.stereotype.Component;

@Component
public class Color_sample {

//	COLOR_NO   NOT NULL NUMBER       
//	COLOR_NAME          VARCHAR2(15) 
//	COLOR_CODE          VARCHAR2(10) 
	private int color_no;
	private String color_name;
	private String color_code;
	@Override
	public String toString() {
		return "Color_sample [color_no=" + color_no + ", color_name=" + color_name + ", color_code=" + color_code + "]";
	}
	public int getColor_no() {
		return color_no;
	}
	public void setColor_no(int color_no) {
		this.color_no = color_no;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	
}
