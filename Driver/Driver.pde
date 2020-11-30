//Ahora el tunel es estático, cambia jugador
int z=0, page=1;
float theta=1;
int npolygon=6;//Números de lados del polígono
int playerRadius=height/3;//Radio de movimiento de los jugadores
//De este depende el tamaño del polígono
float angle = TWO_PI / npolygon;
float polyRadius= playerRadius/cos(angle/2);
Obstacle tri= new Obstacle(2,90);
void setup() {
  size(640, 360, P3D);
}

void draw() {
  pageSelector();
  if (keyPressed){
    if (key==CODED){
      if (keyCode==LEFT){
        theta++;
      }else if (keyCode==RIGHT){
        theta--;
      }
      println("theta", theta, "tri.posZ",tri.posZ);
    }
  }
}
//No se puede usar void keyPressed por el render P3D

void gamePage(){
  background(0);
  drawTunnel();
  tri.display();
  z++;
}
void pageSelector(){//Escoge la página
  switch(page) {
    case 1:
      gamePage();
      break;
  }
}
