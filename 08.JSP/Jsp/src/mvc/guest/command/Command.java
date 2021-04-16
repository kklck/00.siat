package mvc.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {//인터페이스는 오버라이딩 필수
	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException;
}
