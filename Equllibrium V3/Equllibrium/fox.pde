class fox {
  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target;
  int myType = 0;
  int hunger = 1000;
  float r = 10;
  float maxForce = 0.1, maxSpeed = 4.5;

  fox(float cx, float cy) {
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
  void hunger(){
    hunger--;
    text("hunger: " + hunger, loc.x, loc.y);
  }
  PVector getClosestTarget(ArrayList<hare> hare, PVector currentLocation) {
    PVector theTarget;
    PVector bestTarget = null;
    float d;
    float closest = 100000.0;
    for (int i = 0; i < hare.size (); i++) {
      theTarget = hare.get(i).getLoc();
      d = theTarget.dist(currentLocation, theTarget);
      if (d < closest) {
        bestTarget = theTarget;
        closest = d;
      }
      if (d < 10) {
        hunger = 1000;
        hare.remove(i);
      }
    }
    return bestTarget;
  }
  void applyBehaviors(ArrayList<fox> fox) {
    PVector theTarget; 
    theTarget = getClosestTarget(hare, loc);
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
    fill(#FAA803, 100);
    ellipse(loc.x, loc.y, r*2, r*2);
    popStyle();
  }
}