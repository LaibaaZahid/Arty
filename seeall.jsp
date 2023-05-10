<%@page import="java.util.*" %> 
<%@page import="MyPack.*" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="adminhome.css">

    <title>Arty</title>


    <style>
        .paintings{
            background-color: rgba(9, 16, 3, 0.633);
            background-blend-mode: darken;
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
            height: 456px; width: 20%; margin: 30px; border: 8px solid rgb(21, 9, 2);
        }

        .image{
            margin: 30px;
            font-family: cursive;
            font-size: larger;
            color: wheat;
            font-weight: bold;
           
        }

        .gallery{
    
            background-color: rgb(16, 53, 11);
    
            overflow-x: hidden;
    
            width: 100%;
            margin-top: 2%;
            margin-right: 0px;
            border: 2px solid rgb(1, 31, 1)
   
        }


        .gallery h1{
            margin: 30px;
            font-family: cursive;
            color: rgb(225, 219, 120);
            text-shadow: 3px 3px #001001;
            font-size: 45px;
            margin-left: 50px;
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


    <div class="gallery">

        <h1>Gallery</h1>
        <div>
            <% 
            PaintDAO paintDAO = new PaintDAO(); 
            ArrayList PList = paintDAO.retrieveAllList(); 
            %>
            
            
            <%
            PaintBean pBean = null; 
            for(int i=0; i<PList.size(); i++){ 
             pBean = (PaintBean)PList.get(i); 



            %>
            <% String iname = pBean.getId() + ".jpg"; %>

            <div class="paintings" >

            <img  src=<%= iname %>  alt="cant show">
            <div class="image">
            <p>Painting Id:   <%= pBean.getId() %> </p> <br>
            <p>Price:         <%= pBean.getPrice() %> Rs</p>  <br>
            <p>Artist:         <%= pBean.getArtist() %> </p> <br>
            <p>Filter:         <%= pBean.getFilter() %> </p> <br>
            
        </div>
   
            
            </div>

            <% 
            } // end for 
            %> 
        </div>
        
    </div>
    


    </body>

    <%
}
%>

</html>