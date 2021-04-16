package aop1_xml;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;


public class LoggingAdvice {
	public void before(JoinPoint point) throws Throwable{
		String methodName = point.getSignature().getName();
		System.out.println("[**********before] : " + methodName);
	}
	
	
	public Object around(ProceedingJoinPoint point) throws Throwable{
		String methodName = point.getSignature().getName();
		System.out.println("<around> ############# " + methodName);
		Object obj = point.proceed();//작업 수행
		System.out.println("<around> @@@@@@@@@@@@@ " + methodName);
		return obj;
	}
	//after 함수 만들어봐~
	public void after(JoinPoint point) throws Throwable{
		String methodName = point.getSignature().getName();
		System.out.println("[**********after] : " + methodName);		
	}
}
