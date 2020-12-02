int z = 0, page = 1;
float theta = 1;
int npolygon = 8; //Números de lados del polígono
int playerRadius = height/2; //Radio de movimiento de los jugadores
//Define tamaño del polígono
int lengthTunnel=30;
Obstacle[] obstacles = new Obstacle[lengthTunnel];
Player P1 = new Player(playerRadius,0);
void setup() {
  size(500, 500, P3D);
  int typePoly=0;
  int numberPoly=0;
  for (int i=0;i<lengthTunnel/2;i++){
    typePoly= int(random(3,5));
    numberPoly=int(random(0,5));
    obstacles[i]=new Obstacle(i*2,0,typePoly,numberPoly);
  }
}

void draw() {
  pageSelector();

}

void gamePage() {
  background(0);
  drawTunnel();
  for(int i=0;i<lengthTunnel/2;i++){
    obstacles[i].display();
  }
  z++;
  P1.drawP();
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
            //obstacles[int(z/100)].posZ,
            //obstacles[int(z/100)].angle,
            //obstacles[int(z/100)].type,
            //obstacles[int(z/100)].number);
  }
}

void pageSelector() {//Escoge la página
  switch(page) {
  case 1:
    gamePage();
    break;
  }
}
