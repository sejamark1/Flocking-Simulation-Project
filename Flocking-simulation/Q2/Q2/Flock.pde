

class Flock {
  ArrayList<Boid> boids; 
  Flock() {
    boids = new ArrayList<Boid>(); 
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
  
  int getBoidsCount() {
    return boids.size(); 
  }

  void removeBoid(int n){ 
    if(!(n <= 0)){
      for(int i =0; i < n; i++){ 
        boids.remove(n);
      }
    }
  }
}
