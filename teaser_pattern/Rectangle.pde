class Rectangle {
  float x; 
  float y;
   
  Rectangle(float PosX, float PosY){
    x = PosX;
    y = PosY;
  }
  
  void display() {
    fill(200,random(100,200),100);
    noStroke();
    //rect(x, y, 100, 100);
    rect(x, y, 60, 60);
  }
}
