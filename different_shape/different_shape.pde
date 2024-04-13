PShape svg;

void setup() {
  size(600, 336);
  svg = loadShape("shape-leaf.svg");
  svg.disableStyle(); //<>//
}

void draw() {
  background(200,200,100);
  shape(svg,0,0,300,300); //<>//
  
  noLoop();
}
