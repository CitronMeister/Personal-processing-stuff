// The creature class
class creature {

  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target;
  int myType = 0;
  float r = 10;
  float maxForce = 0.1, maxSpeed = 2;
  creature(float cx, float cy) {
    loc = new PVector(cx, cy);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  int getType() {
    return myType;
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
        vegetation.remove(i);
      }
    }
    return bestTarget;
  }
  PVector getClosestTarget2(ArrayList<creature> creature, PVector currentLocation) {
    PVector theTarget;
    PVector bestTarget = null;
    float d;
    float closest = 100000.0;
    for (int i = 0; i < creature.size(); i++) {
      theTarget = creature.get(i).getLoc();
      d = theTarget.dist(currentLocation, theTarget);
      if (d < closest) {
        if (myType != creature.get(i).getType()) {
          bestTarget = theTarget;
          closest = d;
        }
      }
    }    
    return bestTarget;
  }
  PVector separate (ArrayList<creature> creature) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    creature other;
    for (int i = 0; i < creature.size(); i++) {
      other = creature.get(i);
      float d = PVector.dist(loc, other.loc);
      desiredseparation = r + other.r;
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation) ) {
        if (getType() == other.getType()) {
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(loc, other.loc);
          diff.normalize();
          diff.div(d);        // Weight by distance
          sum.add(diff);
          count++;            // Keep track of how many
        } else if ( (getType() == 2) && (other.getType() == 1) ) { // eat the prey
          creature.remove(i);
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

  void applyBehaviors(ArrayList<creature> creature) {
    PVector theTarget;
    PVector separateForce = separate(creature);
    if (myType == 1) {
      theTarget = getClosestTarget(vegetation, loc);
      if (theTarget == null) {
        theTarget = loc;
      }

      //PVector seekForce = seek(theTarget);
      PVector seekForce = seek(theTarget);
      //line(loc.x, loc.y, theTarget.x, theTarget.y); // debug
      seekForce.mult(1);
      applyForce(seekForce);
    } else if (myType == 2) {
      theTarget = getClosestTarget2(creature, loc);
      if (theTarget == null) {
        theTarget = loc;
      }

      //PVector seekForce = seek(theTarget);
      PVector seekForce = seek(theTarget);
      //line(loc.x, loc.y, theTarget.x, theTarget.y); // debug
      separateForce.mult(1);
      seekForce.mult(1);
      applyForce(seekForce);
      applyForce(separateForce);
      
    }
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
    ellipse(loc.x, loc.y, r*2, r*2);
    popStyle();
  }
}
class hare extends creature {

  hare(PVector loc) {
    super(loc.x, loc.y);
    myType = 1;
    maxForce = 0.1;
    maxSpeed = 4;
    r = 15;
  }
}
class fox extends creature {
  fox(PVector loc) {
    super(loc.x, loc.y);
    myType = 2;
    maxForce = 0.4;
    maxSpeed = 6;
    r = 20;
  }
  void display() {
    pushStyle();
    noStroke();
    fill(#FAA803);
    ellipse(loc.x, loc.y, r*2, r*2);
    popStyle();
  }
}