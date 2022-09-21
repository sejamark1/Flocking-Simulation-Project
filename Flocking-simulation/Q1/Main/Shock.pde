class Shock{ 

  PVector position; 
  Shock(int x, int y){ 
    position = new PVector(x,y); 
  }
  
  void affect(Flock flock){ 
    fill(0,0,255); 
    ellipse(position.x, position.y, 100,100); 
    for (Boid b: flock.boids){ 
      if(b.position.dist(position) < 50){ 
        b.col = color(0,0,255); 
        flock.count++; 
      }
    }
  }
}
