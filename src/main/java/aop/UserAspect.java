package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import exception.LogInException;
import logic.User;

@Component
@Aspect
public class UserAspect {
	//args(session,..) : session으로 시작하는 매개변수가 있다면 이 메서드를 실행해라.
	@Around("execution(* controller.User*.check*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, 
										HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LogInException("로그인 후 거래하세요.", "login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	//mypage 들어가기 전 체크.
	@Around("execution(* controller.User*.check*(..)) && args(id,session)")
	public Object userIdCheck(ProceedingJoinPoint joinPoint, String id,
										HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LogInException("로그인 후 거래하세요.", "login.shop");
		}
		if(!loginUser.getUserId().equals("admin") && !loginUser.getUserId().equals(id)) {
			throw new LogInException("본인 정보만 조회 가능합니다.", "main.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
