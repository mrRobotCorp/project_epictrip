package com.web.epictrip.configuration;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.web.epictrip.security.config.LoginInterceptor;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/templates/","classpath:/static/");
    }

    @Bean(name="jsonView")
    public MappingJackson2JsonView jsonView() {
        return new MappingJackson2JsonView();
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
    }

    // LoginInterceptor를 스프링 빈으로 등록
    @Bean
    public LoginInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }

    // addInterceptors 메서드 오버라이드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 아래의 경로 패턴에 대해 인터셉터를 적용
        registry.addInterceptor(loginInterceptor())
                .addPathPatterns("/Store_Pay/**","/message","/message/**",
                		"/Mypage_mymain","/Mypage_mymain/**",
                		"/Admin","/Community_WriteGro","/Community_WriteGro/**",
                		"/Community_WriteSch","/Community_WriteUpt/**"
                		,"/Store_Posting","/Store_Detail_InsSle/**","/Mypage_mysetting/**",
                		"/Mypage_mybill/**","/Mypage_myreview/**",
                		"/Mypage_mygroup/**","/Mypage_mycal/**","/Mypage_mywish/**");
    }
}
