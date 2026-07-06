package com.lcb404.utill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lcb404.service.UserService;

public class BoardInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		//게시글 변경, 수정, 삭제에 대한 인터셉터
		//세션값과, writer정보가 같다면, 컨트롤러를 실행, 화면에 그렇지 않으면 "권한이 없습니다"를 출력 
		
		HttpSession session = request.getSession();
		String MEMBERS_ID = (String)session.getAttribute("MEMBERS_ID"); //로그인세션값
		
		String id = request.getParameter("MEMBERS_ID");
		
		if(StringUtils.isBlank(MEMBERS_ID)) {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().write("<script>");
			response.getWriter().write("alert('로그인이 필요합니다.');");
			response.getWriter().write("history.go(-1);");
			response.getWriter().write("</script>");
			return false;
		}
		
		int result = userService.getGrade(MEMBERS_ID);
		if(result ==1) {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().write("<script>");
			response.getWriter().write("alert('관리자 입니다');");
			response.getWriter().write("</script>");
			return true;
		}
		
		System.out.println(MEMBERS_ID);
		System.out.println(id);
		
		if(id != null && id.equals(MEMBERS_ID)) {
			return true; //컨트롤러를 그대로 실행
		} else {
			
			//화면에 문자열의 형태로 전달
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().write("<script>");
			response.getWriter().write("alert('권한이 없습니다');");
			response.getWriter().write("history.go(-1);");
			response.getWriter().write("</script>");
			
			return false; //컨트롤러 실행을 중단
		}

	}
}
