class vegitation{
  float x = random(0, width);
  float y = random(0, height);
  float spawnV = 0;
  float spawnRate = 0.01;
  
  
  
  void display(){
    pushStyle();
    fill(0, 255, 0);
    ellipse(x, y, 30, 30);
    popStyle();
  }
  

  
  
}