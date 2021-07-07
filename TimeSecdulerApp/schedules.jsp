<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home Page</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="schedules.css">
  <link rel="stylesheet" href="navbar.css">
</head>
<body>
  <div class="header" id="homehead">
        <h2>Professional planner</h2>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar">
        <a class="navbar-brand" href="navbar.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
            <a class="navbar-brand" href="schedules.jsp">Agenda</a>
            </li>
            <li class="nav-item">
              <a class="navbar-brand" href="movierecom.jsp">Movie Recommendation</a>
            </li>
          </ul>
          <span class="navbar-text">
                <div class="btn-group">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="drop">
                    &nbsp;&nbsp;Hello,
                    <%
         Cookie cookie = null;
         Cookie[] cookies = null;
         String email="";
         ResultSet rs=null;
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().equals("loginuser"))
               out.print(cookie.getValue( ));
               else if(cookie.getName().equals("email"))
            		email=cookie.getValue();
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
%>
                    </button>
                    <div class="dropdown-menu">
                    <button class="dropdown-item" href="#">Profile</button>
                    <button class="dropdown-item" onclick="about()">about</button>
                    <button class="dropdown-item" href="#">help</button>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="index.html">logout</a>
                    </div>
                </div>
          </span>
        </div>
      </nav>
      
      
<div class="search">
    
    <button type="button" class="btn btn-secondary" id="addbtn" onclick="addevent()">Add new event</button>
        <br><br> 
        <br>
        <form action="AddEvent" method="POST">
			<p id="addevent">
			</p>
        </form>
</div><br>
<div class="container-fluid" id="schedulecontent">
         <div class="row">
          <div class="col-sm schedules">
            Event : Meeting With Jon<br>
			Time: 10:00 PM<br>
			Date: 15-06-2021<br>
          </div>
          <div class="col-sm schedules">
            Event : Doctor Appointment<br>
			Time: 2:00 PM<br>
			Date: 16-06-2021<br>
          </div>
          <div class="col-sm schedules">
            Event : Wt Class<br>
			Time: 09:40 AM<br>
			Date: 15-06-2021<br>
          </div>
        </div>
        <%try { 
        	System.out.println(email);
			//step1 load the driver class 
			Class.forName("oracle.jdbc.driver.OracleDriver");    

			//step2 create  the connection object  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","wtassignment","vasavi");  
			Statement stmt = con.createStatement();  
			rs = stmt.executeQuery("select distinct * from addevent where email=\'"+email+"\' order by eventdate asc");
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
        %>
        <%while(rs!=null) {%>
        <div class="row">
        	<%int i=0; %>
        	<% for(i=0;i<3 && rs!=null && rs.next();i++) {%>
          		<div class="col-sm schedules">
            	Event : <%=rs.getString("event")%><br>
            	<% String[] s=rs.getString("eventdate").split(" ");%>
				Time: <%out.println(s[1]);%> PM<br>
				Date: <%out.println(s[0]);%><br>
            	</div>
        	<%} %>
        	<%if(i==0) break; %>
        </div>
        <%} %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
    function addevent(){
        a = document.getElementById("addevent");
        a.innerHTML='<br><div class="container-fluid" id="eventcontent"><input type="text" placeholder="enter event" id="eventname" name="eventname"></input><br><input type="datetime-local" id="eventtime" name="eventtime"><br><input type="submit"  value="Submit"></input></div>';
    }
    function demo()
    {
    	console.log(document.getElementById("eventtime").value);
    }
</script>
</body>
</html>