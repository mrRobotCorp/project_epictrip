package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

@Configuration
public class WebConfig {

    @Bean
    public Converter<String, Date> dateConverter() {
        return new StringToDateConverter("yyyy-MM-dd");
    }
}