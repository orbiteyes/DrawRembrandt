
PImage rem;
float [] r, g, b;
int total;


void setup() {
  //size of the sketch and the Image are the same in this example
  size(800, 1000);
  smooth(8); 

  //load up an image
  rem = loadImage("Rembrandt.jpg");
  //get the total number of pixels
  total = rem.height * rem.width;
  //initialize the arrays for the red, green, and blue values of the image
  r = new float [total];
  g = new float [total];
  b = new float [total];

  //not needed in this example...but important for other pixel operations
  //rem.loadPixels();
  for (int y = 0; y<rem.height; y++) {
    for (int x = 0; x<rem.width; x++) {
      
      //loc is going to tell the arrays which pixel they are looking at
      int loc = x + y*width;
      
      //load up all of the RGB values of the image
      r[loc] = red(rem.pixels[loc]);
      g[loc] = green(rem.pixels[loc]);
      b[loc] = blue(rem.pixels[loc]);
    }
  }
}



void draw () {

  //get the pixel number for the mouse location
  //this will be the index# for the RGB values in the array 
  int dColor = mouseX + mouseY*width;

  //exact same drawing lines as the frist example
  //but the color of the lines is loaded from the hidden image
  if (keyPressed) {

    
    if (key == '1') {
      for(int i = 0; i < 10; i++) {
      stroke(r[dColor], g[dColor], b[dColor]);
      strokeWeight(1);
      line(mouseX, mouseY, mouseX+random(-10, 10), mouseY+random(-10, 10));
      }
    }

    if (key == '2') {
      float rad = random(35);
      noStroke();
      fill(r[dColor], g[dColor], b[dColor], 125);
      ellipse(mouseX, mouseY,rad, rad);
    }
    
    if (key == '3') {
      float rad2 = random(35, 125);
      noStroke();
      fill(r[dColor], g[dColor], b[dColor], 125);
      ellipse(mouseX, mouseY,rad2, rad2);
    }
    

    if (key == '4') {
      stroke(r[dColor], g[dColor], b[dColor], 200);
      strokeWeight(5);
      line(mouseX, mouseY, mouseX+random(-100), mouseY);
    }

    if (key == '5') {
      float rad3 = random(25, 100);
      noStroke();
      fill(205);
      ellipse(mouseX, mouseY,rad3, rad3);
    }
    
     if (key == '7') {
      stroke(r[dColor], g[dColor], b[dColor], 200);
      strokeWeight(1);
      line(mouseX, mouseY, mouseX, mouseY+random(-100));
    }
    
    //if you want to see the hidden image that you are getting the colors from
    if(key == '7') {
     image(rem, 0, 0); 
    }
  }
  
  
}
