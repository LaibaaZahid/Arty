<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="adminhome.css">
    <title>AdminHome</title>
</head>
<body>

    <%

    String s = (String)session.getAttribute("session");
    if(s==null){
        %>
        <h1>You dont have a session</h1>
        <%
    }
    else{
    String type = (String)session.getAttribute("user_type");
    if(type.equals("user")){
            response.sendRedirect("error.jsp");
    }



%>
<nav class="mynavbar">

    <div class="header">
        <img src="logo.png" alt="logo">
        <p>ARTY</p>
    </div>
    <ul class="navli">
        <li><a href="adminhome.jsp">Home</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>

</nav>

<div class="buttons">

    <form action="add.jsp">

        <button class="btn" type="submit">Add Painting</button>


    </form>


    <form action="update.jsp">
        <button class="btn" type="submit">Update Painting</button>
    </form>


    <form action="delete.jsp">
        <button class="btn" type="submit">Delete Painting</button>

    </form>

    <form action="seeall.jsp">
        <button class="btn" type="submit">See All Paintings</button>

    </form>



</div>


<%
}
%>

    
</body>
</html>