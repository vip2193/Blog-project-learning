package com.convert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringConvertDate implements Converter<String, Date>{

	public Date convert(String str) {
		//将String转成Date
		String formatType = "YYYY-MM-DD HH:mm:ss";
		SimpleDateFormat format = new SimpleDateFormat(formatType);
		
		try {
			Date date = format.parse(str);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
