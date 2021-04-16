package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processReq(request, response);//get method도 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processReq(request, response);//post method도 하나로 받기 위해
	}
	protected void processReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자 요청 분석
		String type = request.getParameter("type");
		//요청 따라 결과 지정
		String value = "";
		if(type == null) {
			value = "안녕하세요";
		}else if(type.equals("first")){
			value="처음뵙겠습니다.";
		}
		//처리 결과 저장 (request, session)
		request.setAttribute("param", value);
		//뷰(View)에 포워딩 <jsp:forward page="simpleView.jsp/>을 서블릿에서는 아래처럼 작성"
		RequestDispatcher disp = request.getRequestDispatcher("/05_mvc_class/1_mvcSimple/simpleView.jsp");
		disp.forward(request, response);
	}

}
