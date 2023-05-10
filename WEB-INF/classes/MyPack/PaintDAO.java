package MyPack;
import java.io.*; 
import java.sql.*; 
import java.util.*; 

public class PaintDAO implements Serializable{ 

private Connection con; 

public PaintDAO() { 
establishConnection(); 
} 

//********** establishConnection method *************

private void establishConnection(){ 

try{ 
Class.forName("com.mysql.jdbc.Driver"); 
String conUrl = "jdbc:mysql://localhost/paintings"; 
con = DriverManager.getConnection(conUrl, "root", "root"); 
}catch(Exception ex){ 
System.out.println(ex); 
} 

} 

//*********** retrievePaintingList method ******************** 

public ArrayList retrieveAllList(){ 

ArrayList PaintList = new ArrayList(); 

try{ 
String sql = "SELECT * FROM paint_table"; 
Statement st=con.createStatement(); 
ResultSet rs = st.executeQuery(sql); 

int price; 
String id; 
String artist;
String filter;
 
while ( rs.next() ) { 
price = rs.getInt("price"); 
id = rs.getString("id"); 
artist = rs.getString("artist"); 
filter = rs.getString("filter");

// creating a MobileBean object 
PaintBean pBean = new PaintBean(); 
pBean.setPrice(price); 
pBean.setId(id);
pBean.setArtist(artist); 
pBean.setFilter(filter); 

// adding a bean to arraylist 
PaintList.add(pBean); 
} 

con.close();

}catch(Exception ex){ 
System.out.println(ex); 
}

// returning ArrayList object 
return PaintList; 

} 



public ArrayList retrievePaintList(String f){ 

ArrayList PaintList = new ArrayList(); 

try{ 
String sql = "SELECT * FROM paint_table WHERE filter = '"+f+"'"; 
Statement st=con.createStatement(); 
ResultSet rs = st.executeQuery(sql); 

int price; 
String id; 
String artist;
String filter;
 
while ( rs.next() ) { 
price = rs.getInt("price"); 
id = rs.getString("id"); 
artist = rs.getString("artist"); 
filter = rs.getString("filter");

// creating a MobileBean object 
PaintBean pBean = new PaintBean(); 
pBean.setPrice(price); 
pBean.setId(id);
pBean.setArtist(artist); 
pBean.setFilter(filter); 

// adding a bean to arraylist 
PaintList.add(pBean); 
} 

con.close();

}catch(Exception ex){ 
System.out.println(ex); 
}

// returning ArrayList object 
return PaintList; 

} 


public PaintBean retrievePaintBean(String i){ 

PaintBean pBean = new PaintBean();

try{ 
String sql = "SELECT * FROM paint_table WHERE id = '"+i+"'"; 
Statement st=con.createStatement(); 
ResultSet rs = st.executeQuery(sql); 

int price; 
String id; 
String artist;
String filter;
 
if ( rs.next() ) { 
price = rs.getInt("price"); 
id = rs.getString("id"); 
artist = rs.getString("artist"); 
filter = rs.getString("filter");

pBean.setPrice(price); 
pBean.setId(id);
pBean.setArtist(artist); 
pBean.setFilter(filter); 

} 

con.close();

}catch(Exception ex){ 
System.out.println(ex); 
}


return pBean; 

} 















}

