int[] X = new int[23];
int[] Y = new int[23];
int lungime = 5;

int foodX;
int foodY;

int score;

int temporaryHeadX;
int temporaryHeadY;

int direction = 3; //0 - sus, 1 - stanga, 2 - jos, 3 - dreapta
boolean isKeyPressed = false;

void setup() {
  size(1020, 760, P2D);
  frameRate(16);
  
  score = 0;
  textSize(25);

  for (int i=0; i<lungime; i++) {
    X[lungime-i-1] = 10+i*20;
    Y[lungime-i-1] = 10;
  }
  generateFoodWithoutCollision();
}


void draw() {
  background(0);

  //START MUTAT
  temporaryHeadX = X[0];
  temporaryHeadY = Y[0];
  
  switch(direction) {
  case 0:
    temporaryHeadY-=20;
    break;
  case 1:
    temporaryHeadX-=20;
    break;
  case 2:
    temporaryHeadY+=20;
    break;
  case 3:
    temporaryHeadX+=20;
    break;
  }
  
  //VERIFICAM DACA MANANCA CEVA
  if(isCollision(temporaryHeadX,temporaryHeadY,foodX,foodY)) {
    score+=1;
    lungime+=1;
    generateFoodWithoutCollision();
  }
  
  for (int i = lungime-2; i >= 0; i--) {
    X[i+1] = X[i];
    Y[i+1] = Y[i];
  }

  X[0] = temporaryHeadX;
  Y[0] = temporaryHeadY;
  
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
  
  fill(0,255,0);
  circle(foodX,foodY,20);
  
  
  text(str(score), 10, 25);
  //END DESEN
  isKeyPressed = false;
}

void generateFood() {
  int patrateX = width / 20;
  int patrateY = height / 20;
  
  int randomX = int(random(0,patrateX));
  int randomY = int(random(0,patrateY));
  
  println(randomX,randomY);
  
  foodX = randomX*20+10;
  foodY = randomY*20+10;
}

void generateFoodWithoutCollision() {
   boolean foodIsOnSnake = false;
   generateFood();
   
   for(int i=0; i < lungime; i++){
      if(isCollision(X[i],Y[i],foodX,foodY)) {
        foodIsOnSnake = true;
        break;
      }
   }
   
   while(foodIsOnSnake) {
     foodIsOnSnake = false;
     generateFood();
     for(int i=0; i < lungime; i++){
      if(isCollision(X[i],Y[i],foodX,foodY)) {
        foodIsOnSnake = true;
        break;
      }
     }
   }
}

boolean isCollision(int x1, int y1,int x2,int y2) {
  return (x1==x2) && (y1==y2);
}

void keyPressed() {
  if(isKeyPressed) return;
  //w - sus, a - stanga, s - jos, d - dreapta
  char myKey = key;
  if (myKey >= 'a' && myKey <= 'z') {
    myKey = (char) (myKey + 'A' - 'a');
  }

  switch(myKey) {
  case 'W':
    if(direction!=2)
      direction = 0;
    break;
  case 'A':
    if(direction!=3)
      direction = 1;
    break;
  case 'S':
    if(direction!=0)
      direction = 2;
    break;
  case 'D':
    if(direction!=1)
      direction = 3;
    break;
  }
  isKeyPressed = true;
}
