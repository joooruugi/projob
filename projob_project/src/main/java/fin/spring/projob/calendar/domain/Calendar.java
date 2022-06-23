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
	
	private int CAL_NO;
	private int PRO_NO;
	private String CAL_ID;
	private String CAL_MEMBER_ID;
	private String CAL_TITLE;
	private String CAL_CONTENT;
	private String CAL_START;
	private String CAL_END;
	private String CAL_ALLDAY_YN;
	private String CAL_ALLDAY_START;
	private String CAL_ALLDAY_END;
	private String CAL_BACKGROUNDCOLOR;
	private String CAL_BORDERCOLOR;
	private String CAL_TEXTCOLOR;
	
	@Override
	public String toString() {
		return "Calendar [CAL_NO=" + CAL_NO + ", PRO_NO=" + PRO_NO + ", CAL_ID=" + CAL_ID + ", CAL_MEMBER_ID="
				+ CAL_MEMBER_ID + ", CAL_TITLE=" + CAL_TITLE + ", CAL_CONTENT=" + CAL_CONTENT + ", CAL_START="
				+ CAL_START + ", CAL_END=" + CAL_END + ", CAL_ALLDAY_YN=" + CAL_ALLDAY_YN + ", CAL_ALLDAY_START="
				+ CAL_ALLDAY_START + ", CAL_ALLDAY_END=" + CAL_ALLDAY_END + ", CAL_BACKGROUNDCOLOR="
				+ CAL_BACKGROUNDCOLOR + ", CAL_BORDERCOLOR=" + CAL_BORDERCOLOR + ", CAL_TEXTCOLOR=" + CAL_TEXTCOLOR
				+ "]";
	}

	public int getCAL_NO() {
		return CAL_NO;
	}

	public void setCAL_NO(int cAL_NO) {
		CAL_NO = cAL_NO;
	}

	public int getPRO_NO() {
		return PRO_NO;
	}

	public void setPRO_NO(int pRO_NO) {
		PRO_NO = pRO_NO;
	}

	public String getCAL_ID() {
		return CAL_ID;
	}

	public void setCAL_ID(String cAL_ID) {
		CAL_ID = cAL_ID;
	}

	public String getCAL_MEMBER_ID() {
		return CAL_MEMBER_ID;
	}

	public void setCAL_MEMBER_ID(String cAL_MEMBER_ID) {
		CAL_MEMBER_ID = cAL_MEMBER_ID;
	}

	public String getCAL_TITLE() {
		return CAL_TITLE;
	}

	public void setCAL_TITLE(String cAL_TITLE) {
		CAL_TITLE = cAL_TITLE;
	}

	public String getCAL_CONTENT() {
		return CAL_CONTENT;
	}

	public void setCAL_CONTENT(String cAL_CONTENT) {
		CAL_CONTENT = cAL_CONTENT;
	}

	public String getCAL_START() {
		return CAL_START;
	}

	public void setCAL_START(String cAL_START) {
		CAL_START = cAL_START;
	}

	public String getCAL_END() {
		return CAL_END;
	}

	public void setCAL_END(String cAL_END) {
		CAL_END = cAL_END;
	}

	public String getCAL_ALLDAY_YN() {
		return CAL_ALLDAY_YN;
	}

	public void setCAL_ALLDAY_YN(String cAL_ALLDAY_YN) {
		CAL_ALLDAY_YN = cAL_ALLDAY_YN;
	}

	public String getCAL_ALLDAY_START() {
		return CAL_ALLDAY_START;
	}

	public void setCAL_ALLDAY_START(String cAL_ALLDAY_START) {
		CAL_ALLDAY_START = cAL_ALLDAY_START;
	}

	public String getCAL_ALLDAY_END() {
		return CAL_ALLDAY_END;
	}

	public void setCAL_ALLDAY_END(String cAL_ALLDAY_END) {
		CAL_ALLDAY_END = cAL_ALLDAY_END;
	}

	public String getCAL_BACKGROUNDCOLOR() {
		return CAL_BACKGROUNDCOLOR;
	}

	public void setCAL_BACKGROUNDCOLOR(String cAL_BACKGROUNDCOLOR) {
		CAL_BACKGROUNDCOLOR = cAL_BACKGROUNDCOLOR;
	}

	public String getCAL_BORDERCOLOR() {
		return CAL_BORDERCOLOR;
	}

	public void setCAL_BORDERCOLOR(String cAL_BORDERCOLOR) {
		CAL_BORDERCOLOR = cAL_BORDERCOLOR;
	}

	public String getCAL_TEXTCOLOR() {
		return CAL_TEXTCOLOR;
	}

	public void setCAL_TEXTCOLOR(String cAL_TEXTCOLOR) {
		CAL_TEXTCOLOR = cAL_TEXTCOLOR;
	}
	
	
	

}
