import processing.video.*;

Capture camera;
int d = 9;
int boxSize = 90;

void setup() {
  size(1280, 810);
  background(0);
  noStroke();
  frameRate(60);
  smooth();
  rectMode(CENTER);
  camera = new Capture(this, width/8, height/8, 60);
  camera.start();
}

void draw() {
  
  background(0);
  camera.loadPixels();
  
  //for(int y = d / 2; y < height; y += d) {
  //  for(int x = d / 2; x < width; x += d) {
  //    fill(camera.pixels[y * width + x]);
  //    ellipse(x, y, 4, 4);
  //  }
  //}
   
  
  for (int j = 0; j < d ; j++) {
    for (int i = 0; i < d ; i++) {
      //image(camera, i*width/d, j*height/d);
      PImage img = camera.get(i*10+30, j*5+10, 100, 100);
      //PImage img = camera.get(i*10+320, j*10+320, 100, 100); // 取得する座標
      img.resize(200, 200);
      image(img, i*boxSize+235, j*boxSize);
    }
  }
  
  //filter(BLUR,1.8);
  //filter(THRESHOLD,0.5);
  
  image(camera, width-boxSize-100, height-boxSize-50);
  

}

void captureEvent(Capture camera) {
  camera.read();
}
