package com.kh.diamelo.interceptor;

import com.kh.diamelo.domain.vo.UserInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginAdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        HttpSession session = request.getSession();
        UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
        String userId = loginUser.getUserId();

        String seletTitle = (String)session.getAttribute("seletTitle");

        if("admin".equals(userId)) {
            return true;
        }else{
            session.setAttribute("alertMsg", "최고관리자만 이용 가능한 서비스입니다.");
            if(seletTitle.equals("인사 관리") ){
                response.sendRedirect("/empList.erp");
            }else if(seletTitle.equals("거래 관리")){
                response.sendRedirect("/company.erp");
            }

            return false;
        }

    }

}
