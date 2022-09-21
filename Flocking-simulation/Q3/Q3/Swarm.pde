class Swarm{ 
  ArrayList<Particle> swarm; 
  int every=5; 
  float gBest; 
  PVector posG; 
  float maxinivel;
  
  
  
  Swarm(int w, int h){
    maxinivel = 3; 
    swarm = new ArrayList<Particle>(); 
    for(int i = every; i <= w-every; i+=every){ 
      for(int j = every; j <= h-every; j+=every){
        if(true)
          swarm.add(new Particle(new PVector(i,j), new PVector(random(-maxinivel, maxinivel), random(-maxinivel, maxinivel)), color(255,0,0))); 
         
        gBest = -10000000; 
        posG = new PVector(WIDTH/2, HEIGHT/2);
        for(Particle par: swarm){
          float val = par.evaluate(); 
          if(val > gBest){ 
            gBest = val; 
            posG = par.posB.copy(); 
          }
        }
      
      }
    }
  }
  
  
  
  void run() {
  
    for (Particle par : swarm){
      par.move(posG); 
      par.display(); 
      //par.pauseParticle(); 
    }
    
    for (Particle par: swarm){
      float val = par.evaluate(); 
      if(val>gBest){ 
        gBest = val ;
        posG=par.posB.copy(); 
      }
    }
  } 
  

  void emptyArray() {
    swarm = new ArrayList<Particle>(); 
  }
  
  void add(Particle p){ 
    swarm.add(p); 
  }
  
  
  
  
}
