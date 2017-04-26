class hare {
  int foodcount = 0;
  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target;
  int myType = 0;
  float r = 10;
  float maxForce = 0.1, maxSpeed = 3/2;

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
    PVector separateForce = separate(hare);
    theTarget = getClosestTarget(vegetation, loc);
    if (theTarget == null) {
      theTarget = loc;
    }
    //PVector seekForce = seek(theTarget);
    PVector seekForce = seek(theTarget);
    //line(loc.x, loc.y, theTarget.x, theTarget.y); // debug
    seekForce.mult(1);
    applyForce(seekForce);
    separateForce.mult(2);
    applyForce(separateForce);
    
    
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
  PVector separate (ArrayList<hare> hare) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    hare other;
    for (int i = 0; i < hare.size(); i++) {
      other = hare.get(i);
      float d = PVector.dist(loc, other.loc);
      desiredseparation = r + other.r;
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation) ) {
        if (myType == other.myType) {
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(loc, other.loc);
          diff.normalize();
          diff.div(d);        // Weight by distance
          sum.add(diff);
          count++;            // Keep track of how many
        }
      }
    } 

    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxSpeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxForce);
    }
    return sum;
  }

  void update() {
    velocity.add(acceleration);
    loc.add(velocity);
    acceleration.mult(0);
  }
  void display() {
    pushStyle();
    noStroke();
    fill(255, 100);
    ellipse(loc.x, loc.y, r*2 + foodcount, r*2 + foodcount);
    popStyle();
  }
  int foodeaten() {
    return foodcount;
  }
}