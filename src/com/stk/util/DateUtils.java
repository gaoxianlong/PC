package com.stk.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils
{
  public static String getFormatDateYMDHMS()
  {
    SimpleDateFormat simpleDateFormat = 
      new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return simpleDateFormat.format(new Date());
  }
}
