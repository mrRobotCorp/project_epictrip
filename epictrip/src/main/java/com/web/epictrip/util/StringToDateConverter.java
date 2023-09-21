package com.web.epictrip.util;
import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDateConverter implements Converter<String, Date> {

    private final SimpleDateFormat dateFormat;

    public StringToDateConverter(String dateFormat) {
        this.dateFormat = new SimpleDateFormat(dateFormat);
    }

    @Override
    public Date convert(String source) {
        try {
            return dateFormat.parse(source);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid date format. Please use this pattern: " + dateFormat.toPattern());
        }
    }
}

