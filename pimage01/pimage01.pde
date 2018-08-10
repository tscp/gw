PImage[] image;
PImage[] s_image;
PImage offscr;
int x, y, p = 0;
String[] url = {
  "https://scontent-nrt1-1.cdninstagram.com/vp/2928cadac7c3db7cb64cf912e61e9ab1/5BED1C86/t51.2885-15/e35/18251589_126662744550506_3003793817791889408_n.jpg?se=7",
  "https://scontent-nrt1-1.cdninstagram.com/vp/6b8927dd9a1b4d0a6884d33a0a5c2985/5C04C887/t51.2885-15/e35/18252717_434944246876313_1121183221002797056_n.jpg?se=7",
  "https://scontent-nrt1-1.cdninstagram.com/vp/b41ba97cbed5c6c872e82512c421ebf4/5C11E16D/t51.2885-15/e35/18443600_1894334250780526_7340401813864054784_n.jpg?se=7",
  "https://scontent-nrt1-1.cdninstagram.com/vp/847a46db30a16bac3827c9e6dac7f920/5C00AF11/t51.2885-15/e35/18160453_201567427026239_8568549528926420992_n.jpg?se=7"
};

void setup() {
  size(1080, 1080);
  offscr = createImage(width, height, RGB);
  image = new PImage[url.length];
  s_image = new PImage[url.length];
  
  for(int i = 0; i < url.length; i++) {
    image[i] = loadImage(url[i], "jpg");
    s_image[i] = loadImage(url[i], "jpg");
  }
}

void draw() {
  
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  
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
  
  int p = floor(mouseY % 4);
  
  //if(m == 0.0) {
  //  p++;
  //  if(p > url.length-1) p = 0;
  //}
  
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

void updatePixels(){
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  tint(255,40);
  image(offscr, 0, 0, width, height);
}
