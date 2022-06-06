int[] x = new int[23];
int[] y = new int[23];

int[] food = new int[2];

int scor;

int lungime = 4;
int direction = 3; // 0 - SUS, 1 - STANGA, 2 - JOS, 3 - DREAPTA
boolean keyPressedByUser = false;
int[] temporaryHead = new int[2];

void setup() {
  size(1020, 760, P2D);

  frameRate(3);
  textSize(20);
  
  scor = 0;
  
  for (int i=0; i<lungime; i++) {
    x[lungime-i-1] = 10+20*i;
    y[lungime-i-1] = 10;
  }
  generateFoodWithoutCollision();
}

void draw() {
  background(0);
  
  //stroke(255);
  //for(int i = 0; i<51;i++) {
  //  line(i*20, 0, i*20, height);
  //}
  
  //for(int i = 0; i<38;i++) {
  //  line(0, i*20, width, i*20);
  //}
  
  //stroke(0);
  
  //START MUTAT SARPE
  
  
  switch(direction) {
    case 0:
      temporaryHead[1] = y[0]-20;
      temporaryHead[0] = x[0];
      break;
    case 1:
      temporaryHead[0] = x[0]-20;
      temporaryHead[1] = y[0];
      break;
    case 2:
      temporaryHead[1] = y[0]+20;
      temporaryHead[0] = x[0];
      break;
    case 3:
      temporaryHead[0] = x[0]+20;
      temporaryHead[1] = y[0];
      break;
  }
  
  if(temporaryHead[1] < 0) { temporaryHead[1] = height - 10; }
  
  //VERIFICAM DACA AM AJUNS CU CAPUL PE MANCARE
  if(isCollision(temporaryHead[0],temporaryHead[1],food[0],food[1])) {
    generateFoodWithoutCollision();
    lungime+=1;
    scor+=1;
  }
  
  for (int i=lungime-2; i >= 0; i--) {
    x[i+1] = x[i];
    y[i+1] = y[i];
  }
  println(temporaryHead[0],temporaryHead[1]);
  x[0] = temporaryHead[0];
  y[0] = temporaryHead[1];

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
  
  fill(255,0,0);
  circle(food[0],food[1],20);
  //END DESENAT SARPE
  
  text(str(scor), 10, 20);
  keyPressedByUser = false;
}

void keyPressed() {
  if(keyPressedByUser) return;
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
  keyPressedByUser = true;
}

void generateFood() {
  int patrate_x = width/20;
  int patrate_y = height/20;
  
  int random_x = int(random(0,patrate_x));
  int random_y = int(random(0,patrate_y));
  
  food[0] = random_x*20 + 10;
  food[1] = random_y*20 + 10;
}

void generateFoodWithoutCollision() {
  boolean generateAgain = false;
  generateFood();
  for(int i = 0; i < lungime; i++) {
    if(isCollision(x[i],y[i], food[0], food[1])) {
      generateAgain = true;
      break;
    } 
  }
  
  while(generateAgain) {
    generateAgain = false;
    generateFood();
    for(int i = 0; i < lungime; i++) {
      if(isCollision(x[i],y[i], food[0], food[1])) {
        generateAgain = true;
        break;
      } 
    }
  }
  
}

boolean isCollision(int x1, int y1, int x2, int y2) {
  return (x1==x2) && (y1==y2);
}

//x: 70 50 30 10
//y: 10 10 10 10
