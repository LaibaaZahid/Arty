package MyPack;
import java.io.*; 
public class PaintBean implements Serializable{ 

private int price; 
private String id; 
private String artist; 
private String filter; 

// no argument constructor 
public PaintBean() { 
id="";
price=0;
artist = ""; 
filter = ""; 
} 

// setters 
public void setPrice(int p){ 
 price = p; 
} 

public void setArtist(String a){ 
 artist=a; 
} 

public void setId(String i){ 
 id = i; 
}

public void setFilter(String f){ 
 filter = f; 
}
 
// getters 
public int getPrice( ){ 
 return price; 
} 

public String getId( ){ 
 return id; 
} 

public String getArtist( ){ 
 return artist; 
}

public String getFilter( ){ 
 return filter; 
} 

} // end class 

