int[] x = new int[23];
int[] y = new int[23];

int[] food = new int[2];

int lungime = 22;
int direction = 3; // 0 - SUS, 1 - STANGA, 2 - JOS, 3 - DREAPTA

void setup() {
  size(1020, 760, P2D);

  frameRate(4);

  for (int i=0; i<lungime; i++) {
    x[lungime-i-1] = 10+20*i;
    y[lungime-i-1] = 10;
  }
}

void draw() {
  background(0);

  //START MUTAT SARPE
  for (int i=lungime-2; i >= 0; i--) {
    x[i+1] = x[i];
    y[i+1] = y[i];
  }

  switch(direction) {
    case 0:
      y[0]-=20;
      break;
    case 1:
      x[0]-=20;
      break;
    case 2:
      y[0]+=20;
      break;
    case 3:
      x[0]+=20;
      break;
  }
  //END MUTAT SARPE

  //START DESENAT SARPE
  for (int i=0; i<lungime; i++) {
    if (i == 0) {
      fill(#0DFAF4);
    } else {
      fill(#FA0DF7);
    }

    circle(x[i], y[i], 20);
  }
  //END DESENAT SARPE
}

void keyPressed() {
  char myKey = key;
  if (myKey >= 'a' && key <= 'z') {
    myKey = (char)(myKey + 'A' - 'a');
  }
  switch(myKey) {
    case 'W':
      if (direction!=2)
        direction = 0;
      break;
    case 'A':
      if (direction!=3)
        direction = 1;
      break;
    case 'S':
      if (direction!=0)
        direction = 2;
      break;
    case 'D':
      if (direction!=1)
        direction = 3;
      break;
  }
}

void generateFood() {
  
}


//x: 70 50 30 10
//y: 10 10 10 10
