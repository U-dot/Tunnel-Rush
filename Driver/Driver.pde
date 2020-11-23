int z=0, page=1;
float theta=1;
void setup() {
  size(640, 360, P3D);
}

void draw() {
  pageSelector();
  if (keyPressed){
    if (key==CODED){
      print("CODED");
      if (keyCode==UP){
        print("UP");
        theta+=0.5;
      }else if (keyCode==DOWN){
        theta--;
      }
    }
  }
}

void keyPressed(){

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
