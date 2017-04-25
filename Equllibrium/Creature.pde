class creature {

  PVector location; // Location defines where the creature is displayed & created
  PVector velocity; // Velocity is how fast the creature is going.
  PVector acceleration; // Acceleration is how fast the creature speeds up.

  float foodEaten;
  float size;
  float maxForce;
  float maxSpeed;

  creature(float cx, float cy) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(cx, cy);
    size = 50; // size is how big the Creature is currently not scalable.
    maxForce = 0.1; // this defines how responsive the Creature can be. The higher the more reponsive. (TurnRate)
    maxSpeed = 4; // maxSpeed defines how fast the Creature goes, but its downside is it wont make it turn faster making it less responsive
  }
  // update function that makes sure the creatures' position are constantly being updated.
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  // The function that makes sure the creature is pushed towards the target.
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void target(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector chase = PVector.sub(desired, velocity);
    chase.limit(maxForce);
    applyForce(chase);
  }

  void display() {
    pushStyle();
    fill(175);
    noStroke();    
    ellipse(location.x, location.y, size, size);
    popStyle();
  }
  void pickTarget() {
    for (vegetation v : vegetation) {
      v.getLoc().get();
    }
  }
}