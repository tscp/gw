PGraphics pg;
float bx1, by1, bx2, by2, cx1, cy1, cx2, cy2;
int size = 5;
float R = 100;
float R2 = width*2;
float theta, theta2 = 0;

void setup() {
  size(500,500);
  pg = createGraphics(500, 500);
  background(0);
  colorMode(HSB, 360, 256, 256);
}

void draw(){
  //noFill();
  rectMode(CORNER);
  R = R*sin(theta) - 100;
  
  cx1 = -R2*sin(theta2) + (width/2);
  cy1 = R2*cos(theta2) + (height/2);
  cx2 = R2*sin(theta2) + (width/2);
  cy2 = -R2*cos(theta2) + (height/2);
  bx1 = R*sin(theta) + 150;
  by1 = -R*cos(theta) + 150;
  bx2 = -R*sin(theta) + 350;
  by2 = R*cos(theta) + 350;
  
  pg.beginDraw();
  pg.fill(0,10);
  pg.rect(0, 0, width, height);
  pg.noStroke();
  pg.fill(abs(theta),256,256,60);
  pg.bezier(cx1, cy1, bx1, by1, bx2, by2, cx2, cy2);
  pg.endDraw();
  image(pg, 0, 0);
  
  strokeWeight(1);
  stroke(240, 80);
  noFill();
  bezier(cx1, cy1, bx1, by1, bx2, by2, cx2, cy2);
  line(cx1, cy1, bx1, by1);
  line(cx2, cy2, bx2, by2);
  
  noStroke();
  fill(255, 128);
  ellipse(bx1,by1,size,size);
  ellipse(bx2,by2,size,size);
  fill(255, 128);
  rectMode(CENTER);
  rect(cx1,cy1,size,size);
  rect(cx2,cy2,size,size);
  
  if (theta == 360) theta = 0;
  theta += .05;
  if (theta2 == 360) theta2 = 0;
  theta2 += .005;
  
}