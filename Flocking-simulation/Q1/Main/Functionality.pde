
// Holds Buttons and thier function.

class Functionality{ 


  
  void playButton() {
    cp5.addButton("Play")
     .setPosition(width-300,height-50)
     .setSize(100,30)
     .setValue(0)
     .activateBy(ControlP5.RELEASE);
  
  }
  
  void pauseButton() {
    cp5.addButton("Pause")
     .setPosition(width-200,height-50)
     .setSize(100,30)
     .setValue(0)
     .activateBy(ControlP5.RELEASE);
  
  }
  
  void stopButton() {
    cp5.addButton("Stop")
     .setPosition(width-100,height-50)
     .setSize(100,30)
     .setValue(0)
     .activateBy(ControlP5.RELEASE);
  
  }
  

}

public void Play(){ 
  pause = false; 
  if(play == true){ 
      println("Ex");
      setUpSworms();
      play =false; 
  }


  
 
}
public void Pause(){
  pause = true; 
}





public void Stop(){
  flock.emptyArray(); 
  sworms.emptyArray(); 
  play=true;

}
