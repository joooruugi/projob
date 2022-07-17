package fin.spring.projob.fileshare.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FileshareFile {
	
	private String shf_no;
	private String shf_realname;
	private String shf_newname;
	private String shf_path;
	private String sh_no;

}
