<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String s1 = request.getParameter("num1");
	String s2 = request.getParameter("num2");
	String opr = request.getParameter("opr");
	
	int num1 = new Integer(s1);
	int num2 = new Integer(s2);
	
//	double result = 0;
	
//	if("+".equals(opr)){ //%2b
//		out.println(num1+num2);
//	}else if("-".equals(opr)){
//		out.println(num1-num2);
//	}else if("*".equals(opr)){//%25
//		out.println(num1*num2);
//	}else if("/".equals(opr)){//%2f
//		out.println((double)num1/(double)num2);
//	}

	if("sum".equals(opr)){
		out.println(num1+num2);
	}else if("sub".equals(opr)){
		out.println(num1-num2);
	}else if("mul".equals(opr)){
		out.println(num1*num2);
	}else if("div".equals(opr)){
		out.println((double)num1/(double)num2);
	}else if("rem".equals(opr)){
		out.println(num1%num2);
	}else if("exp".equals(opr)){
		int result = 1;
		for(int i = 1; i<=num2;i++){
			result *= num1;
		}
		out.println(result);
	}
%>