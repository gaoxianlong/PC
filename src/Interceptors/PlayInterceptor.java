package Interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PlayInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("baocuobaocuobaocuobaocuobaocuobaocuobaocuobaocuo");
		
		
		 HttpSession session = request.getSession();
		 
		 session.setAttribute("username", "us");
		String u = (String) session.getAttribute("username");  
        if(u!=null){  
            //登陆成功的用户  
            return true;  
        }else{  
           //没有登陆，转向登陆界面  
            request.getRequestDispatcher("/tes.jsp").forward(request,arg1);  
          return false;  
        }  
		
	}

}
