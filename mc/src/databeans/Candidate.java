package databeans;

import java.util.*;

public class Candidate {
	private String fname;
	private String resid;
	private String cert;
	private String links;
	private String groups;
	private String patents;
	private String publications;
	private String awards;
	private String lname;
	private String headline;
	private String skills;
	private String summary;
	private int posid;
	private ArrayList<Education> edu;
	private ArrayList<work_history> work;
	
	public ArrayList<Education> getEducation(){
		return edu;
	}
	public ArrayList<work_history> getWork(){
		return work;
	}
	public void setEducation(ArrayList<Education> ed){
		edu=ed;
	}
	public void setWork(ArrayList<work_history> wo){
		work=wo;
	}	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname){
		this.fname=fname;
	}
	public String getResID() {
		return resid;
	}
	public void setResID(String fname){
		this.resid=fname;
	}
	public String getCertification() {
		return cert;
	}
	public void setCertification(String cert){
		this.cert=cert;
	}
	public String getAwards() {
		return awards;
	}
	public void setAwards(String awar){
		this.awards=awar;
	}
	public String getLink() {
		return links;
	}
	public void setLink(String link){
		this.links=link;
	}
	public String getPublication() {
		return publications;
	}
	public void setPublication(String pub){
		this.publications=pub;
	}
	public String getPatents() {
		return patents;
	}
	public void setPatents(String pat){
		this.patents=pat;
	}
	public String getGroup() {
		return groups;
	}
	public void setGroup(String group){
		this.groups=group;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname){
		this.lname=lname;
	}
	public String getHeadLine() {
		return headline;
	}
	public void setHeadLine(String hl){
		this.headline=hl;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String sk){
		this.skills=sk;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary){
		this.summary=summary;
	}
	public int getPosId() {
		return posid;
	}
	public void setPosId(int pId) {
		this.posid = pId;
	}
	
	

}
