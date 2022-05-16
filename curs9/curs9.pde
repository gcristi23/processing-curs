int[] x = new int[23];
int[] y = new int[23];
 
int lungime = 4;

void setup() {
  size(1024, 768, P2D);
  
  frameRate(2);
   
  for(int i=0; i<lungime; i++) {
    x[lungime-i-1] = 10+20*i;
    y[lungime-i-1] = 10;
  }
}

void draw() {
  background(0);
  for(int i=0; i<lungime; i++) {
    circle(x[i], y[i], 20);
    //x[i]+=20;
  }
}


//x: 70 50 30 10
//y: 10 10 10 10
