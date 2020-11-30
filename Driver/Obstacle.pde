class Obstacle {
  //Atributos
  int posZ;
  int angle;
  int type;
  int[] c = {int(random(255)), int(random(255)), int(random(255))};

  //Constructor
  Obstacle(int posZ1, int angle1, int type1) {
    posZ = posZ1;
    angle = angle1;
    type= type1;
  }
  
  //Método_Función
  void display() {
    push();
    fill(c[0],c[1],c[2]);
    stroke(c[0],c[1],c[2]);
    translate(width/2,height/2,z-posZ*100);
    fill(255);
    polygon3D();
    pop();
  }
  void polygon3D() {
    float angle1 = TWO_PI / type;
    float radius=playerRadius/cos(angle/2);
    float x = 0;//cos(radians(angle1));
    float y = 0;//sin(radians(angle1));
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle1) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy, 0);
      vertex(sx, sy,100);
    }
    endShape(CLOSE);
  }//A partir de ejemplo de Processing
}
