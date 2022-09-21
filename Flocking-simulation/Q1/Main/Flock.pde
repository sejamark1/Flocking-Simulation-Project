class Flock{ 
  ArrayList<Boid> boids; // Dynamic storage of boids 
  ArrayList<Sworm> sworms; // Dynamic storage of sworms 
  ArrayList<Obstacle> obstacle; // Dynamic storage of obstacle 
  
  
  int count =0; 
  
  Flock(){ 
    boids = new ArrayList<Boid>(); 
    sworms = new ArrayList<Sworm>(); 
    obstacle = new ArrayList<Obstacle>(); 
    
  }
  
  void run(){ 
    //for (Boid b : boids){ 
    //  b.run(boids); 
    //}
    for (Sworm s : sworms){ 
      s.run(obstacle); 
    }
    
    for (Obstacle ob : obstacle){ 
      ob.run(); 
    }

  }
  
  


  
  void addSworm(Sworm s){ 
    sworms.add(s); 
  }
  void addBoid(Boid b){ 
    
    if(!sworms.isEmpty()){
      int index = int(random(0,sworms.size()-1));
      sworms.get(index).add(b);
    }else{ 
      sworms.add(new Sworm());
      
    }
  }
  
  
    
  void addObstacle(Obstacle ob){ 
    obstacle.add(ob);
  }
  
  void emptyArray(){ 
    boids = new ArrayList<Boid>(); 
    sworms = new ArrayList<Sworm>(); 
    obstacle = new ArrayList<Obstacle>(); 

  }
  
  
}
