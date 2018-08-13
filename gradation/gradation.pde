color c, c1, c2, c3, c4;
int r = 0;
int block = 10;
int num;
int[] cx;
int[] cy;
int offsetX = 0;
int offsetY = 0;

void setup() {
  num = (width / block);
  cx = new int[num];
  cy = new int[num];
  background(255);
  size(800, 800);
  noStroke();
  rectMode(CENTER);
  frameRate(60);
  for(int i = 0; i < num; i++) {
    cx[i] = floor(map(i * block, 0, width, 0, 255));
    cy[i] = floor(map(i * block, 0, height, 0, 255));
  }
}

void draw() {
  
  r++;
  if(r > 180) r = 0;
  
  float theta = sin(radians(r));
  int c = floor(map(theta, 0, 1, 0, 255));
  
  for(int y = 0; y < height; y += block) {
    if(offsetY > cy.length-1) offsetY = 0;
    for(int x = 0; x < width; x += block) {
      if(offsetX > cx.length-1) offsetX = 0;
      fill(cx[offsetX], cy[offsetY], c);
      rect(x + block/2, y + block/2, block, block);      
      offsetX++;
    }
    offsetY++;
  }
  
  
  //cx = splice(cx, cx[0], cx.length);
  //cx = subset(cx, 1);
  //cy = splice(cy, cy[0], cy.length);
  //cy = subset(cy, 1);
  
}
