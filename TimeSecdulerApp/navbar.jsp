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
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().equals("loginuser"))
               out.print(cookie.getValue( ));
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
       
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
   <p id="hello"></p>
  <script>
    arr = new Array();
    arr.push('<iframe  frameborder="0" scrolling="no" src="schedules.jsp"  title="Iframe Experiment"></iframe>');
    arr.push('<iframe frameborder="0" scrolling="no" src="blog.jsp"  title="Iframe Experiment"></iframe>');
    arr.push('<iframe frameborder="0" scrolling="no" src="movierecom.jsp"  title="Iframe Experiment"></iframe>');
    function abc(a1){

      a = document.getElementById("hello");
      a.innerHTML = arr[Number(a1)];
      console.log(arr[Number(a1)]);
    }
    function about(){
      a = document.getElementById("hello");
      a.innerHTML = '<div class="container-fluid" id="moviecontent"><p>this is a page about your Professional planning and your daily brefing and to-do activities</p><br><p>And also you can choose your movie recomondations accordingly..</p></div>';
    }
  </script>
  
 
</body>
</html>