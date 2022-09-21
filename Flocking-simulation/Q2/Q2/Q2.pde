import controlP5.*;
ControlP5 cp5;
Slider slider; 


int MAX_SLIDER_VALUE = 300;
PImage bg; 
Flock flock;

void setup() {
  size(737, 553);
  bg = loadImage("space.jpg"); 
  cp5 = new ControlP5(this);
  slider = cp5.addSlider("slider")
 .setRange(0,MAX_SLIDER_VALUE)
 .setValue(33)
 .setPosition(width-100, height-100)
 .setSize(100,10);
 slider.setSliderMode(Slider.FLEXIBLE);  // change sliderMode of the Slider object. The default is Slider.FIX

 
 
 
 
 
 flock = new Flock();
  // Add an initial set of boids into the system
  addFlock(int(slider.getValue()));
}

void draw() {
  background(bg);
  if(int(slider.getValue()) > flock.getBoidsCount()){ 
    addFlock(int(slider.getValue() - flock.getBoidsCount()));
  }

  if(int(slider.getValue()) < flock.getBoidsCount()){ 
    flock.removeBoid(int(flock.getBoidsCount() - slider.getValue()));
  }

  
  
  
  // if size of flock is greater than array.len + 


  
  //addFlock(int(slider.getValue()));
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
    flock.addBoid(new Boid(width/2,height/2, color(255,255,0)));
}

void addFlock(int value){ 
  if(!(value <=0)){
    for (int i = 0; i < value; i++) {
      flock.addBoid(new Boid(width/2,height/2, color(255,255,0)));
    }
  }
  
}

boolean checkedPressed(int currentValue){  
  println(currentValue); 
  println(int(slider.getValue())); 
  if(currentValue < int(slider.getValue()) || currentValue > int(slider.getValue())){ 
    return true; 
  }
  
  
  return false; 
  
}
