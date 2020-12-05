ArrayList<Obstacle> obstacles;
Player P1, P2;
int z = 0, page = 1, theta=1;
int distanceTunnel = 100;
int npolygon = 8; //Números de lados del polígono
int playerRadius; //Radio de movimiento de los jugadores
int playerSize=10;
int lengthTunnel = 20;//Múltiplo de 5
int controlsPosX=0,controlsPosY=0;
int numberControls=2;
int[] controls=new int[4];
int mode=0;
PFont font;


void setup() {
  size(500, 500, P3D);
  textAlign(CENTER);
  playerRadius=height/10;
  obstacles = new ArrayList<Obstacle>();
  P1=new Player(playerRadius,0);
  P2 = new Player(playerRadius,PI);
  font = createFont("data-latin.ttf", width/20);
  resetGame();
}

void draw() {
  background(20);
  pageSelector();
}
void keyPressed(){
  if(page!=3){
    if(keyCode == ENTER) {
      page++;
      print("page",page);
      if(page>3){page=3;}
      if(page==3){resetGame();}
    }
    if(key=='h'||key=='H'){page=4;}
    if(key=='c'||key=='C'){page=5;}
  }
  if (keyPressed && key == CODED) {

    if(page==5){
      if (keyCode == RIGHT) {
        controls[controlsPosY]++;
      } else if (keyCode == LEFT) {
        controls[controlsPosY]--;
      } else if (keyCode == DOWN) {
        controlsPosY++;
      } else if (keyCode == UP) {
        controlsPosY--;
      }
    }
  }

}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    introPage();
    break;
  case 2:
    gamePage();
    break;
  case 3:
    gameOverPage();
    break;
  case 4:
    helpPage();
    break;
  case 5:
    controlPage();
    break;
  }
}

void introPage() {
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  drawTunnel(1);
  textFont(font);
  int numberLines=10+1;
  text("TUNNEL RUSH", width/2, height/3);

  text("PRESS ENTER TO PLAY", width/2, height*8/numberLines);
  text("Press H to go to HELP",width/2,height*9/numberLines);
  text("Press C to go to Controls",width/2,height*10/numberLines);
}

void gamePage() {
  drawTunnel(1);
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  P1.drawP();
  P1.keyPressed1();
  P2.drawP();
  P2.Mouse();
  z++;
  if (obstacles.size() > 0) {
    colisiones(obstacles.get(0), P1);
    colisiones(obstacles.get(0), P2);
    if ((z-obstacles.get(0).posZ*distanceTunnel)%100 == obstacles.get(0).deepness+1 && z-obstacles.get(0).posZ*distanceTunnel >= 299) {
      obstacles.remove(0);
    }
  }
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      theta += 2;
    } else if (keyCode == RIGHT) {
      theta -= 2;
    } else if (keyCode == ALT) {
      z -= 3;
    } else if (keyCode == CONTROL) {
      z += 3;
    }
  }
}

void gameOverPage() {
  push();
  text("GAME OVER",width/2,height/2);
  pop();
}

void helpPage() {

  text("HELP", width/2, height/4);
  text("Press ENTER to play",width/2,height*2/4);
  text("Press C to change controls",width/2,height*3/4);
}

void controlPage(){
  println(mode);
  if(controlsPosY<0){controlsPosY=numberControls-1;}
  else if(controlsPosY>=numberControls){controlsPosY=0;}
  else if(controls[0]<0||controls[0]>1000){controls[0]=0;}
  else if(controls[1]>2){controls[1]=0;}
  else if(controls[1]<0){controls[1]=2;}
  int numberLines=7+1;
  stroke(255);
  line(width*2/3-10,height/numberLines*(controlsPosY+3)+5,
       width*2/3+10,height/numberLines*(controlsPosY+3)+5);
  text("Game controls stack",width/2,height/numberLines);

  text("Distance:",width/3,height*3/numberLines);
  text(lengthTunnel+"m",width*2/3,height*3/numberLines);

  String modesStr[]={"1 Player", "2 PLayers", "PVP"};
  text("Mode:",width/3,  height*4/numberLines);
  text(modesStr[mode],width*2/3,height*4/numberLines);

  text("Press ENTER to play",width/2,height*6/numberLines);
  text("Press H to go to HELP",width/2,height*7/numberLines);
  println(controlsPosY,mode);

  lengthTunnel=controls[0]*10;
  mode=controls[1];
}

void resetGame() {
  z = 0;
  P1 = new Player(playerRadius, 0);
  P2 = new Player(playerRadius, PI);
  obstacles= new ArrayList<Obstacle>();
  int typePoly = 0;
  int numberPoly = 0;
  float angle = 0;
  for (int i = 0; i < lengthTunnel/2; i++) {
    typePoly = int(random(3, 5));
    numberPoly = int(random(1, 5));
    angle = random(TWO_PI);
    obstacles.add(new Obstacle(i*2, angle, typePoly, numberPoly));
  }
  controlsPosX=0;controlsPosY=0;
  controls[0]=lengthTunnel/5;
  controls[1]=mode;

}
