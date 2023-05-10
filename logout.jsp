
<html>
    <body>
        
   


<%

session.removeAttribute("session");
response.sendRedirect("login.html");
session.invalidate();



%>

</body>

</html>
