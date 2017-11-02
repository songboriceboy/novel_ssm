package com.neusoft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.neusoft.domain.UserInfo;

public class LoginInterceptor implements HandlerInterceptor{


	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession hsHttpSession = request.getSession();
		UserInfo userInfo = (UserInfo)hsHttpSession.getAttribute("userinfo");
		
		if(userInfo==null)
		{
			request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);  
			return false;
		}
		else {
			return true;
		}
		
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
