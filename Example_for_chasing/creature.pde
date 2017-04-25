class Creature {

  // All the usual stuff
  PVector loc;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  color bodyColor;
  int nMembranePoints;
  float[] membraneDeviation;
  float[] membraneLocX;
  float[] membraneLocY;
  int creatureType;

  // Constructor initialize all values
  Creature(float x, float y, int theCreatureType, float radius) {
    loc = new PVector(x, y);
    r = radius;
    maxspeed = 3;
    maxforce = 0.2;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    nMembranePoints = 32; // make this even number, preferably 2^n
    creatureType = theCreatureType;

    // make it look like a funky creature
    bodyColor = color(random(255), random(255), random(255)); // set a random color
    if (theCreatureType == PREY) {
      bodyColor = color(0, random(200, 255), 0); // set a random color
      maxforce /= 4;
      maxspeed /= 4;
      nMembranePoints /= 2;
    }

    membraneDeviation = new float[nMembranePoints];
    membraneLocX = new float[nMembranePoints];
    membraneLocY = new float[nMembranePoints];

    for (int i = 0; i < nMembranePoints; i++) {
      membraneDeviation[i] = 0.0;
      float angle = i * (360 / nMembranePoints);
      membraneLocX[i] = cos(radians(angle));
      membraneLocY[i] = sin(radians(angle));
    }
  }

  PVector getLoc() {
    return loc;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  float getR() {
    return r;
  }

  PVector getClosestTarget(ArrayList<Creature> creatures, PVector currentLocation, int myType) {
    PVector theTarget;
    PVector bestTarget = null;
    float d;
    float closest = LARGENUM;
    for (int i = 0; i < creatures.size (); i++) {
      theTarget = creatures.get(i).getLoc();
      d = theTarget.dist(currentLocation, theTarget);
      if (d < closest) {
        if (myType != creatures.get(i).creatureType) {
          bestTarget = theTarget;
          closest = d;
        }
      }
    }
    if (bestTarget == null && myType == PREDATOR) {
      for (int i = 0; i < 2; i++) {
        addRandomPrey();
      }
    }
    return bestTarget;
  }


  void applyBehaviors(ArrayList<Creature> creatures) {
    PVector separateForce = separate(creatures);
    PVector theTarget = getClosestTarget(creatures, loc, creatureType);

    if (theTarget == null) {
      theTarget = loc;
    }

    //PVector seekForce = seek(theTarget);
    PVector seekForce = seek(theTarget);
    //line(loc.x, loc.y, theTarget.x, theTarget.y); // debug

    separateForce.mult(2);
    seekForce.mult(1);
    applyForce(separateForce);
    applyForce(seekForce);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector theTarget) {
    PVector desired = PVector.sub(theTarget, loc);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    if (creatureType == PREY) {
      steer.mult(-1.0); // go away from predator
    }
    return steer;
  }

  // Separation
  // Method checks for nearby creatures and steers away
  PVector separate (ArrayList<Creature> creatures) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    Creature other;
    for (int i = 0; i < creatures.size(); i++) {
      other = creatures.get(i);
      float d = PVector.dist(loc, other.loc);
      desiredseparation = r + other.r;
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation) ) {
        if (creatureType == other.creatureType) {
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(loc, other.loc);
          diff.normalize();
          diff.div(d);        // Weight by distance
          sum.add(diff);
          count++;            // Keep track of how many
        } else if ( (creatureType == PREDATOR) && (other.creatureType == PREY) ) { // eat the prey
          creatures.remove(i);
        }
      }
    }

    // for each wall, check to see if it is too close
    desiredseparation = r;
    PVector closest;  

    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    loc.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    // draws the creature


    fill(bodyColor);
    stroke(0);
    pushMatrix();

    translate(loc.x, loc.y);
    float theta = velocity.heading2D() + radians(90);
    rotate(theta);
    beginShape();
    float len = 0;
    float deviation = 0;
    float locX, locY;


    // draw the body
    for (int i = 0; i < nMembranePoints; i++) {
      deviation = membraneDeviation[i];
      deviation += r*0.05*random(-1, 1);
      deviation *= 0.95;
      membraneDeviation[i] = deviation;
      len = r + deviation;
      locX = membraneLocX[i];
      locY = membraneLocY[i];
      vertex(len*locX, len*locY);
    }
    endShape(CLOSE);
    // draw the eyes

    stroke(0);
    int eyeIndex = round(nMembranePoints*5/8);
    float eyeDist = 0.6;
    len = r + membraneDeviation[eyeIndex];
    locX = membraneLocX[eyeIndex];
    locY = membraneLocY[eyeIndex];
    fill(255);
    ellipse(len*locX*eyeDist, len*locY*eyeDist, len/1.5, len/1.5);

    fill(0);
    ellipse(len*locX*eyeDist, len*locY*eyeDist, len/(4+(1-creatureType)*4), len/(4+(1-creatureType)*4));
    eyeIndex = round(nMembranePoints*7/8);
    len = r + membraneDeviation[eyeIndex];
    locX = membraneLocX[eyeIndex];
    locY = membraneLocY[eyeIndex];
    fill(255);
    ellipse(len*locX*eyeDist, len*locY*eyeDist, len/1.5, len/1.5);
    fill(0);
    ellipse(len*locX*eyeDist, len*locY*eyeDist, len/(4+(1-creatureType)*4), len/(4+(1-creatureType)*4));
    popMatrix();
  }
}

//
// A useful class to intersect lines and circles or to gest the closest point to a circle in a given segment
//
//author      Ale Gonzlez
//
PVector getClosestPointToCenter(float x1, float y1, float x2, float y2, float cx, float cy, float r) {
  float dx;
  float dy;
  float sLength;
  float sx;
  float sy;
  float pLength;
  dx = x2-x1;
  dy = y2-y1;
  sLength = sqrt(dx*dx + dy*dy);
  sx = dx/sLength;
  sy = dy/sLength;
  pLength = (cx-x1)*sx + (cy-y1)*sy;

  if (pLength < 0) { 
    return new PVector(x1, y1);
  } else if (pLength > sLength) {
    return new PVector(x2, y2);
  }

  return new PVector(x1 + sx*pLength, y1 + sy * pLength);
}