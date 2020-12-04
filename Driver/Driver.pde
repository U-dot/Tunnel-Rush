int z = 0, page = 1;
float theta = 1;
int distanceTunnel = 100;
int npolygon = 8; //Números de lados del polígono
int playerRadius = height/2; //Radio de movimiento de los jugadores
int playerSize=10;
int lengthTunnel = 20;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Player P1 = new Player(playerRadius, 0);
//Player P2 = new Player(playerRadius, PI);
PFont font;

void setup() {
  size(500, 500, P3D);
  textAlign(CENTER);
  font = createFont("Bitstream Charter Bold Italic", 45, true);

}

void draw() {
  background(20);
  pageSelector();
  if(keyPressed){
    if(keyCode == ENTER && page!=2) {
      resetGame();
      page++;
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
  }
}
void introPage(){
  drawTunnel(1);
  textFont(font);
  text("TUNNEL RUSH", width/2,height/3);
  push();
  textSize(25);
  text("PRESS ENTER TO START", width/2,height*2/3);
  pop();
}
void gamePage() {
  drawTunnel(1);
  for (int i = 0; i < obstacles.size(); i++) { //Se llaman a los obstaculos
    obstacles.get(i).display();
  }
  push();
  P1.drawP();
  pop();
  /*push();
   P2.drawP();
   pop();*/
  z++;
  if (obstacles.size() > 0) {
    //colisiones(obstacles.get(0), P1);
  }
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      theta+=2;
    } else if (keyCode == RIGHT) {
      theta-=2;
    } else if (keyCode == ALT) {
      z-=3;
    } else if (keyCode == CONTROL) {
      z+=3;
    }
  }
}
void gameOverPage(){
  push();
  textSize(60);
  text("GAME OVER",width/2,height/2);
  pop();
}
void resetGame(){
  int typePoly = 0;
  int numberPoly = 0;
  float anglePoly = 0;
  z=0;
  for (int i = 0; i < lengthTunnel/2; i++) {
    typePoly = int(random(3, 5));
    numberPoly = int(random(1, 5));
    anglePoly = random(TWO_PI);
    obstacles.add(new Obstacle(i*2, anglePoly, typePoly, numberPoly));
  }
  Player P1 = new Player(playerRadius, 0);
//Player P2 = new Player(playerRadius, PI);
}
