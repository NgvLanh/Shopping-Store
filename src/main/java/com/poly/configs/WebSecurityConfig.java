package com.poly.configs;

import com.poly.interceptors.AuthInterceptor;
import com.poly.interceptors.GlobalInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebSecurityConfig implements WebMvcConfigurer {
    @Autowired
    GlobalInterceptor global;

    @Autowired
    AuthInterceptor auth;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //GlobalInterceptor
        registry.addInterceptor(global)
                .addPathPatterns("/**")
                .excludePathPatterns("/assets/**");


        //AuthInterceptor
//        registry.addInterceptor(auth)
//                .addPathPatterns("/account/**", "/cart/**", "/admin/**")
//                .excludePathPatterns("/home/**");
    }
}
