﻿<!DOCTYPE html> 
<html>   
   <head>         
       <meta charset="UTF-8">         
       <title>User List Display ASP Page</title>         
       <style type="text/css">            
        h1 {text-align: center; color: blue} 
	            h2 {font-family: Ariel, sans-serif; text-align: left; color: blue} 
		p.footer {text-align: center}            
        table, th, td {               
	border: 1px solid black;               
	border-collapse: collapse;            
	}         
        </style>   
      </head>   
      <body>      
	<h1>The Member Table</h1>      
	<hr />      
	<h2><center>Member List</center></h2> 
 <%   Session.CodePage  = 949                   
	Response.CharSet  = "euc-kr"   
	Response.AddHeader "Pragma","no-cache"      
	Response.AddHeader "cache-control", "no-staff"   
	Response.Expires  = -1 
 %>


<%      
       Dim dbConCmd, SQLQuery, dbCon, rs, rsList      
       dbConCmd= "DSN=root; Database=sr; UID=root; PWD=krx8018@;"
       SQLQuery = "SELECT Name_, PhoneNumber FROM Member"

      Set dbCon = Server.CreateObject("ADODB.Connection")      
      Set rs = Server.CreateObject("ADODB.RecordSet")

      dbCon.Open dbConCmd      
      rs.Open SQLQuery, dbCon 
%>
<center>
<table> 
<tr> 
      <th>Name</th>       <th>PhoneNumber</th>     
  </tr>
</center>
<% 
   IF (rs.BOF AND rs.EOF) THEN 
      Response.Write("유저정보가 존재하지 않습니다.") 
   ELSE 
      rsList= rs.GetRows() 
      FOR x=0 TO UBound(rsList, 2) 
        Response.Write("<tr>") 
        FOR y=0 TO Ubound(rsList, 1) 
          Response.Write("<td>") 
          Response.Write(rsList(y, x)) 
          Response.Write("</td>") 
        NEXT 
        Response.Write("</tr>") 
        NEXT 
        Response.Write("</table>") 
   END IF 
%> 
      <br/> 
      <hr/> 
      <p class="footer"> 
        <a href="../wwwroot/study1.html">Return to Study Cafe Home Page</a> 
      </p> 
      <hr/> 
   </body> 
</html>