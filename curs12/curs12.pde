int[] X = new int[23];
int[] Y = new int[23];
int lungime = 20;

int direction = 3; //0 - sus, 1 - stanga, 2 - jos, 3 - dreapta

void setup() {
  size(1024, 768, P2D);
  frameRate(20);

  for (int i=0; i<lungime; i++) {
    X[lungime-i-1] = 10+i*20;
    Y[lungime-i-1] = 10;
  }
}


void draw() {
  background(0);

  //START MUTAT
  for (int i = lungime-2; i >= 0; i--) {
    X[i+1] = X[i];
    Y[i+1] = Y[i];
  }

  switch(direction) {
  case 0:
    Y[0]-=20;
    break;
  case 1:
    X[0]-=20;
    break;
  case 2:
    Y[0]+=20;
    break;
  case 3:
    X[0]+=20;
    break;
  }
  //END MUTAT

  //START DESEN
  for (int i=0; i<lungime; i++) {
    if (i==0) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    circle(X[i], Y[i], 20);
  }
  //END DESEN
}

void keyPressed() {
  //w - sus, a - stanga, s - jos, d - dreapta
  char myKey = key;
  if (myKey >= 'a' && myKey <= 'z') {
    myKey = (char) (myKey + 'A' - 'a');
  }

  switch(myKey) {
  case 'W':
    direction = 0;
    break;
  case 'A':
    direction = 1;
    break;
  case 'S':
    direction = 2;
    break;
  case 'D':
    direction = 3;
    break;
  }
}
