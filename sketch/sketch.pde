float[] coordinatesX = {
  0,14,47,23,29,0,-29,-23,-47,-14
};

float[] coordinatesY = {
  -50,-20,-15,7,40,25,40,7,-15,-20
};

PImage offscr;
float x, y;
float R = 100;
int angle = 0;

void setup() {
  size(800,800);
  smooth();
  background(0);
  colorMode(HSB, 360, 256, 256);
  noStroke();
  offscr = createImage(width, height, RGB);
}
void draw() {
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  
  float rand = random(0, 90);
  //tint(rand, 255, 255, 10);
  image(offscr, -10, 0, width, height);
  float theta = radians(angle);
  
  x = R*cos(theta);
  y = R*sin(theta);
  
  translate(x + width/2, y + height/2);

  fill(rand, 255, 255, 51);
  
  beginShape();
  for (int i = 0; i < coordinatesX.length; i++) {
    vertex(coordinatesX[i],coordinatesY[i]);
  }
  endShape(CLOSE);
  
  angle++;
  if(angle >= 360) angle = 0;
}