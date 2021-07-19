package com.servlet.calendar.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class Util {
    static SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");

    public static String plusDate(String date) {
        date = date.substring(8, 10);
        int end = Integer.parseInt(date);
        end++;
        String end_date = (end < 10) ? end_date = "0" + end : Integer
                .toString(end);

        return end_date;
    }

    public static String minusDate(String date) {
        date = date.substring(8, 10);
        int end = Integer.parseInt(date);
        end--;
        String end_date = (end < 10) ? end_date = "0" + end : Integer
                .toString(end);

        return end_date;
    }

    public static boolean overLastDay(String date) {

        String[] dateArr = date.split("-");
        int[] lastDateArr = new int[3];
        for (int i = 0; i < dateArr.length; i++) {
            lastDateArr[i] = Integer.parseInt(dateArr[i]);

        }

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.YEAR, lastDateArr[0]);
        calendar.add(Calendar.MONTH, (lastDateArr[1] - 1));
        int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        if (lastDateArr[2] > lastDay) {

            return true;
        }
        return false;
    }

    public static boolean FirstSecond(String start_date, String end_date) throws ParseException {

        Date FirstDate = format.parse(start_date);
        Date SecondDate = format.parse(end_date);
        long calDate = FirstDate.getTime() - SecondDate.getTime();
        if (calDate > 0) {

            return true;
        }

        return false;
    }
}

