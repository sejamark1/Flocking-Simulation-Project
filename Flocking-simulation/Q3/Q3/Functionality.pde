import controlP5.*; 



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
  
  void changeBackgroundButton() {
    cp5.addButton("Change")
     .setPosition(width-400,height-50)
     .setSize(100,30)
     .setValue(0)
     .activateBy(ControlP5.RELEASE);
  
  }
  

}

//public void Play(){ 
//  pause = false; 
//  if(play == true){ 
//      println("Ex");
//      setUpSworms();
//      play =false; 
//  }


  
 
//}
//public void Pause(){
//  pause = true; 
//}





public void Stop(){
  swarm.emptyArray(); 
}


String[] imageNames = {"image1.png","image2.png","image3.png","image4.png","image5.png"}; 



public void Change(){ 
  img = loadImage(imageNames[(int)random(0,imageNames.length)]);
  img.resize(WIDTH, HEIGHT);
  
}
