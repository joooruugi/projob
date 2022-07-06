package fin.spring.projob.project.vo;

import lombok.Data;

@Data
public class Project {

	private int pro_no;
	private String pro_title;
	private String pro_content;
	private int pro_period;
	private int pro_budget;
	private int pro_personnel;
	private int pro_field;
	private int pro_ok;
}
