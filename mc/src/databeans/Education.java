package databeans;


public class Education {
	String degree;
	String field;
	String school;
	String location;
	String daterange;
	
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree){
		this.degree=degree;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String loc){
		this.location=loc;
	}
	public String getField() {
		return field;
	}
	public void setField(String field){
		this.field=field;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school){
		this.school=school;
	}
	public void setDateRange(String daterange) {
		this.daterange = daterange;
	}
	
	public String getDateRange() {
		return daterange;
	}
		
	
	
}
