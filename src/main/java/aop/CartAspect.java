package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.CartEmptyException;
import exception.LogInException;
import logic.Cart;

@Component//CartAspect를 dispatcherController가 구동될 때 객체화시킨다.
@Aspect
public class CartAspect {
	//execution(* controller.Cart*.check*(..)) : pointcut 핵심기능
	//접근제어자 상관없고, 컨트롤러 패키지 밑의 cart~ 클래스의 check~메서드, 파라미터 상관 없음.
	@Around("execution(* controller.Cart*.check*(..))")
	public Object cartCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		//joinpoint의 첫번째 아규먼트에는 해당 세션의 정보가 들어있다.
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];
		Cart cart = (Cart) session.getAttribute("CART");
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException
				("장바구니에 주문 상품이 없습니다.", "../item/list.shop");
		}else if(session.getAttribute("loginUser") == null) {
			throw new LogInException
				("로그인 한 고객만 상품 주문이 가능합니다." , "../item/list.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
}
