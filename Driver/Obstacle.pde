class Obstacle {
  //Atributos
  int posZ;
  float angle;
  int type;
  int number;
  int radius=playerRadius;
  int size=playerRadius/2;
  //Múltiplos de n=3 o n=4 son varias veces el obstáculo n
  int[] c = {int(random(255)), int(random(255)), int(random(255))};

  //Constructor
  Obstacle(int posZ, float angle, int type, int number) {
    this.posZ = posZ;
    this.angle = angle;
    this.type= type;
    this.number=number;
  }

  //Método_Función
  void display() {
    push();
    noStroke();
    fill(c[0],c[1],c[2]);
    translate(width/2,height/2,z-posZ*100);
    for(int i=0;i<number;i++){
      polygon3D(angle+TWO_PI/number*(i+1),type,radius,size);
    }
    pop();
  }

}
