<%@page import="java.util.*" %> 

<%@ page import = "java.sql.*" %>


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



<html>
<head>
<link rel="stylesheet" href="adminhome.css">


<style>
    .heading{
        margin: 30%;
        margin-top: 15%;
        margin-bottom: 30px;
        background-blend-mode: darken;
        height: 120px;
       
        
        width: 28%;
        background-color: rgba(32, 75, 13, 0.825);
        opacity: 90%;
        -webkit-box-shadow:0px 0px 35px 15px rgba(195, 174, 10, 0.9);
        -moz-box-shadow: 0px 0px 35px 15px rgba(195, 174, 10, 0.9);
        box-shadow: 0px 0px 35px 15px rgba(195, 174, 10, 0.9);
        border: 1px solid black;
        text-align: center;
    }
</style>

</head>



<body>
   


<%  

String i=request.getParameter("id");
if(i==""){
    %>
    <div class="heading">
        <h1>Empty Id!</h1>
    </div>
    <%
}
else{

try{

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost/paintings";

Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement();



String query2 = "DELETE FROM paint_table WHERE id = '"+i+"'";

int rst = st.executeUpdate( query2 );

 if(rst==1){
          
        %>
        <div class="heading">
        <h1 style="color: wheat; font-family: cursive;">Painting Deleted</h1>
        <a style="color: wheat; font-size: large; font-family: cursive;" href="adminhome.jsp">Go to Home</a>
    </div>
        <%
         
    
}
else{	
    %>
    <div class="heading">
    <h1>Record could not be deleted.</h1>
</div>
<%
}

 





       st.close();
       con.close();

}catch(Exception ex){
  
 
 
}

}

%>





<%

}

%>




</body>









</html>