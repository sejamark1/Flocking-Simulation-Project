import controlP5.*; 
ControlP5 cp5; 



PImage img; 
Functionality func = new Functionality(); 

final int WIDTH =512; 
final int HEIGHT = 512; 


float omega, c1, c2; 

Swarm swarm; 







void setup(){ 
  cp5 = new ControlP5(this); 


  size(1024, 512); 
  func.pauseButton();
  func.stopButton();
  func.playButton();
  func.changeBackgroundButton(); 
  begin(); 
  
  
}


void draw(){
  background(255);
  image(img,WIDTH, 0);
  swarm.run(); 
  
  
    
}

void mousePressed() {
  swarm.add(new Particle(new PVector(mouseX, mouseY), new PVector(1,1), color(255,255,0))); 


}


void begin() {
  img = loadImage("image5.png"); 
  img.resize(WIDTH, HEIGHT);
  omega =4; 
  c1=4; c2=0.12; 
  swarm = new Swarm(WIDTH, HEIGHT);
}
