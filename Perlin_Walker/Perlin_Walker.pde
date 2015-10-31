
int numWalkers=100;

Walker [] w = new Walker[numWalkers]; // array of walker objects

void setup() {
  size (1280, 720);
  
  //initialize walker objects with random seed
  for(int i=0; i < w.length; i++){
   w[i] = new Walker(random(1000),(random(width)),height/2);
  }

  background(255);
}

void draw () {
  fill(255,2);
  rect(0,0,width,height);
  
  //increment and display all walkers in array
    for(int i=0; i<numWalkers; i++){

    w[i].display();
      w[i].step();
  }

}

class Walker  {
    float x,y;
    float tx, ty;
    
  //constructor
  Walker(float s,float startX,float startY) {
    float seed = s;
    x =startX;
    y =startY;
    tx = 1*seed;
    ty = 50*seed;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    point(x, y);
  }

  void step () {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);

    tx += 0.005;
    ty += 0.005;
  }
}