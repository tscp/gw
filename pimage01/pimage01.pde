PImage[] image;
PImage[] s_image;
int x, y, p = 0;
String[] url = {
  "https://scontent-nrt1-1.cdninstagram.com/t51.2885-15/e35/18812743_845045872337145_7002396632222269440_n.jpg",
  "https://scontent-nrt1-1.cdninstagram.com/t51.2885-15/e35/18443600_1894334250780526_7340401813864054784_n.jpg",
  "https://scontent-nrt1-1.cdninstagram.com/t51.2885-15/e35/18252717_434944246876313_1121183221002797056_n.jpg",
  "https://scontent-nrt1-1.cdninstagram.com/t51.2885-15/e35/18251589_126662744550506_3003793817791889408_n.jpg"
};

void setup() {
  size(1080, 1080);
  image = new PImage[url.length];
  s_image = new PImage[url.length];
  
  for(int i = 0; i < url.length; i++) {
    image[i] = loadImage(url[i], "jpg");
    s_image[i] = loadImage(url[i], "jpg");
  }
  
  background(0);
  noStroke();
}

void draw() {
  
  background(0);
  noStroke();
  
  if(x < width) {
    x++;
  } else {
    x = 0;
  }
  
  float theta = sin(radians(x));
  float m = map(theta, -1, 1, 0, width);  
  int xpx = floor(m);
  
  if(m == 0.0) {
    p++;
    if(p > url.length-1) p = 0;
  }
  for(int i = 0; i < height; i++) {
    color c = image[p].get(xpx, i);
    fill(c);
    rect(0, i, width, 1);
  }
  
  image(s_image[p], width-120, height-120, 100, 100);
  int tx = floor(map(xpx, 0, width, width-120, width-20));
  stroke(255);
  line(tx, height-20, tx, height-120);

}