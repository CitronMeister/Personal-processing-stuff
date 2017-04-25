// the general creature class which will have children in form of different species
class creature {

  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target = new PVector(0, 1);
  float maxForce, maxSpeed;
  creature(float cx, float cy) {
    loc = new PVector(cx, cy);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  void update(){
    velocity.add(acceleration);
    loc.add(velocity);
    acceleration.mult(0);
  }
  void applyForce(PVector force){
    acceleration.add(force);
  }
  void target(){
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector chase = PVector.sub(desired, velocity);
    chase.limit(maxForce);
    applyForce(chase);
  }
  
  PVector getLoc() {
    return loc;
  }
  PVector searchFood(){
    return target;
  }

  void display() {
    ellipse(loc.x, loc.y, 15, 15);
  }
}
class hare extends creature {
  color c;
  int type = 1;
  
  hare(PVector loc) {
    super(loc.x, loc.y);
    maxSpeed = 4;
    maxForce = 0.1;
  }
  
  void display(){
    pushStyle();
    noStroke();
    fill(5);
    
    ellipse(loc.x, loc.y, 15, 15);
    popStyle();
  
  }
  
  PVector searchFood(ArrayList<vegetation> vegetation) {
    PVector theTarget;
    PVector bestTarget = null;
    float d;
    float Closest = 1000000000.0;
    for (int i = 0; i < vegetation.size(); i++){
      theTarget = vegetation.get(i).getLoc();
      d = theTarget.dist(loc, theTarget);
      if (d < Closest){
        bestTarget = theTarget;
        target = bestTarget;
        Closest = d;
      }
      
    }
    return bestTarget;
  }
}  
class fox extends creature {

  fox(PVector loc) {
    super(loc.x, loc.y);
  }
  void searchFood(ArrayList creature) {
  }
}