// define how many objects there will be 
int numObj = 3; // this could also be more dynamic 

// set up arrays for all the dimensions for the shapes (size and position)
// this could probably be done more elegantly with a PVector object
int maxObjSize = 200;
int minObjSize = 100;
float[] objSize = new float[numObj];
float[] xPos = new float[numObj];
float[] yPos = new float[numObj];

// set up the image array and the mask object
PImage[] img = new PImage[numObj]; 
PGraphics mask; 


void setup() {
  size(600, 337);
  
  // define how the shapes stand to each other
  objSize[0] = random(minObjSize, maxObjSize);
  xPos[0] = random(0, width/3);
  yPos[0] = random(0, height/3);

  objSize[1] = random(minObjSize, maxObjSize);
  xPos[1] = xPos[0]+objSize[0];
  yPos[1] = yPos[0]+objSize[0];

  objSize[2] = random(objSize[0], objSize[1]);
  xPos[2] = xPos[0]+objSize[0]+objSize[1]+50;
  yPos[2] = random(height);

  // load the images into the img array
  img[0] = loadImage("2038165918_c.jpg");
  img[1] = loadImage("2121740673_c.jpg");
  img[2] = loadImage("2038165918_c.jpg");

  // create the three mask shapes and mask the images with them
  for (int i = 0; i<numObj; i++) { // put this around all
    mask = createGraphics(width, height);
    
    mask.beginDraw();
    mask.noStroke();
    mask.fill(random(200, 255));
    mask.rect(xPos[i], yPos[i], objSize[i], objSize[i], 0, 50, 0, 50);
    mask.endDraw();

    img[i].mask(mask); // how is it possible to always center the image in the mask?
  }
}

void draw() {

  background(123, 220, 145);
    
  for (int i = 0; i<numObj; i++) {
    // draw the masked image
    tint(random(150, 255), random(100, 180), 0);
    blendMode(BLEND);
    image(img[i], 0, 0, width, height);

    // go to the x- and y-position of each shape
    pushMatrix();
    translate(xPos[i], yPos[i]);

    // draw the thick stroke around the shape
    stroke(10, 141, 128);
    strokeWeight(6);
    noFill();
    rect(0, 0, objSize[i], objSize[i], 0, 50, 0, 50);

    // the light stroke, with a slight offset from the shape
    stroke(10, 141, 128);
    strokeWeight(1);
    noFill();
    rect(random(-60, 60), random(-60, 60), objSize[i]+random(60), objSize[i]+random(60), 0, 70, 0, 70);
    
    popMatrix();
  }
  
  noLoop();
}
