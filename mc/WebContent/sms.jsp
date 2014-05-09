<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="org.apache.http.NameValuePair" %>
<%@page import="org.apache.http.message.BasicNameValuePair" %>
<%@page import="com.twilio.sdk.*" %>
<%@page import="com.twilio.sdk.resource.factory.*" %> 
<%@page import="com.twilio.sdk.resource.instance.*" %>
<%@page import="com.twilio.sdk.resource.list.*" %>
<%
 final String ACCOUNT_SID = "AC6123bc6b51fb5da5db8197d61a2da2b3"; 
 final String AUTH_TOKEN = "93c289700b0a7dfad9cc5a9930ef4c11"; 
 TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
 //hello
	 // Build the parameters 
	 String num=request.getParameter("num");
	 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
	 params.add(new BasicNameValuePair("To", num)); 
	 params.add(new BasicNameValuePair("From", "+14128524956")); 
	 params.add(new BasicNameValuePair("Body", "Alert has been successfully Subscribed!"));   
 
	 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
	 Message message = messageFactory.create(params); 

out.print("helllo");
%>
