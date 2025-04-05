package com.kh.diamelo.config;

import com.kh.diamelo.interceptor.LoggingInterceptor;
import com.kh.diamelo.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoggingInterceptor())
                .addPathPatterns("/api/**")
                .excludePathPatterns("/static/**", "/error/**");

//        registry.addInterceptor(new LoginInterceptor())
//                .addPathPatterns("/","/myPage.me")
//                .excludePathPatterns("/static/**", "/error/**");

        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/css/**",
                        "/image/**",
                        "/uploadfile/**",
                        "/default.png",
                        "/loginForm.me",
                        "/login.me",
                        "/logoutSuccess.me",
                        "/signUpEnrollForm.me",
                        "/signUp.me"
                );
    }
}