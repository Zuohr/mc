package model;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import databeans.Candidate;
import databeans.Education;
import databeans.work_history;

public class CandidateDAO {

private	 HashSet<String> skills=new HashSet<String>();
private	 HashMap<String,HashSet<Integer>> hm=new HashMap<String,HashSet<Integer>>();

	public CandidateDAO()  {
		
		// TODO Auto-generated constructor stub
	}
	public  HashSet<String> skill_list(){
	       Set lis=hm.entrySet();  
	         Iterator i=lis.iterator();
	          while(i.hasNext()){
	        	  Map.Entry<String, ArrayList<Integer>> entry=(Map.Entry)i.next();
	        	 // System.out.println(entry.getKey()+" "+entry.getValue());
	          }
	  return skills;
	}
	public  Candidate getdata(HttpServletRequest request,int pos) throws IOException, ParseException, java.text.ParseException{
		Candidate cand=new Candidate();
		ArrayList<Education> edulist= new ArrayList<Education>();
		ArrayList<work_history> worklist= new ArrayList<work_history>();
		FileReader reader = new FileReader(request.getServletContext().getRealPath("/WEB-INF/json/resumes-json.txt"));
		 JSONParser jsonParser = new JSONParser();
	    JSONObject outerObject = (JSONObject) jsonParser.parse(reader);
	     JSONArray jsonArray =(JSONArray)outerObject.get("resumes");
	     JSONObject jsonobj=(JSONObject)jsonArray.get(pos);
	     //resumeKey
	     cand.setPosId(pos);
	     cand.setResID(jsonobj.get("resumeKey").toString());
	     cand.setSkills(jsonobj.get("skills").toString());
	     cand.setFname(jsonobj.get("firstName").toString());
	     cand.setSummary(jsonobj.get("summary").toString());
	     cand.setLname(jsonobj.get("lastName").toString());
	     jsonArray =(JSONArray)jsonobj.get("educations");
	     for (int i = 0;  i < jsonArray.size(); i++)
	     {
	    	 JSONObject jsonobj1=(JSONObject)jsonArray.get(i);
	 		 Education edu= new Education();
	    	 edu.setDegree(jsonobj1.get("degree").toString());
	    	 edu.setLocation(jsonobj1.get("location").toString());
	    	 edu.setField(jsonobj1.get("field").toString());
	    	 edu.setSchool(jsonobj1.get("school").toString());
	    	 JSONObject jsonobj2=(JSONObject)jsonobj1.get("dateRange");
	    	 edu.setDateRange(jsonobj2.get("displayDateRange").toString());
	    	 edulist.add(edu);
	     } 
	     cand.setEducation(edulist);
	     jsonArray =(JSONArray)jsonobj.get("workExperiences");
	     for (int i = 0;  i < jsonArray.size(); i++)
	     {
	    	JSONObject jsonobj1=(JSONObject)jsonArray.get(i);
	 		work_history work=new work_history();
	 		work.setTitle(jsonobj1.get("title").toString());
	 		work.setCompany(jsonobj1.get("company").toString());
	    	JSONObject jsonobj2=(JSONObject)jsonobj1.get("dateRange");
	    	work.setDateRange(jsonobj2.get("displayDateRange").toString());
	    	worklist.add(work);
	     } 
	     cand.setWork(worklist);
		return cand;
	}
	public  ArrayList<work_history> getwork(HttpServletRequest request,int pos) throws IOException, ParseException, java.text.ParseException{
		ArrayList<work_history> worklist= new ArrayList<work_history>();
		FileReader reader = new FileReader(request.getServletContext().getRealPath("/WEB-INF/json/resumes-json.txt"));
		 JSONParser jsonParser = new JSONParser();
	    JSONObject outerObject = (JSONObject) jsonParser.parse(reader);
	     JSONArray jsonArray =(JSONArray)outerObject.get("resumes");
	     JSONObject jsonobj=(JSONObject)jsonArray.get(pos);
	     //resumeKey
	     jsonArray =(JSONArray)jsonobj.get("workExperiences");
	     for (int i = 0;  i < jsonArray.size(); i++)
	     {
	    	JSONObject jsonobj1=(JSONObject)jsonArray.get(i);
	 		work_history work=new work_history();
	 		work.setTitle(jsonobj1.get("title").toString());
	 		work.setCompany(jsonobj1.get("company").toString());
	    	JSONObject jsonobj2=(JSONObject)jsonobj1.get("dateRange");
	    	work.setDateRange(jsonobj2.get("displayDateRange").toString());
	    	worklist.add(work);
	     } 
	    return worklist;
	}
	public  ArrayList<Education> getedu(HttpServletRequest request,int pos) throws IOException, ParseException{
		ArrayList<Education> edulist= new ArrayList<Education>();
		FileReader reader = new FileReader(request.getServletContext().getRealPath("/WEB-INF/json/resumes-json.txt"));
		 JSONParser jsonParser = new JSONParser();
	    JSONObject outerObject = (JSONObject) jsonParser.parse(reader);
	     JSONArray jsonArray =(JSONArray)outerObject.get("resumes");
	     JSONObject jsonobj=(JSONObject)jsonArray.get(pos);
	     //resumeKey
	     jsonArray =(JSONArray)jsonobj.get("educations");
	     for (int i = 0;  i < jsonArray.size(); i++)
	     {
	    	 JSONObject jsonobj1=(JSONObject)jsonArray.get(i);
	 		 Education edu= new Education();
	    	 edu.setDegree(jsonobj1.get("degree").toString());
	    	 edu.setLocation(jsonobj1.get("location").toString());
	    	 edu.setField(jsonobj1.get("field").toString());
	    	 edu.setSchool(jsonobj1.get("school").toString());
	    	 JSONObject jsonobj2=(JSONObject)jsonobj1.get("dateRange");
	    	 edu.setDateRange(jsonobj2.get("displayDateRange").toString());
	    	 edulist.add(edu);
	     } 
	    return edulist;
	}
	public HashMap<String,HashSet<Integer>> parse(HttpServletRequest request) throws IOException, ParseException{
		FileReader reader = new FileReader(request.getServletContext().getRealPath("/WEB-INF/json/resumes-json.txt"));
		 JSONParser jsonParser = new JSONParser();
	    JSONObject outerObject = (JSONObject) jsonParser.parse(reader);
	     JSONArray jsonArray =(JSONArray)outerObject.get("resumes");    
	   	   HashSet<Integer> list=new HashSet<Integer>();
		  System.out.println(list);
		  
		  String sk_temp=null;
	    for (int i = 0;  i < jsonArray.size(); i++)
	     {
	       // "...and get thier component and thier value."
	    	 JSONObject jsonobj=(JSONObject)jsonArray.get(i);
	         //System.out.println( jsonobj.get("firstName")+" "+jsonobj.get("lastName"));
	         for(String sk:jsonobj.get("skills").toString().split(",")){
	        	 sk_temp=sk.trim().toLowerCase();
	        	 if(sk_temp!=null&& !sk_temp.isEmpty())
	              {	 
	          		 skills.add(sk_temp);  
	        		 list=hm.get(sk_temp);
	        		 if(list!=null){
	        			 list.add(i);
	        		 hm.put(sk_temp, list);
	        		 }
	        		 else{
	        			 HashSet<Integer> newlist =new HashSet<Integer>();
	        			 newlist.add(i);
	            		 hm.put(sk_temp, newlist);
	        		 }
	        	
	              }
	         }
	         }
	        	return hm;      
	  
	}
		
	
}
