int z = 0, page = 1;
float theta = 1;
int npolygon = 8; //Números de lados del polígono
int playerRadius = height/2; //Radio de movimiento de los jugadores
//Tamaño del polígono
float angle = TWO_PI / npolygon;
float polyRadius = playerRadius/cos(angle/2);
Obstacle tri = new Obstacle(0,0,3,3);
Player P1 = new Player(playerRadius,0);
void setup() {
  size(500, 500, P3D);
  
}

void draw() {
  pageSelector();

}

void gamePage() {
  background(0);
  drawTunnel();
  tri.display();
  z++;
  P1.drawP();
  if (keyPressed && key==CODED) {
    if (keyCode==LEFT) {
      theta++;
    } else if (keyCode==RIGHT) {
      theta--;
    }
    println("theta",theta);
  }
}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    gamePage();
    break;
  }
}
