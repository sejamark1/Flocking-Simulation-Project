
class Sworm{ 
  ArrayList<Boid> boids;
  float desiredDistanceInSworm = 10.0f; 
  Sworm() {
    boids = new ArrayList<Boid>(); 
  }
  void run(ArrayList<Obstacle> obstacle) {
    for(Boid b : boids){ 
      b.run(boids, obstacle, (int)boids.size()); 
    }
  }
  
  void add(Boid b){ 
    boids.add(b);
  }
  
  void emptyArray() { 
    boids = new ArrayList<Boid>(); 
  }

  
  void swormGroupBehavior(){ 
    
  }
  
}


/*




*/
