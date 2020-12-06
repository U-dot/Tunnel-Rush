int z = 0, page = 1, theta=1;
int distanceTunnel = 100;
int sidesTunnel = 8; //Números de lados del polígono
int playerRadius; //Radio de movimiento de los jugadores
int playerSize = 10;
int lengthTunnel = 20;
int controlsPosX = 0, controlsPosY = 0;
int numberControls = 8;
int[] controls = new int[numberControls];
int mode = 0;
float difTunnelPVP;
PFont font;
ArrayList<Obstacle> obstacles;
Player P1, P2;

void setup() {
  size(500,500, P3D);
  textAlign(CENTER);
  rectMode(CENTER);
  playerRadius = height/10;
  difTunnelPVP=width/4;
  obstacles = new ArrayList<Obstacle>();
  P1 = new Player(playerRadius, 0,color(50,200,150));
  P2 = new Player(playerRadius, PI,color(200,50,150));
  font = createFont("data-latin.ttf", width/18);
}

void draw() {
  background(20);
  pageSelector();
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  
}

void keyPressed() {
  if (page != 2) {
    if (keyCode == ENTER) {
      page++;
      if (page > 3) {
        page = 2;
      }
      if (page == 2) {
        resetGame();
      }
    }
    if (key == 'h' || key == 'H') {
      page = 5;
    }
    if (key == 'c' || key == 'C') {
      page = 6;
    }
  }
  if (keyPressed && key == CODED) {
    if (page == 6) {
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
    victoryPage();
    break;
  case 5:
    helpPage();
    break;
  case 6:
    controlPage();
    break;
  }
}

void introPage() {drawTunnel();
  textFont(font);
  int numberLines = 11;
  text("TUNNEL RUSH", width/2, height/3);
  text("PRESS ENTER TO PLAY", width/2, height*8/numberLines);
  text("Press H to go to HELP", width/2, height*9/numberLines);
  text("Press C to go to Controls", width/2, height*10/numberLines);
}

void gamePage() {
  drawTunnel();
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  push();
  P1.drawP();
  P1.keyPressed1();
  pop();
  if(mode!=0){
    push();
    P2.drawP();
    P2.Mouse();
    pop();
  }
  if (obstacles.size() > 0) {
    colisiones(obstacles.get(0), P1);
    if(mode==1){colisiones(obstacles.get(0), P2);}
    if ((z - obstacles.get(0).posZ*distanceTunnel)%100 == obstacles.get(0).deepness + 1){
      if(z - obstacles.get(0).posZ*distanceTunnel >= 299) {
        obstacles.remove(0);
      }
    }
  }
  if (z > (lengthTunnel+4)*distanceTunnel) {
    page = 4;
  }
  z++;
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      //difTunnelPVP++;
      theta++;
    } else if (keyCode == RIGHT) {
      //difTunnelPVP--;
      theta--;
    } else if (keyCode == CONTROL) {
      z += 3;
    }
    println(difTunnelPVP,theta);
  }
}

void gameOverPage() {
  background(0);
  //Toca cambiar esto de acuerdo al modo
  drawTunnel();
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  textSize(width/18);
  text("GAME OVER", width/2, height/2, z);
}

void helpPage() {
  text("HELP", width/2, height/4);
  text("Press ENTER to play", width/2, height*2/4);
  text("Press C to change controls", width/2, height*3/4);
}

void victoryPage() {
  int numberLines = 10;
  text("WON GAME", width/2, height/numberLines);
  text("Distance", width/3, height*2/numberLines);
  text(lengthTunnel, width*2/3, height*2/numberLines);
  text("Press ENTER to play", width/2, height*3/numberLines);
  text("Press C to change controls", width/2, height*4/numberLines);
}

