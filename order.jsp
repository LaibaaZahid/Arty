<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="home.css">

    <style>
        .heading{
            margin: 30%;
            margin-top: 15%;
            background-blend-mode: darken;
            height: 100px;
            padding: 20px;
            padding-left: 25px;
            width: 28%;
            background-color: rgba(32, 75, 13, 0.825);
            opacity: 90%;
            -webkit-box-shadow:0px 0px 35px 15px rgba(195, 174, 10, 0.9);
            -moz-box-shadow: 0px 0px 35px 15px rgba(195, 174, 10, 0.9);
            box-shadow: 0px 0px 35px 15px rgba(195, 174, 10, 0.9);
            border: 3px solid black;
        }
    </style>



</head>
<body>
   
    <%  session.removeAttribute("cart");
     String n = request.getParameter("name");
    String c = request.getParameter("city");
    String a = request.getParameter("address");
    String p = request.getParameter("phone");

    if(n=="" || c == "" || a == "" || p==""){
        %>
        <div class="heading">
        <h1>All fields must be filled!</h1>
        </div>
        <%
    }
   
    else{
        try{
            int ph = Integer.parseInt(p);
        
       
%>

<nav class="mynavbar">

    <div class="header">
        <img src="logo.png" alt="logo">
        <p>ARTY</p>
    </div>
    <ul class="navli">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>

</nav>
    <div class="heading">
    <h1 >Your Order has Been Placed!</h1>
    </div>
    <%
}
    catch(NumberFormatException ex){
        %>
        <h1>Phone no must be a number</h1>
        <%
    }
   
    }
    %>
</body>
</html>