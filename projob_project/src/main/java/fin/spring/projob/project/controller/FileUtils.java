package fin.spring.projob.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import fin.spring.projob.project.vo.Project;

@Component
public class FileUtils {
	private static final String filePath = "C:\\projob_project\\resources\\project";

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("=", "");
	}

	public List<Map<String, Object>> parseInsertFileInfo(Project project, MultipartHttpServletRequest mreq)
			throws Exception {
		Iterator<String> iterator = mreq.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int pro_no = project.getPro_no();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = mreq.getFile(iterator.next());
			if (!multipartFile.isEmpty()) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("pro_no", pro_no);
				listMap.put("originName", originalFileName);
				listMap.put("changeNamepro", storedFileName);
				list.add(listMap);
				System.out.println(listMap);
			}
		}
		return list;
	}
}