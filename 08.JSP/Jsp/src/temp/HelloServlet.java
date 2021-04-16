package temp;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {//상속

	public HelloServlet() {//생성자

        super();//없어도 부모의 생성자 부름
    }

	protected void doGet(HttpServletRequest request,// Client -> Server
						HttpServletResponse response)// Server -> Client
						throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");//응답이니 S -> C 동작
		PrintWriter out = response.getWriter();//out을 출력하겠다
		//html 코드를 그대로 출력
		out.println("<html>");
		out.println("<head><title> 첫 서블릿 </title></head>");
		out.println("<body>");
		out.println("<h1> 웹 서버 프로그램 </h1>");
		out.println("</body>");
		out.println("</html>");
		out.close();//동작 끝
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}
