PImage offscr;
float x, y, x2, y2, x3, y3;
float R = 100;
int angle = 0;

float R2 = 20;
float rad = TWO_PI/30.0;
float theta2 = 0.0;

final int sec=2;
boolean waiting=true;

void setup() {
  size(800,800, OPENGL);
  smooth(20);
  background(0);
  colorMode(HSB, 360, 255, 255);
  offscr = createImage(width, height, RGB);
}
void draw() {
  //background(0);
  updatePixels();
  
  float theta = radians(angle);
  //float rand = random(0, PI);
  float rand = 90*sin(theta);
   
  x = R*cos(theta)+rand;
  y = -R*sin(theta)-rand;
  
  x2 = x*cos(theta2)+rand;
  y2 = -y*sin(theta2)+rand;
  
  x3 = R2*cos(theta2)+rand;
  y3 = -R2*sin(theta)-rand;
  
  translate(x + width/2, y + height/2);
  //translate(width/2, height/2);

  float[] coordinatesX = {
    0, -x-x2, x+x, 0, x, x2, x+x2, 0,
    0, x2*2, x, x2*2, 0
  };

  float[] coordinatesY = {
    0, -y-y2, -(y-y), 0, -(y-y), -y2, -(y2-1), 0,
    0, y2*2, -y, -y2*2, 0
  };
    
  noStroke();  
  
  //float amount = map(y, 30, angle, 0, 360);
  //coswave[i] = abs(cos(amount));
  
  //fill(90, map(sin(theta), 0, PI, 120, 280), 255, 20); 
  //beginShape();
  //vertex(0, 0);
  //for (int i = 5; i < coordinatesX.length; i++) {
  //  curveVertex(coordinatesX[i],coordinatesY[i]);
  //}
  //endShape(CLOSE);
  
  //fill(60, map(sin(theta2), 0, PI, 120, 280), 255, 40); 
  //beginShape();
  //vertex(0, 0);
  //for (int i = 0; i < coordinatesX.length-5; i++) {
  //  curveVertex(coordinatesX[i],coordinatesY[i]);
  //}
  //endShape(CLOSE);
  
  int randX = int(random(0, coordinatesX.length));
  int randY = int(random(0, coordinatesY.length));
  
  stroke(70, map(sin(theta2), 0, PI, 0, 360), 255, 100);
  fill(30, 320, 255, map(sin(theta2), 0, PI, 0, 100));
  //line(
  //  coordinatesX[randX],
  //  coordinatesY[randX],
  //  coordinatesX[randY],
  //  coordinatesY[randY]
  //);
    
  bezier(
    coordinatesX[1],coordinatesY[2],
    coordinatesX[3],coordinatesY[4],
    coordinatesX[3],coordinatesY[4],
    coordinatesX[5],coordinatesY[6]
  );
  
  if(waiting && millis()<sec*1000){
    return;
  }
  waiting=false;
  
  angle += 1;
  if(angle >= 360) angle = 0;
  
  theta2 += rad;
  if(theta2 >= TWO_PI) theta2 = 20;
  
}

void updatePixels(){
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  image(offscr, -5, 0, width, height);
  //tint(map(rad, 0, PI, 0, 360), 255, 255, 240);
}
