
// set up the different objects and arrays
PImage img1, img2; 
PGraphics masker1, masker2, shape;
PGraphics[] group = new PGraphics[2];
PShape svg;

// prepare an array with different transparencies
int transparency[] = {20, 50, 100, 150, 255};

void setup() {
  size(600, 337); 
  
  // load two differet images
  img1 = loadImage("kelly-sikkema-IZOAOjvwhaM-unsplash_c.jpg");
  img2 = loadImage("2119431290_c.jpg");

  // load the svg shape and clear all the styles from it
  svg = loadShape("shape-1.svg");
  svg.disableStyle();

  int rand = (int)random(transparency.length);
  println(transparency[rand]);
 
  randomSeed(0);
  group[0] = createGraphics(width, height);
  group[0].smooth();
  group[0].beginDraw();
  group[0].noStroke();
  group[0].pushMatrix();
  group[0].rotate(radians(-45));
  group[0].translate(-690, 0);
  for (int y=0; y<20; y++) {
    float offset = random(50);
    for (int x=0; x<7; x++) {
      // masker1.pushMatrix();
      // masker1.translate(x*110, y*50);
      // masker1.translate(x*110+offset+(y%2==0?0:-55), y*50);
      // masker1.rotate(radians(-45));
      // masker1.shape(svg);

      if (y % 2 == 0) {
        group[0].shape(svg, x*110+offset, y*50);
      } else {
        group[0].shape(svg, x*110-55+offset, y*50);
      }
      //group[0].popMatrix();
    }
  }
  group[0].popMatrix();
  group[0].endDraw();



  randomSeed(0);
  group[1] = createGraphics(width, height);
  group[1].smooth();
  group[1].beginDraw();
  group[1].fill(255);
  group[0].noStroke();
  group[1].pushMatrix();
  group[1].rotate(radians(-45));
  group[1].translate(80, 0);
  for (int y=0; y<40; y++) {
    float offset = random(50);
    for (int x=0; x<7; x++) {
      if (y % 2 == 0) {
        group[1].shape(svg, x*110+offset, y*50);
      } else {
        group[1].shape(svg, x*110-55+offset, y*50);
      }
    }
  }
  group[1].popMatrix();
  group[1].endDraw();

  rotate(radians(45));
  group[0].pushMatrix();
  group[0].rotate(radians(45));
  group[0].popMatrix();
  // apply mask
  img1.mask(group[0]);
  img2.mask(group[1]);
}



void draw() {

  background(0, 200, 100);
 //tint(255, 100, 0);
  image(img1, 0, 0, width, height);

  //tint(100, 100, 255);
  image(img2, 0, 0, width, height);
  // image(masker, 0, 0);
}
