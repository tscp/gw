// Base -> https://www.youtube.com/watch?v=IKB1hWWedMk

int cols, rows;
int scl = 12;
int w = 2000;
int h = 1600;
float flying = 0;
float[][] terrain;
color c;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  smooth();
}

void draw() {
  
  color c1 = color(0, 160, 240, 255);
  color c2 = color(240, 255, 200, 80);
  noStroke();
  for(float h = 0; h < height; h += 10){
    color c = lerpColor(c1, c2, h / height);
    fill(c);
    rect(0, h, width, 10);
  }
  

  flying -= 0.05;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -80, 80);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  noStroke();  
  translate(width/2, height/4);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  for (int y = 0; y < rows-1; y++) {
    
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      c = lerpColor(20, floor(map(terrain[x][y], 0, 60, 88, 168)), x);
      fill(c, c+y, c+y, 128);
      vertex(x*scl, y*scl, terrain[x][y]);
      c = lerpColor(20, floor(map(terrain[x][y+1], 0, 60, 108, 148)), x);
      fill(c, c+x, c+y, 128);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
    
  }
    
}
