PImage offscr;
float x, y, x2, y2, x3, y3;
float R = 100;
int angle = 0;

float R2 = 20;
float rad = TWO_PI/30.0;
float theta2 = 0.0;

void setup() {
  size(800,800);
  smooth(8);
  background(0);
  colorMode(HSB, 360, 256, 256);
  offscr = createImage(width, height, RGB);
}
void draw() {
    
  updatePixels();
  
  float theta = radians(angle);
  
  float rrand = random(20, 100);
  
  x = R*cos(theta);
  y = -R*sin(theta);
  
  x2 = x*cos(theta2);
  y2 = -y*sin(theta);
  
  x3 = R2*cos(theta);
  y3 = -R2*sin(theta2);
  
  
  translate(x + width/2, y + height/4);
  //translate(width/2, height/2);

  float[] coordinatesX = {
    0, -(x+x2), x+x2, 0, x+x2+1, x3, x3+1, 0
  };

  float[] coordinatesY = {
    0, -(y-y2), -(y-y2), 0, -(y-y2)+1, -y3, -(y3-1), 0
  };
  
  float[] size = {
    2, 2, 2, 2
  };
    
  noStroke();
  //fill(255);
  //for(int i = 0; i < coordinatesX.length; i++) {
  //  ellipse(coordinatesX[i],coordinatesY[i], size[i], size[i]);
  //}
  
  //fill(60, 255, 255, 210); 
  //beginShape();
  //for (int i = 0; i < coordinatesX.length; i++) {
  //  vertex(coordinatesX[i],coordinatesY[i]);
  //}
  //endShape(CLOSE);
  
  fill(60, angle, 255, 80); 
  beginShape();
  for (int i = 0; i < coordinatesX.length; i++) {
    curveVertex(coordinatesX[i],coordinatesY[i]);
  }
  endShape(CLOSE);
    
  angle++;
  if(angle >= 360) angle = 0;
  
  theta2 += rad;
  if(theta2 >= TWO_PI) theta2 = 0.0;
  
}

void updatePixels(){
  //float rand = random(20, 30);
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  //tint(rand, 255, 255, 240);
  image(offscr, 0, 1, width, height);
}