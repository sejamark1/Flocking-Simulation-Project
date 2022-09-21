
class Boid {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  color col; 

  Boid(float x, float y, color col) {
    this.col = col ;
    acceleration = new PVector(0, 0);
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));
    position = new PVector(x, y);
    r = 2.0;
    maxspeed = 1;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids, ArrayList<Obstacle> obstacle, int swarmSize) {
    if(pause == true){
        this.boidPause(); 
    }else{
      flock(boids, swarmSize);
      flockSeperate(obstacle);
      update();
    }
    
    borders();
    render();
    


  
}







  void flock(ArrayList<Boid> boids, int swarmSize) {
    // This effect the behaviour of boids. 
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion

    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);

    // Group behavior 
    if(swarmSize > 6){ 
      applyForce(coh);
      applyForce(ali);

    }
    // indivitual behavior 
    
    applyForce(sep);


  }
  
  void flockSeperate(ArrayList<Obstacle> ob) {
    PVector sep = separateObstacle(ob);   // Separation
    sep.mult(1.5);
    applyForce(sep);
  }
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  
  
  void boidPause(){ 
    acceleration=new PVector(0,0);
  }

  // Update Positions 
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }


  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position); 
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    float theta = velocity.heading2D() + radians(90);   
    fill(200, 100);
    stroke(this.col);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
  
  
  //Seperate
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  
  PVector separateObstacle (ArrayList<Obstacle> obstacle) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (Obstacle other : obstacle) {
      float d = PVector.dist(position, new PVector(other.bx, other.by));
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(position,  new PVector(other.bx, other.by));
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } 
    else {
      return new PVector(0, 0);
    }
  }
}
