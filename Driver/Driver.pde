/**
 *Tunnel Rush game
 *@author: María Sol Botello
 *@author: Juan Jose Figueroa
 *More info on https://github.com/U-dot/Tunnel-Rush
 */

//Global variables
int z = 0, page = 1, theta = 1;
int distanceTunnel = 100;//Distance within each polygon of the tunnel
int sidesTunnel = 8; //Number of sides of the tunnel
int playerRadius; //Player movement ratio
int playerSize = 10;
int lengthTunnel = 20;
int controlsPosX = 0, controlsPosY = 0;//pos for controls page
int numberControls = 8;//Number of controls in controls page
int[] controls = new int[numberControls];
int mode = 0;// Game mode 0=1player or 1=2players
PFont font;
ArrayList<Obstacle> obstacles;
Player P1, P2;

void setup() {
  size(500, 500, P3D);
  textAlign(CENTER);
  rectMode(CENTER);
  playerRadius = height/10;
  obstacles = new ArrayList<Obstacle>();
  P1 = new Player(playerRadius, 0, color(150,200,100));
  P2 = new Player(playerRadius, PI, color(100,150,200));
  resetGame();
  font = createFont("data-latin.ttf", width/18);
  textFont(font);
  fill(255);
}

void draw() {
  background(0);
  pageSelector();
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
    if (key == 'i' || key == 'I') {
      page = 5;
    }
    if (key == 's' || key == 'S') {
      page = 6;
    }
  }
  if (keyPressed) {
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

/**
 *Select actual page
 */
void pageSelector() {
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

void introPage() {
  drawTunnel();
  text("TUNNEL RUSH", width/2, height/3);
  text("PRESS ENTER TO PLAY", width/2, height*8/11);
  text("Press I to go to instructions", width/2, height*9/11);
  text("Press S to go to settings", width/2, height*10/11);
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
  if (mode != 0) {
    push();
    P2.drawP();
    P2.Mouse();
    pop();
  }
  if (obstacles.size() > 0) {
    wreck(obstacles.get(0), P1);
    if (mode == 1) {
      wreck(obstacles.get(0), P2);
    }
    if ((z - obstacles.get(0).posZ*distanceTunnel)%100 >= obstacles.get(0).deepness + 1) {
      if (z - obstacles.get(0).posZ*distanceTunnel > 299) {
        obstacles.remove(0);
      }
    }
  }
  if (z > (lengthTunnel+4)*distanceTunnel) {
    page = 4;//victory page
  }
  z += 6;//Pos in z
  if (keyPressed) {
    if (keyCode == LEFT) {
      theta++;
    } else if (keyCode == RIGHT) {
      //difTunnelPVP--;
      theta--;
    } else if (key == 32) {
      z -= 5;
    }
  }
}

void gameOverPage() {
  background(0);
  drawTunnel();
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  text("GAME OVER", width/2, height/2+10, 60);
}

void helpPage() {
  text("Instructructions", width/2, height/4);
  text("Player 1: left/right arrows \nPlayer 2: mouse buttons."
        +" \nGo through the tunnel without"
        +"\ncrashing into any obstacle.\n Happy gaming :3",
    width/2, height*2/4-60);
  text("Press ENTER to play", width/2, height*3/4+60);
  text("Press S to go to Settings", width/2, height-40);
}

void victoryPage() {
  text("VICTORY", width/2, height/10);
  text("Distance", width/3, height*2/10);
  text(lengthTunnel, width*2/3, height*2/10);
  text("Number of players", width/3, height*3/10);
  text(controls[1]+1, width*2/3, height*3/10);
  text("Thanks for playing", width/2, height*5/10);
  text("Press ENTER to play", width/2, height*7/10);
  text("Press S to go to settings", width/2, height*8/10);
  text("Press I to go to instructions", width/2, height*9/10);
}

void controlPage() {
  //Stops variables from being out of bounds
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

  //Just text and graphs
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
  if (controlsPosY <= 1) {
    line(width*2/3-10, height/numberLines*(controlsPosY+3)+5,
      width*2/3+10, height/numberLines*(controlsPosY+3)+5);
  } else {
    line(width*2/3-10, height/numberLines*(int((controlsPosY+1)/3)+4)+((controlsPosY+1)%3-1)*rectHeight+5,
      width*2/3+10, height/numberLines*(int((controlsPosY+1)/3)+4)+((controlsPosY+1)%3-1)*rectHeight+5);
  }
  text("Press ENTER to play", width/2, height*8/numberLines);
  text("Press I to go to instructions", width/2, height*9/numberLines);

  //Reassignates variables
  lengthTunnel = controls[0]*10;
  mode = controls[1];
  P1.c = color(controls[2]*15, controls[3]*15, controls[4]*15);
  P2.c = color(controls[5]*15, controls[6]*15, controls[7]*15);
}

void resetGame() {//resets game variables
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
  controlsPosX = 0;//Asignates variables be able to change them
  controlsPosY = 0;
  controls[0] = lengthTunnel/15;
  controls[1] = mode;
  controls[2] = int((P1.c >> 16 & 0xFF)/15);
  controls[3] = int((P1.c >> 8 & 0xFF)/15);
  controls[4] = int((P1.c & 0xFF)/15);
  controls[5] = int((P2.c >> 16 & 0xFF)/15);
  controls[6] = int((P2.c >> 8 & 0xFF)/15);
  controls[7] = int((P2.c & 0xFF)/15);
}
