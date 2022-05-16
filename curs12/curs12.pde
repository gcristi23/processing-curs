
int[][] pozitii = new int[2][23];
int lungime;

void setup() {
  size(1024,768,P2D);
  frameRate(2);
  lungime = 4;
  for(int i=0; i<lungime; i++) {
    pozitii[0][lungime-i-1] = 10+i*20;
    pozitii[1][lungime-i-1] = 10;
  }
}


void draw() {
  background(0);
  for(int i=0; i<lungime; i++) {
    if(i==0) {
      fill(0,0,255);
    } else {
      fill(255,0,0);
    }
    circle(pozitii[0][i], pozitii[1][i],20);
    pozitii[0][i]+=20;
  }

}
