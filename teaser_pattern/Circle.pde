class Circle {
  float x; 
  float y;

  Circle (int PosX, float PosY) {
    x = PosX;
    y = PosY;
  }
  void display() {
    fill(200, random(100,200), 100);
    ellipse(x, y, 100, 100);
  }
}
