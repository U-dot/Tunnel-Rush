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
PFont font;

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
  font = createFont("Bitstream Charter Bold Italic", 45, true);
}

void draw() {
  background(20);
  pageSelector();
}

void gamePage() {
  drawTunnel();
  for(int i=0;i<lengthTunnel/2;i++){
    obstacles.get(i).display();
  }
  push();
  P1.drawP();
  pop();
  */push();
  P2.drawP();
  pop();*/
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
    z++;
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
    z = 1000;
    drawTunnel();
    textFont(font);
    text("TUNNEL RUSH", 100,150);
    push();
    textSize(25);
    text("Press 'enter' to start", 150,350);
    pop();
    if(keyPressed){
      if(keyCode == ENTER) {
        z = 0;
        page++;
      }
    }
    break;
  case 2:
    gamePage();
    break;
  case 3:
    push();
    textSize(60);
    text("GAME OVER",70,230);
    pop();
    break;
  }
}
