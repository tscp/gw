float angle1, angle2 = 0.0;
int x1, x2, y1, y2, r1, r2, c1, c2;
int pointCount;
int freq = 1;
float phi = 0;

void setup() {
  size(640, 640, OPENGL);
  //noCursor();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth();
  frameRate(60);
}

void draw() {
  background(360);
  rectMode(CENTER);
  angle1 += .08;
  angle2 += .04;
  
  //c1 = floor(map(mouseX, 0, width, 0, 360));
  //c2 = floor(map(mouseY, 0, height, 0, 360));
  
  y1 = floor(map(180*sin(angle1), -180, 180, 120, 180));
  y2 = floor(map(180*cos(angle2), -180, 180, 10, 100));
  x1 = floor(map(180*sin(angle1), -180, 180, 190, 210));
  x2 = floor(map(180*cos(angle2), -180, 180, 120, 160));
  r1 = floor(map(180*cos(angle2), -180, 180, 2, 18));
  r2 = floor(map(180*sin(angle2), -180, 180, 4, 36));
  
  fill(x1, y1, x2);
  rect(320, 320, x1, x1, r1);
  
  fill(y2, x1, x2);
  rect(320, 320, x2, x2, 12);
  
}
