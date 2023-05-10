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


<%  session.removeAttribute("cart");
    String e=request.getParameter("email");
    String p=request.getParameter("password");
    String u_name = request.getParameter("username");

    String cp = request.getParameter("cpassword");
    if(e=="" || p=="" || u_name=="" || cp==""){
        %>
        <h1>All fields must be filled</h1>
        <%
    }

    if(!p.equals(cp)){
        %>
        <h1>Pasword and Confirm Password Doesnt Match</h1>
        <%
    }

    if(p.length()<8){
        %>
        <h1> Password must contain at least 8 characters </h1>
        <%
    }


    else{

        try{

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost/users";

            Connection con=DriverManager.getConnection(url, "root", "root");

            Statement st=con.createStatement();

	
            String query="Select * from user_table where username='"+u_name+"'";
   
            ResultSet rs = st.executeQuery( query );
   
            if(rs.next()){ 
                 %>
	            <h1>Sorry username is taken, try with another</h1>
                <%
	
	        }
            else{
     
                String query2 = "INSERT INTO user_table(email,password,username,type)VALUES('"+ e + "','" + p+ "','"+u_name+"','user') ";


                int rst = st.executeUpdate( query2 );

                if(rst==1){
                    session.setAttribute("session", "true");
			        session.setAttribute("user_type", "user");	
			        response.sendRedirect("home.jsp");
			 
		
	            }
	            else{	
                    %>
                    <h1>Record could not be inserted.</h1>
                     <%
                    }

     

            }



           st.close();
           con.close();

        }catch(Exception ex){

        }

    }

%>


</body>
</html>