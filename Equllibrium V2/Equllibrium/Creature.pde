// The creature class
class creature {

  PVector loc;
  PVector velocity;
  PVector acceleration;
  PVector target;
  int myType = 0;
  float maxForce = 0.1, maxSpeed = 2;
  creature(float cx, float cy) {
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
        if (myType != creature.get(i).myType) {
          bestTarget = theTarget;
          closest = d;
        }
        if (d < 10) {
          creature.remove(i);
        }
      }
    }    
    return bestTarget;
  }
  //PVector hareOrFox(){
  //  PVector vector;
  //  if vector = 

  //  return vector;
  //}


  void applyBehaviors(ArrayList<creature> creature) {
    PVector theTarget;
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
      seekForce.mult(1);
      applyForce(seekForce);
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
    ellipse(loc.x, loc.y, 15, 15);
    popStyle();
  }
}
class hare extends creature {

  hare(PVector loc) {
    super(loc.x, loc.y);
    myType = 1;
    maxForce = 0.1;
    maxSpeed = 4;
  }
}
class fox extends creature {
  fox(PVector loc) {
    super(loc.x, loc.y);
    myType = 2;
    maxForce = 5;
    maxSpeed = 6;
  }
  void display() {
    pushStyle();
    noStroke();
    fill(#FAA803);
    ellipse(loc.x, loc.y, 15, 15);
    popStyle();
  }
}