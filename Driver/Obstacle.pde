class Obstacle {
  //Atributos
  int posZ;
  int angle;
  int[] c = {int(random(255)), int(random(255)), int(random(255))};

  //Constructor
  Obstacle(int posZ1, int angle1) {
    posZ = posZ1;
    angle = angle1;
  }
  
  //Método_Función
  void display() {
    fill(c[0],c[1],c[2]);
    stroke(c[0],c[1],c[2]);
    push();
    translate(width/2, height/2+50, z-posZ*100);
    triangle(0, 0, 5, 10, -5, 10);
    pop();
  }
}
