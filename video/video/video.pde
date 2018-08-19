import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture camera;
OpenCV opencv;

int d = 9;
int boxSize = 90;
int x, y, w, h;

void setup() {
  size(1280, 810);
  background(0);
  noStroke();
  frameRate(60);
  smooth();
  //rectMode(CENTER);
  camera = new Capture(this, width/4, height/4, 60);
  opencv = new OpenCV(this, width/4, height/4);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  camera.start();
}

void draw() {
  background(0);
  camera.loadPixels();
  opencv.loadImage(camera);
  //image(camera, 0, 0);
  //stroke(0, 255, 0);
  //strokeWeight(3);
  
  Rectangle[] faces = opencv.detect();
  
  for (int i = 0; i < faces.length; i++) {
    x = floor(faces[i].x);
    y = floor(faces[i].y);
    w = floor(faces[i].width);
    h = floor(faces[i].height);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  
  for (int j = 0; j < d; j++) {
    for (int i = 0; i < d; i++) {
      int di = ceil(map(i, 0, d, -d/2, d/2));
      int dj = ceil(map(j, 0, d, -d/2, d/2));
      PImage img = camera.get(x+di*18, y+dj*16, 180, 180);
      image(img, i*boxSize+(width/2-boxSize*d/2), j*boxSize);
    }
   }
   
   fill(0);
   rect(width/2+d/2*boxSize+boxSize/2, 0, width/2-d*boxSize/2, height);
  
  //image(camera, width-boxSize-100, height-boxSize-50);
  

}

void captureEvent(Capture camera) {
  camera.read();
}
