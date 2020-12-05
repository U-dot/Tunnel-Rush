int z = 0, page = 1;
int distanceTunnel = 100;
int npolygon = 8; //Números de lados del polígono
int playerRadius; //Radio de movimiento de los jugadores
int playerSize=10;
int lengthTunnel = 20;
float theta = 1;
PFont font;
ArrayList<Obstacle> obstacles;
Player P1, P2;

void setup() {
  size(500, 500, P3D);
  textAlign(CENTER);
  playerRadius=height/10;
  obstacles = new ArrayList<Obstacle>();
  P1= new Player(playerRadius, 0);
  P2 = new Player(playerRadius, PI);
  font = createFont("data-latin.ttf", width/20);
}

void draw() {
  background(20);
  pageSelector();
}

void keyPressed() {
  if (keyCode == ENTER && page!=4) {
    resetGame();
    page++;
  }
  if (page > 5) {
    page = 1;
  }
}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    introPage();
    break;
  case 2:
    helpPage();
    break;
  case 3:
    controlPage();
    break;
  case 4:
    gamePage();
    break;
  case 5:
    gameOverPage();
    break;
  }
}

void introPage() {
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  drawTunnel(1);
  textFont(font);
  textSize(width/15);
  text("TUNNEL RUSH", width/2, height/3);
  push();
  textSize(25);
  text("PRESS ENTER TO START", width/2, height*2/3);
  pop();
}

void helpPage() {
  text("HELP", width/2, height/2);
}

void controlPage() {
  int numberControls=4;
  int posX = 0, posY = 0;
  int[] Controls = {lengthTunnel};
  text("Game controls stacks", width/2, height/(numberControls+1));
  text("Distance:", width/3, height*2/(numberControls+1));
  text(lengthTunnel+"m", width*2/3, height*2/(numberControls+1));
  text("Game controls(?)", width/3, height*3/(numberControls+1));
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      lengthTunnel++;
    } else if (keyCode == RIGHT && lengthTunnel > 1) {
      lengthTunnel--;
    }
  }
}

void gamePage() {
  drawTunnel(1);
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  push();
  P1.drawP();
  P1.keyPressed1();
  pop();
  push();
  P2.drawP();
  P2.Mouse();
  pop();
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
  textSize(60);
  text("GAME OVER", width/2, height/2);
  pop();
}

void resetGame() {
  z = 0;
  int typePoly = 0;
  int numberPoly = 0;
  float angle = 0;
  obstacles= new ArrayList<Obstacle>();
  for (int i = 0; i < lengthTunnel/2; i++) {
    typePoly = int(random(3, 5));
    numberPoly = int(random(1, 5));
    angle = random(TWO_PI);
    obstacles.add(new Obstacle(i*2, angle, typePoly, numberPoly));
  }
  //Player P1 = new Player(playerRadius, 0);
  //Player P2 = new Player(playerRadius, PI);
}
