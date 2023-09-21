package com.web.epictrip.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@ComponentScan(basePackages = "com.web.epictrip.configuration")
public class MessageConfig implements WebMvcConfigurer{
   
   @Bean
   public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
        source.setBasename("classpath:/messages");
        source.setDefaultEncoding("UTF-8");
        source.setCacheSeconds(0);
        source.setUseCodeAsDefaultMessage(true);
        return source;      
   }
   
   
}
