<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="adminhome.css">
    <title>Document</title>
<style>
             .myform{
            background-color: rgb(30, 65, 17);
            height: 150px;
            width: 28%;
            margin-top: 10%;
            margin-left: 30%;
            font-family: cursive;
            font-size: large;
            color: wheat;
            padding: 30px;
            opacity: 100%;
            border: 2px solid rgb(1, 0, 0);
            border-radius: 10px;
            font-weight: bold;
            box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.601);
        }

        .myform input{
            width: 250px;
            margin: 10px;
            margin-top: 0px;
            margin-left: 50px;
            height: 20px;
            border: 2px solid gray;
            border-radius: 5px;
            background-color: lightgray;
            
        }

        .myform button{
            margin: 10px;
            margin-left: 25%;
            width: 150px;
            height: 40px;
            border-radius: 15px;
            background-color: darkgreen;
            color: wheat;
            font-family: cursive;
            font-weight: bold;
        }
   
</style>

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


        <form class="myform" action="delete2.jsp" method="POST">
         <p>Painting Id:</p> 
        <input id="id" type="text" name="id">
       


        <button class="submitbtn" type="submit">Delete</button>

        

    </form>


    </div>
    
    

<%

}

%>

</body>
</html>