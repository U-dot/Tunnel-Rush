//Ahora el tunel es estático, cambia jugador
int z=0, page=1;
float theta=1;
int npolygon=8;//Números de lados del polígono
int radius=80;//Radio de movimiento de los jugadores
//De este depende el tamaño del polígono
void setup() {
  size(640, 360, P3D);
}

void draw() {
  pageSelector();
  if (keyPressed){
    if (key==CODED){
      if (keyCode==UP){
        theta++;
      }else if (keyCode==DOWN){
        theta--;
      }
      println("theta", theta);
    }
  }
}

void keyPressed(){

}
void gamePage(){
  background(0);
  drawTunnel();
  z++;
}
void pageSelector(){//Escoge la página
  switch(page) {
    case 1:
      gamePage();
      break;
  }
}
