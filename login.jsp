<%@page import="java.util.*" %> 
<%@page import="java.sql.*" %> 
 


<html> 
  <head>
    <style>
      body{
          background-color: rgb(17, 63, 17);
          color: wheat;
          font-family: cursive;
          font-weight: bold;
          
      }
  </style>
  </head>
<body> 
 
 
 <% 
    session.removeAttribute("cart");
    String e=request.getParameter("email");
    String p = request.getParameter("password");
    if(e=="" || p==""){
      %>
      <h1>All Fields must be filled!</h1>
      <%
    }
    else{
    try{
    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost/users";

    Connection con=DriverManager.getConnection(url,"root","root");
    

    Statement st=con.createStatement();
    
    String query="Select * from user_table where email='"+e+"'";
   
    ResultSet rs = st.executeQuery( query );
   
    if(rs.next()){

		String pass = rs.getString("password");
		if(pass.equals(p)){
          session.setAttribute("session", "true");

	    		String type = rs.getString("type");
			    session.setAttribute("user_type", type);
			    if(type.equals("admin")){
            response.sendRedirect("adminhome.jsp");
				    
			}
			    else if(type.equals("user")){
				    response.sendRedirect("home.jsp");	
			    }
		}
		else{
      %>
			<h1>Wrong password</h1>
		<%
    }
	  }
     
     else{
      %>
    	 <h1>Not a valid user</h1>
        
      <%
    }



    }catch(Exception ex){

    }

  }

  %>


</body>
</html>