int z = 0, page = 1;
float theta = 1;
int npolygon = 8; //Números de lados del polígono
int playerRadius = height/3; //Radio de movimiento de los jugadores
//Tamaño del polígono
float angle = TWO_PI / npolygon;
float polyRadius = playerRadius/cos(angle/2);
//Obstacle tri = new Obstacle(2, 90);
Player P1 = new Player();
void setup() {
  size(500, 500, P3D);
  
}

void draw() {
  pageSelector();
  if (keyPressed && key==CODED) {
    if (keyCode==LEFT) {
      theta++;
    } else if (keyCode==RIGHT) {
      theta--;
    }
    //println("theta", theta, "tri.posZ", tri.posZ);
  }
  P1.drawP();
}

void gamePage() {
  background(0);
  drawTunnel();
  //tri.display();
  z++;
}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    gamePage();
    break;
  }
}
