// the general creature class which will have children in form of different species
class creature {

  PVector loc;
   
  creature(float cx, float cy) {
    loc = new PVector(cx, cy);
    
    
  }
  
  void display(){  
    ellipse(loc.x, loc.y, 15, 15);    
  }
  
  
  
}
class hare extends creature{
  color c;
  
  hare(PVector loc){
  super(loc.x,loc.y);
  
  }
  void searchFood(ArrayList vegetation){  
  } 
}  
class fox extends creature{
  
  fox(PVector loc){
    super(loc.x, loc.y);
  }
  void searchFood(ArrayList creature){  
  
  }
  
  
}