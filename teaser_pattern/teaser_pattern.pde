// set up the PImage object
PImage img; 

// set up the arrays of shapes
Rectangle[] rectangles = new Rectangle[20];
Circle[] circles = new Circle[20]; // I don't use circles in this particular version but I left it in here just in case
Triangle[] triangles = new Triangle[20];
TriangleRotate[] trianglesRotate = new TriangleRotate[20];
 
void setup() {
  // use the teaser size in our template
  size(600, 337);
}

void draw() {
  
  // draw image
  img = loadImage("2112878535.jpeg");
  tint(10, 180, 120);
  image(img, 0, 0, width, height);

  // make pattern 
  for (int i = 0; i < 10; i++) {
    for (int y = 0; y < 6; y++) {
      
      // use a random number between 0 and 1 
      // to determine which shape is drawn
      float r = random(1);
      
      blendMode(LIGHTEST); // could also vary per shape
      
      // use the modulo operator to determine where the row starts
      if (y % 2 == 0) {
        
        if (r < 0.55) { 
          rectangles[i] = new Rectangle(i * 120, y*60);
          // use the custom display function from the class Rectangle to draw a rectangle  t
          rectangles[i].display();
        } else if (r>0.75) {
          trianglesRotate[i] = new TriangleRotate(i * 120, y*60);
          trianglesRotate[i].display();
        } else {
          triangles[i] = new Triangle(i * 120, y*60);
          triangles[i].display();
        }
      } else {
        if (r < 0.55) {
          rectangles[i] = new Rectangle((i * 120)-60, y*60);
          rectangles[i].display();
        } else if (r>0.75) {
          trianglesRotate[i] = new TriangleRotate((i * 120)-60, y*60);
          trianglesRotate[i].display();
        } else {
          triangles[i] = new Triangle((i * 120)-60, y*60);
          triangles[i].display();
        }
      }
    }
  }
  
  noLoop();
  
}
