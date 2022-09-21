class Particle{ 
  PVector pos, vel ;
  PVector posB; 
  float pBest; 
  float radius; 
  float maxvel = 5; 
  color col; 
  
  Particle(PVector p, PVector v, color col){ 
    this.col = col ;
    pos=p.copy(); vel=v.copy(); 
    pBest = -100000000; 
    radius = 1; 
    posB=pos.copy(); 
  }
  
  void display(){ 
    fill(col); 
    circle(pos.x, pos.y, radius); 
    
  }
  
  void wraparound(){ 
    if(pos.x > WIDTH){ 
      pos.x = WIDTH-pos.x; 
    }
    if(pos.x > HEIGHT){ 
      pos.y = HEIGHT-pos.y; 
    }
    if(pos.x < 0){ 
      pos.x = WIDTH+pos.x; 
    }
    if(pos.y < 0){ 
      pos.y = HEIGHT+pos.y; 
    }
    
  } 
  
  void curbvel(){ 
    if(sqrt(vel.x*vel.x + vel.y*vel.y)>10)
    vel.normalize(); 
    vel.mult(maxvel); 
  }
  
  
  void move(PVector posG){
    vel = PVector.mult(vel, omega); 
    vel=PVector.add(vel, PVector.mult(PVector.sub(posB, pos), c1*random(1))); 
    vel=PVector.add(vel, PVector.mult(PVector.sub(posG, pos), c2*random(1))); 
    
    curbvel(); 
    
    pos=PVector.add(pos,vel); 
    //if(!inBound((int)pos.x,(int)pos.y))
    //  wraparound(); 
    if(true)
      wraparound(); 
  }
  float evaluate() {
    
    float val = 10.0;//funcedge(); 
    
    if(pBest<val){ 
      pBest=val; 
      posB=pos.copy(); 
    }
    return pBest; 
  }
  
  
  void pauseParticle() {
    pos=new PVector(0,0); 
  }
  
  
  
  
  
}
