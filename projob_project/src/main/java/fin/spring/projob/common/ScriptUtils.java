package fin.spring.projob.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

//팝업창 구현을 위한 정적클래스 
public class ScriptUtils {
	
	public static void init(HttpServletResponse response) {
		response.setContentType("text/html; charset=euc-kr");
		response.setCharacterEncoding("euc-kr");
	}
	public static void alert(HttpServletResponse response, String alertText)throws Exception{
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"');</script>");
		out.flush();
	}
	public static void alertAndMovePage(HttpServletResponse response, String alertText, String nextPage)throws Exception{
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"'); location.href ='"+nextPage+"';</script>");
		out.flush();
	}
	public static void alertAndBackPage(HttpServletResponse response, String alertText)throws Exception{
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"'); history.go(-1);</script>");
		out.flush();
	}
}
