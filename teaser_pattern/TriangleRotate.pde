class TriangleRotate {
  float x; 
  float y;
  
  TriangleRotate (float PosX, float PosY) {
    x = PosX;
    y = PosY;
  }
  void display() {
    fill(200,random(100,200),100);
    noStroke();
    //triangle(x,y,x+100,y, x+100, y+100);
    triangle(x,y,x+60,y, x+60, y+60);
  }
  
}
