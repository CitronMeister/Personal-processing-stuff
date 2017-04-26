class hare {
  int foodcount = 0;
  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target;
  int myType = 0;
  float r = 10;
  float maxForce = 1, maxSpeed = 10;

  hare(float cx, float cy) {
    loc = new PVector(cx, cy);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  PVector getLoc() {
    return loc;
  }
  PVector getClosestTarget(ArrayList<vegetation> vegetation, PVector currentLocation) {
    PVector theTarget;
    PVector bestTarget = null;
    float d;
    float closest = 100000.0;
    for (int i = 0; i < vegetation.size (); i++) {
      theTarget = vegetation.get(i).getLoc();
      d = theTarget.dist(currentLocation, theTarget);
      if (d < closest) {
        bestTarget = theTarget;
        closest = d;
      }
      if (d < 10) {
        foodcount++;
        vegetation.remove(i);
      }
    }
    return bestTarget;
  }
  void applyBehaviors(ArrayList<hare> hare) {
    PVector theTarget; 
    theTarget = getClosestTarget(vegetation, loc);
    if (theTarget == null) {
      theTarget = loc;
    }
    //PVector seekForce = seek(theTarget);
    PVector seekForce = seek(theTarget);
    //line(loc.x, loc.y, theTarget.x, theTarget.y); // debug
    seekForce.mult(1);
    applyForce(seekForce);
  }

  PVector seek(PVector theTarget) {
    PVector desired = PVector.sub(theTarget, loc);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
    return steer;
  }
  void update() {
    velocity.add(acceleration);
    loc.add(velocity);
    acceleration.mult(0);
  }
  void display() {
    pushStyle();
    noStroke();
    ellipse(loc.x, loc.y, r*2 + foodcount*5, r*2 + foodcount*5);
    popStyle();
  }
  int foodeaten() {
    return foodcount;
  }
  
  //void evolve() {
  //  if (foodcount == 10) {      
  //    createNewHare();      
  //    foodcount = 0;
  //  }
  //}
}