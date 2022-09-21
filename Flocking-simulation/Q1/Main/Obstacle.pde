
// OBSTACLE FOR SWARMS 
class Obstacle { 
  float bx, by; 
  float dx, dy; // MAY OR MAYNOT MOVE. 
  float wh; // Width and Height; 
  color obstacleCol; 
  

  Obstacle(float x, float y, float widthHieght) {
    bx= x; by=y; wh=widthHieght; 
    obstacleCol= color(random(0,255),random(0,255),random(0,255));
  }
  void run(){ 
    showObstacle();
  }
  void showObstacle(){ 
    //fill(obstacleCol);
    square(bx, by,wh);

    
  }
}
