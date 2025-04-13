package com.kh.diamelo.config;

import com.kh.diamelo.interceptor.LoggingInterceptor;
import com.kh.diamelo.interceptor.LoginAdminInterceptor;
import com.kh.diamelo.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // api 로그
        registry.addInterceptor(new LoggingInterceptor())
                .addPathPatterns("/api/**")
                .excludePathPatterns("/static/**", "/error/**");

        // 로그인 정보 Interceptor
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/css/**",
                        "/js/**",
                        "/image/**",
                        "/uploadfile/**",
                        "/default.png",
                        "/loginForm.me",
                        "/login.me",
                        "/logoutSuccess.me",
                        "/signUpEnrollForm.me",
                        "/signUp.me",
                        "/login.go",
                        "/api/**");

        registry.addInterceptor(new LoginAdminInterceptor())
                .addPathPatterns("/empAdminList.erp",
                                   "/empAdminSearch.erp",
                        "/empDetailSearch.erp",
                        "/empDetail.erp",
                        "/empAdmin.erp",
                        "/compAdmin.erp",
                        "/select.ad",
                        "/api/company/commit",
                        "/api/company/return",
                        "/delete.com"
                        );


    }

}