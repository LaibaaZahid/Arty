<%@page import="java.util.*" %> 
<%@page import="MyPack.*" %>
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
        text-align: center;
    }
</style>

</head>



<body>
   


<%  

String i=request.getParameter("id");
String a=request.getParameter("artist");
String p = request.getParameter("price");
String f=request.getParameter("filter");
int pr=0;
if(i=="" || a=="" || p=="" || f==""){
    %>
    <div class="heading">
    <h1>All Fields must be Filled</h1>
</div>
<%
}


    


else{
   

try{
    pr = Integer.parseInt(p);

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost/paintings";

Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement();


String query="Select * from paint_table where id='"+i+"'";

ResultSet rs = st.executeQuery( query );

 if(rs.next()){
%>
<div class="heading">
<h1>Sorry Id already exists, try with another</h1>
</div>

<%

}
else{
 
 String query2 = "INSERT INTO paint_table(id,artist,filter,price)VALUES('"+ i + "','" + a + "','"+ f +"',"+pr+") ";

int rst = st.executeUpdate( query2 );

 if(rst==1){
          
        %>
        <div class="heading">
        <h1>Record inserted</h1>
        <a style="color: wheat; font-size: large;" href="adminhome.jsp">Go to Home</a>
    </div>
       
        <%
         
    
}
else{	
    %>
    <div class="heading">
    <h1>Record could not be inserted.</h1>
</div>
<%
}

 

}



       st.close();
       con.close();

}catch(NumberFormatException ex){
   %>
    <div class="heading">
        <h1>Price must be a number</h1>
    </div>
    <%
 
}
catch(Exception ex){
    
}

}

%>





<%
}

%>




</body>









</html>