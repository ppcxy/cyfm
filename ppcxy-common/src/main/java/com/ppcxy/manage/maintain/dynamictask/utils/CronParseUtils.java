package com.ppcxy.manage.maintain.dynamictask.utils;

import com.google.common.collect.Lists;
import org.quartz.TriggerUtils;
import org.quartz.impl.triggers.CronTriggerImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by weep on 2016-7-22.
 */
public class CronParseUtils {

    public static List<String> parse(String cronExpression) {
        return parse(cronExpression, 5);
    }

    public static List<String> parse(String cronExpression, int size) {

        String[] split = cronExpression.split(" ");


        CronTriggerImpl cronTrigger = new CronTriggerImpl();

        try {
            cronTrigger.setCronExpression(cronExpression);
        } catch (ParseException e) {
            return null;
        }

        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();

        //处理计算时间段,避免单位和时间段组合产生大结果集.
        if ("*".equals(split[0])) {
            calendar.add(Calendar.SECOND, 5);
        } else if ("*".equals(split[1])) {
            calendar.add(Calendar.MINUTE, 5);
        } else if ("*".equals(split[2])) {
            calendar.add(Calendar.HOUR, 5);
        } else if ("*".equals(split[2])) {
            calendar.add(Calendar.DAY_OF_YEAR, 5);
        } else if ("*".equals(split[2])) {
            calendar.add(Calendar.YEAR, 2);
        }else{
            calendar.add(Calendar.DAY_OF_YEAR, 10);
        }


        List<Date> dates = TriggerUtils.computeFireTimesBetween(cronTrigger, null, now, calendar.getTime());//这个是重点，一行代码搞定~~
        System.out.println("共获取到:" + dates.size());

        List<String> result = Lists.newArrayList();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (int i = 0; i < dates.size(); i++) {
            if (i == size) {//这个是提示的日期个数
                break;
            }
            result.add(dateFormat.format(dates.get(i)));
        }

        return result;
    }

}
