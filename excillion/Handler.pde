  void spawn(){    
    v.spawnV = v.spawnV + v.spawnRate; 
    if(v.spawnV == 1) {
      v.display();
    if(v.spawnV == 1.1){
      v.spawnV = 0;
    }
    }
    text(v.spawnV, width/2, height/2);
    
    
    
  }