int z = 0, page = 1;
float theta = 1;
int distanceTunnel=100;
int npolygon = 8; //Números de lados del polígono
int playerRadius = height/2; //Radio de movimiento de los jugadores
//Tamaño del polígono
int lengthTunnel=30;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Player P1 = new Player(playerRadius,0);
//Player P2 = new Player(playerRadius, PI);

void setup() {
  size(500, 500, P3D);
  int typePoly=0;
  int numberPoly=0;
  float angle=0;
  for (int i=0;i<lengthTunnel/2;i++){
    typePoly= int(random(3,5));
    numberPoly=int(random(1,5));
    angle=random(TWO_PI);
    obstacles.add(new Obstacle(i*2, angle, typePoly, numberPoly));
  }
}

void draw() {
  pageSelector();

}

void gamePage() {
  background(0);
  drawTunnel();
  for(int i=0;i<lengthTunnel/2;i++){
    obstacles.get(i).display();
  }
  //z++;
  P1.drawP();
  if (obstacles.size() > 0) {
    colisiones(obstacles.get(0), P1);
  }
  if (keyPressed && key==CODED) {
    if (keyCode==LEFT) {
      theta++;
    } else if (keyCode==RIGHT) {
      theta--;
    }else if(keyCode==ALT){
      z-=3;
    }else if(keyCode==CONTROL){
      z+=3;
    }
    println(theta);
            //obstacles[int(z/distanceTunnel)].posZ,
            //obstacles[int(z/distanceTunnel)].angle,
            //obstacles[int(z/distanceTunnel)].type,
            //obstacles[int(z/distanceTunnel)].number);
  }
}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    gamePage();
    break;
  }
}
