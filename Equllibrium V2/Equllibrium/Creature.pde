// the general creature class which will have children in form of different species
class creature {

  PVector loc;
  PVector vel;
  PVector acc;
  Boolean meat;

  creature(float cx, float cy, Boolean meat) {
    loc = new PVector(cx, cy);
    this.meat = meat;
  }
  
  void display(){  
    ellipse(50, 50, 15, 15);
    
    
  }
  
  //switch(meat){
  //case true:
  //searchFood(creature);
  //break;
  //case false:
  //searchFood(vegetation);
  //break;
  //}
  
  
  void searchFood(ArrayList food){
  
  
  
  }
}
class hare extends creature{
  
  hare(PVector loc){
  super(loc.x,loc.y, false);
  }
  
  

}