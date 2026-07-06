package com.lcb404.utill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//스프링 인터셉터 클래스 - HandlerInterceptorAdapter 클래스를 상속받습니다.
public class UserInterceptor extends HandlerInterceptorAdapter {
	
	//preHandle메서드는 컨트롤러 전에 요청을 가로채 실행됩니다.
	//true를 반환하면 컨트롤러를 실행, false를 반환하면 컨트롤러의 실행을 막음
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션의 userId를 얻는다.
		HttpSession session = request.getSession();
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID");
		
		if(MEMBERS_ID == null) {
			
						
			response.sendRedirect( request.getContextPath() + "/user/user_needLogin"  ); //로그인페이지로
			
			return false; //컨트롤러를 실행하지 않음
		} else {
			
			return true; //컨트롤러를 실행함
		}
		
		
	}



}