void controlPage() {
  if (controlsPosY < 0) {
    controlsPosY = numberControls - 1;
  } else if (controlsPosY >= numberControls) {
    controlsPosY = 0;
  } else if (controls[0] < 0 || controls[0] > 100) {
    controls[0] = 0;
  } else if (controls[1] > 1) {
    controls[1] = 0;
  } else if (controls[1] < 0) {
    controls[1] = 1;
  }
  for (int i = 2; i < numberControls; i++) {
    if (controls[i] > 16) {
      controls[i] = 0;
    }
    if (controls[i] < 0) {
      controls[i] = 16;
    }
  }
  stroke(255);
  int numberLines = 10;
  float rectWidth = width/13, rectHeight = height/40;
  stroke(255);
  text("Game controls stack", width/2, height/numberLines);
  text("Distance:", width/3, height*3/numberLines);
  text(lengthTunnel+"m", width*2/3, height*3/numberLines);
  String modesStr[] = {"1 Player", "2 PLayers", "PVP"};
  text("Mode:", width/3, height*4/numberLines);
  text(modesStr[mode], width*2/3, height*4/numberLines);
  text("Color P1", width/3, height*5/numberLines);
  push();
  fill(red(P1.c), 0, 0);
  rect(width*2/3, height*5/numberLines - rectHeight, rectWidth, rectHeight);
  fill(0, green(P1.c), 0);
  rect(width*2/3, height*5/numberLines, rectWidth, rectHeight);
  fill(0, 0, blue(P1.c));
  rect(width*2/3, height*5/numberLines + rectHeight, rectWidth, rectHeight);
  fill(P1.c);
  rect(width*2.5/3, height*5/numberLines, rectWidth, rectHeight*3);
  pop();
  text("Color P2", width/3, height*6/numberLines);
  push();
  fill(red(P2.c), 0, 0);
  rect(width*2/3, height*6/numberLines - rectHeight, rectWidth, rectHeight);
  fill(0, green(P2.c), 0);
  rect(width*2/3, height*6/numberLines, rectWidth, rectHeight);
  fill(0, 0, blue(P2.c));
  rect(width*2/3, height*6/numberLines + rectHeight, rectWidth, rectHeight);
  fill(P2.c);
  rect(width*2.5/3, height*6/numberLines, rectWidth, rectHeight*3);
  pop();
  float lineH = controlsPosY+3;
  if (controlsPosY > 1) {
    //lineH =  +
    println(((controlsPosY+1)%3),((controlsPosY+1)%3)*rectHeight);
  }
  if(controlsPosY<=1){
    line(width*2/3-10, height/numberLines*(controlsPosY+3)+5, 
         width*2/3+10, height/numberLines*(controlsPosY+3)+5);
  }else{
    line(width*2/3-10, height/numberLines*(int((controlsPosY+1)/3)+4)+((controlsPosY+1)%3-1)*rectHeight+5, 
         width*2/3+10, height/numberLines*(int((controlsPosY+1)/3)+4)+((controlsPosY+1)%3-1)*rectHeight+5);
  }

  text("Press ENTER to play", width/2, height*8/numberLines);
  text("Press H to go to HELP", width/2, height*9/numberLines);
  lengthTunnel = controls[0]*10;
  mode = controls[1];
  P1.c = color(controls[2]*15, controls[3]*15, controls[4]*15);
  P2.c = color(controls[5]*15, controls[6]*15, controls[7]*15);
}

void resetGame() {
  z = 0;
  P1 = new Player(playerRadius, 0, P1.c);
  P2 = new Player(playerRadius, PI, P2.c);
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
  controlsPosX = 0;
  controlsPosY = 0;
  controls[0] = lengthTunnel/5;
  controls[1] = mode;
  controls[2] = int((P1.c >> 16 & 0xFF)/15);
  controls[3] = int((P1.c >> 8 & 0xFF)/15);
  controls[4] = int((P1.c & 0xFF)/15);
  controls[5] = int((P2.c >> 16 & 0xFF)/15);
  controls[6] = int((P2.c >> 8 & 0xFF)/15);
  controls[7] = int((P2.c & 0xFF)/15);
}
