package aop2_annotation;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAdvice {
	
	@Around("execution(public * aop2_annotation.*.*Hello(..))")//포인트컷 지정
	public Object around(ProceedingJoinPoint point) throws Throwable{
		String methodName = point.getSignature().getName();
		System.out.println("<around> ############# " + methodName);
		Object obj = point.proceed();//작업 수행
		System.out.println("<around> @@@@@@@@@@@@@ " + methodName);
		return obj;
	}
}
