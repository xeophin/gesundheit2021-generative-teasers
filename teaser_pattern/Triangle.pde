class Triangle {
  float x; 
  float y;
  
  Triangle (float PosX, float PosY) {
    x = PosX;
    y = PosY;
  }
  void display() {
    fill(200,random(100,200),100);
    noStroke();
    //triangle(x,y,x,y+100, x+100, y+100);
    triangle(x,y,x,y+60, x+60, y+60);
  }
  
}
