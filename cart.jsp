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

<%  String rid = request.getParameter("remove");
    if(rid != null){
        ArrayList<String> items =  (ArrayList<String>)session.getAttribute("cart"); 
        if(items != null){
            for(int j=0; j<items.size(); j++){
                String i = (String)items.get(j);
                if(i.equals(rid)){
                    items.remove(j);
                }
            }

        }    


    }



    
    String id = request.getParameter("itemid");
    if(id != null){
    ArrayList<String> items =  (ArrayList<String>)session.getAttribute("cart"); 
    if(items == null){    
        items = new ArrayList();
    }    
    int found = 0;
    for(int j=0; j<items.size(); j++){
        String i = (String)items.get(j);
        if(i.equals(id)){
            found = 1;
        }
    }
    if(found == 0){
    items.add(id);
    session.setAttribute("cart", items);
    }	

}
    
    response.sendRedirect("home.jsp");	

    
%>


<%
}
%>
   

</body>

</html>

