int z=0, theta=0, page=1;
void setup() {
  size(640, 360, P3D);
}

void draw() {
  pageSelector();
}

void keyPressed(){
  if (key==CODED){
    print("CODED");
    if (keyCode==UP){
      print("UP");
      theta++;
      z++;
    }else if (keyCode==DOWN){
      theta--;
      z--;
    }
  }
}
void gamePage(){
  background(0);
  drawTunnel();
  z++;
  //theta++;
}
void pageSelector(){//Escoge la página
  switch(page) {
    case 1:
      gamePage();
      break;
  }
}
