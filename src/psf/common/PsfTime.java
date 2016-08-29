package psf.common;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class PsfTime implements Serializable {
	
	protected int timeInSeconds = -1;
	protected int year = 0;
	protected int month = 0;
	protected int date = 0;
	protected int hour = 0;
	protected int minute = 0;
	protected int second = 0;
	protected int dayOfWeek = 0;       //星期几  周日返回0，周一返回1，以此类推
	
	public static String[] chn = {"日","一","二","三","四","五","六"};
	
	public PsfTime() {
		this((int)(System.currentTimeMillis()/1000));
	}
	
	public PsfTime(int year,int month,int date) {
		this(year,month,date,0,0,0);
	}
	
	public PsfTime(int year,int month,int date,int hour,int minute,int second) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, date, hour, minute, second);
		timeInSeconds = (int)(cal.getTimeInMillis()/1000);
		updateTime();
	}
	
	public PsfTime(int timeInSeconds) {
		this.timeInSeconds = timeInSeconds;
		updateTime();
	}
	
	public String getTimePassed() {
		int now = (int)(System.currentTimeMillis()/1000);
		int span = now-timeInSeconds;
		if(span<=60) return "刚刚";
		if(span<=3600) {
			return ""+(span/60)+"分钟前";
		}
		if(span<=86400) {
			return ""+(span/3600)+"小时前";
		}
		return toChnDateString();
	}
	
	protected void updateTime() {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis((long)timeInSeconds*1000L);
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH)+1;
		date = cal.get(Calendar.DATE);
		hour = cal.get(Calendar.HOUR_OF_DAY);
		minute = cal.get(Calendar.MINUTE);
		second = cal.get(Calendar.SECOND);
		dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)-1;
	}
	
	public int getTimeInSeconds() {
		return timeInSeconds;
	}
	
	public String getXX(int n) {
		return (n<10)?("0"+n):(""+n);
	}
	
	public String toDate8() {
		return ""+getYear()+""+getXX(getMonth())+""+getXX(getDate());
	}
	
	public String toChnDateString() {
		return ""+getYear()+"-"+getXX(getMonth())+"-"+getXX(getDate())+
			" "+getXX(getHour())+":"+getXX(getMinute());
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDate() {
		return date;
	}

	public int getHour() {
		return hour;
	}

	public int getMinute() {
		return minute;
	}

	public int getSecond() {
		return second;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setTimeInSeconds(int timeInSeconds) {
		this.timeInSeconds = timeInSeconds;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	public void setSecond(int second) {
		this.second = second;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	
	public static boolean isLeapYear(int year) {
		return (year%400==0) || (year%100!=0 && year%4==0);
	}

	public static int getDaysByMonth(int year,int month) {
		int [] days = new int[]{31,28,31,30,31,30,31,31,30,31,30,31};
		if(month==2 && isLeapYear(year)) {
			return 29;
		} else {
			return days[month-1];
		}
	}
	
	public static String getGMTString(Date d) throws Exception {
		Locale aLocale = Locale.US; 
		DateFormat fmt = new SimpleDateFormat("EEE, dd MMM yyyy hh:mm:ss z", new DateFormatSymbols(aLocale)); 
		fmt.setTimeZone(TimeZone.getTimeZone("GMT"));
		return fmt.format(d);
	}
	
}
