import controlP5.*; 
ControlP5 cp5; 

Obstacle ob; 



boolean play = true; 
boolean pause = false; 
boolean stop = false; 

Flock flock; // SWorld 
Sworm sworms; // sworms into SWorld. 
Functionality f; // Buttons functions.




void setup() {
  size(1000,800);
  cp5 = new ControlP5(this); 
  flock = new Flock(); 
  sworms = new Sworm(); 
  f = new Functionality(); 
  setUpSworms();
  f.pauseButton(); //RESET BUTTON.
  f.stopButton(); //RESET BUTTON.
  f.playButton(); //RESET BUTTON.
  setUpSworms();


}

void draw() {

  background(50);
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
  flock.addObstacle(new Obstacle(mouseX,mouseY, random(10,20)));
}


// Adding boids to sworm and then adding sworm to flock(Sworm world)
void setUpSworms() { 
  for (int f = 0; f < random(2,5); f++) {
    color groupColor = color(random(0,255),random(0,255),0);
    for(int s = 0; s < random(5,10); s++){
      sworms.add(new Boid(mouseX, mouseY, groupColor));
    }
    flock.addSworm(sworms);
  }

}
