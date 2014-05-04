package databeans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class work_history {
	String company;
	String daterange;
	String description;
	String title;
	String start_year;
	String start_month;
	String end_month;
	String end_year;
	
	public String getCompany() {
		return company;
	}
public void setStart() throws ParseException{

	String start1[]=daterange.split(" to ");
	System.out.println(start1[0]);
String start=start1[0];
start=start.trim();
SimpleDateFormat sdf = new SimpleDateFormat("MMMM-yyyy",Locale.US);
//System.out.println(daterange+" "+start.split(" ").length+" "+start.split(" ")[0]+" "+start+" "+company);
Date date=new Date();
if(start.split(" ").length>1)
    date=sdf.parse(start.split(" ")[0]+"-"+start.split(" ")[1]); 
else
	date=sdf.parse("January"+"-"+start.split(" ")[0]); 
	
Calendar cal = Calendar.getInstance();
cal.setTime(date);
start_month = String.valueOf(cal.get(Calendar.MONTH)+1);
start_year=String.valueOf(cal.get(Calendar.YEAR));
}
public void setEnd() throws ParseException{
	String end1[]=daterange.split(" to ");
	System.out.println(end1[1]);
String end=end1[1];
end=end.trim();
	if(!end.equalsIgnoreCase("Present")){
	SimpleDateFormat sdf = new SimpleDateFormat("MMMM-yyyy",Locale.US);
	Date date=new Date();
	if(end.split(" ").length==2)
	    date=sdf.parse(end.split(" ")[0]+"-"+end.split(" ")[1]); 
	else
		date=sdf.parse("January"+"-"+end.split(" ")[0]); 

	Calendar cal = Calendar.getInstance();
	cal.setTime(date);
	end_month = String.valueOf(cal.get(Calendar.MONTH)+1);
	end_year=String.valueOf(cal.get(Calendar.YEAR));
	}
	else{
		Date d=new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		end_month = String.valueOf(cal.get(Calendar.MONTH)+1);
		end_year=String.valueOf(cal.get(Calendar.YEAR));

	}
}
public String getStartMonth(){
	return start_month;
}
public String getEndMonth(){
	return end_month;
}
public String getStartYear(){
	return start_year;
}
public String getEndYear(){
	return end_year;
}
	public void setCompany(String company) {
		this.company = company.replace(',', ' ');
	}
	public String getDateRange() {
		return daterange;
	}

	public void setDateRange(String daterange) throws ParseException {
		this.daterange = daterange;
		setStart();setEnd();
	}
	public String getDescription() {
		return description;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title.replace(',', ' ');
	}

	public void setDescription(String des) {
		this.description = des;
	}


}
