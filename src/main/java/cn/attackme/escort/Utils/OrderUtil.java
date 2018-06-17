package cn.attackme.escort.Utils;

import org.apache.commons.lang3.RandomStringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by arthurme on 2017/7/8.
 */
public class OrderUtil {
    public static String genOrderNo(){
        Date curDate = new Date();
        String dateStr4yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss").format(curDate);
        String dateStr4SSS = new SimpleDateFormat("SSS").format(curDate);
        String random = RandomStringUtils.random(4,false,true);
        return dateStr4yyyyMMddHHmmss+random+dateStr4SSS;
    }
}
