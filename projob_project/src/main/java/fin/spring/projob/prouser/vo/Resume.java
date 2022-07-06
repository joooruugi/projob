package fin.spring.projob.prouser.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Resume {

	private int re_no;
	private String us_id;
	private String re_school;
	private String re_graduate;
	private int re_type;
	private String re_homepage;
	private Timestamp re_wdate;
	private int re_openyn;
	private String re_picture;
}
