<%@page import="java.util.*" %> 
<%@page import="MyPack.*" %>


<%

    String s = (String)session.getAttribute("session");
    if(s==null){
        %>
        <h1>You dont have a session</h1>
        <%
    }
else{
    String type = (String)session.getAttribute("user_type");
    if(type.equals("admin")){
            response.sendRedirect("error.jsp");
    }


%>





<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">

    <title>Arty</title>

    <style>
        .paintings{
            background-color: rgba(3, 4, 2, 0.526);
            background-blend-mode: darken;
            
            display: flex;
            margin: 30px;
            width: 95%;
            border: 2px solid black;
            -webkit-box-shadow:0px 0px 30px 15px rgba(195, 174, 10, 0.9);
            -moz-box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
            box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
        }

        .paintings img{
            height: 456px; width: 20%; margin: 30px; border: 8px solid rgb(21, 9, 2);
        }

        .image{
            margin: 30px;
            font-family: cursive;
            font-size: larger;
            color: wheat;
            font-weight: bold;
           
        }


        .image button{
            margin: 20px;
            width: 150px;
            height: 45px;
            border-radius: 15px;
            background-color: darkgreen;
            color: wheat;
            font-family: cursive;
            font-weight: bold;
        }

       
    </style>

</head>

<body>

    <nav class="mynavbar">

        <div class="header">
            <img src="logo.png" alt="logo">
            <p>ARTY</p>
        </div>
        <ul class="navli">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="viewcart.jsp">View Cart</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>

    </nav>





    <div class="gallery">

        <h1>Search Results:</h1>
        <div>
            <% 
            String filter = request.getParameter("paintingtype");
            PaintDAO paintDAO = new PaintDAO(); 
            ArrayList PList = paintDAO.retrievePaintList(filter); 
            %>
            
            
            <%
            PaintBean pBean = null; 
            for(int i=0; i<PList.size(); i++){ 
             pBean = (PaintBean)PList.get(i); 

            %>
            <% String iname = pBean.getId() + ".jpg"; %>

            <div class="paintings">
            <img src=<%= iname %>  alt="cant show">
            <div class="image">
            <p>Painting Id: <%= pBean.getId() %> </p> <br>
            <p>Price: <%= pBean.getPrice() %> Rs </p>  <br>
            <p>Artist: <%= pBean.getArtist() %> </p> <br>
            <p>Filter: <%= pBean.getFilter() %> </p> <br>

            <form action="cart.jsp" method="GET">
                <button type="submit"  name = "itemid" id="cart"  value= <%= pBean.getId() %> >Add to cart</button>  
                <button type="submit" name="remove" id="removecart" value=<%= pBean.getId() %> >Remove from Cart</button>
                </form>
        </div>

        </div>
            <% 
            } // end for 
            %> 
        </div>
        
    </div>

    </div>


   

</body>

</html>

<%
}
%>