package fin.spring.projob.fileshare.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FIleshare {
	
	private String sh_no;
	private String pro_no;
	private String sh_id;
	private String sh_title;
	private String sh_content;
	private String sh_wdate;
	private String sh_useyn;
	private String sh_ddate;

}
