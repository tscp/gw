float angle, angle1, angle2, angle3 = 0.0;
int x1, x2, y1, y2, r1, r2, c1, c2;
int pointCount;
int freq = 1;
float phi = 0;
int[] posX = {110, 320, 530};
int[] posY = {110, 320, 530};
int[] col1 = {10, 160, 320};
int[] col2 = {30, 190, 360};
int[] size1 = {100, 130, 120, 140, 130, 140, 100, 150, 120};
int[] size2 = {20, 40, 60, 50, 30, 60, 40, 70, 20};
int c = 0;

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
  angle1 += .07;
  angle2 += .03;
  angle3 += .05;
  
  for (int i = 0; i<posX.length; i++) {
    for (int j = 0; j<posX.length; j++) {
      angle = ((c % 2) == 0) ? angle3 : angle2;
      c++;
      c = (c == 9) ? c = 0 : c;       
      c1 = floor(map(180*sin(angle), -180, 180, col1[i], col2[j]));
      c2 = floor(map(180*cos(angle), -180, 180, col2[i], col2[j]));
      y1 = floor(map(180*sin(angle1), -180, 180, 120, 180));
      y2 = floor(map(180*cos(angle2), -180, 180, 10, 100));
      x1 = floor(map(180*sin(angle2), -180, 180, size2[c], 100));
      x2 = floor(map(180*cos(angle), -180, 180, size1[c], 200));
      r1 = floor(map(180*cos(angle2), -180, 180, 2, 18));
      fill(c2, x1, x2);
      rect(posX[i], posY[j], x2, x2, 12);
      fill(c1, y1, x2);
      rect(posX[i], posY[j], x1, x1, r1);
    }
  }
}
