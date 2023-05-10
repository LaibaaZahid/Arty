
<%@page import="java.util.*" %> 
<%@page import="MyPack.*" %>

<html>
    <head>
        <link rel="stylesheet" href="home.css">

        <style>
            .paintings{
                background-color: rgba(3, 4, 2, 0.526);
                opacity: 90%;
                display: flex;
                margin: 30px;
                width: 95%;
                border: 2px solid black;
                -webkit-box-shadow:0px 0px 30px 15px rgba(195, 174, 10, 0.9);
                -moz-box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
                box-shadow: 0px 0px 30px 15px rgba(195, 174, 10, 0.9);
            }
    
            .paintings img{
                height: 356px; width: 15%; margin: 30px; border: 8px solid rgb(21, 9, 2);
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
            margin-left: 0px;
        }
        .heading{
        margin: 30%;
        margin-top: 15%;
        margin-bottom: 30px;
        background-blend-mode: darken;
        height: 100px;
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
    if(type.equals("admin")){
            response.sendRedirect("error.jsp");
    }


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
        <li style="background-color: darkgreen; padding: 15px; border-radius: 5px; border: 2px solid black; margin-bottom: 10px;"><a href="checkout.jsp">Checkout</a> </li>
    </ul>

</nav>



<div class="gallery">

<%




    ArrayList<String> cartItems =  (ArrayList<String>)session.getAttribute("cart");  
        if(cartItems==null){
            %>
            <div class="heading">
            <h1>No items in cart</h1>
        </div>
        
            <%
        }
        
        else{
            int total=0;
        for(int j=0; j<cartItems.size(); j++){ 
            String i= (String)cartItems.get(j);
            PaintDAO p = new PaintDAO();
            PaintBean pb = new PaintBean();
            pb = p.retrievePaintBean(i);
            total =total+ pb.getPrice();
           %>
           <div class="paintings">
           <% String iname = pb.getId() + ".jpg"; %>

           <img src=<%= iname %>  alt="cant show">

           <div class="image">
           <p>Painting Id: <%= pb.getId() %> </p>
           <p>Price: <%= pb.getPrice() %> </p>  
           <p>Artist:  <%= pb.getArtist() %> </p>
           <p>Filter:  <%= pb.getFilter() %> </p>


           <form action="cart.jsp" method="GET">
            <button type="submit" name="remove" id="removecart" value=<%= pb.getId() %> >Remove from Cart</button>
            </form>

        </div>
    </div>
           <%
        }
        %>
        <p style="font-family: cursive; font-size: medium; font-weight: bold; margin: 20px; margin-left: 80%; color: wheat;"> Total: <%= total %> Rs</p>
<%
        }
        %>
           
       

        <%
    }
    %>
</div>
</body>

</html>