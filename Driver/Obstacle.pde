class Obstacle {
  //Atributos
  float angle;
  int posZ;
  int type;
  int number;
  int radius = playerRadius;
  int size = playerRadius/3;
  int deepness = 20;
  //Múltiplos de n=3 o n=4 son varias veces el obstáculo n
  color c = color(int(random(255)) , int(random(255)), int(random(255)) );
  float[] oba;

  //Constructor
  Obstacle(int posZ, float angle, int type, int number) {
    this.posZ = posZ;
    this.angle = angle;
    this.type = type;
    this.number = number;
    oba = new float[number];
    for (int i = 0; i < number; i++) {
      oba[i] = angle+TWO_PI/number*(i+1);
    }
  }

  //Método_Función
  void display() {
    push();
    stroke(0);
    fill(c);
    translate(width/2, height/2, z-posZ*distanceTunnel);
    for (int i = 0; i < number; i++) {
      polygon3D(oba[i], type, radius, size, deepness, true);
    }
    pop();
  }
}

void colisiones(Obstacle obstacle1, Player p) {
  boolean colission=false;
  for (int i = 0; i < obstacle1.number; i++) {
    if (abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI) %TWO_PI <= 0.46 ) {
      colission=true;
    }
    if ( abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI <= TWO_PI) {
      if ( abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI >= 5.8) {
        colission=true;
      }
    }
    if (colission) {
      if ((z-obstacle1.posZ*distanceTunnel)%100 >= 0) {
        if ( (z-obstacle1.posZ*distanceTunnel)%100 <= 20) {
          if ( z-obstacle1.posZ*distanceTunnel >= 299) {
            page = 3;
            print("GAME OVER");
          }
        }
      }
    }
  }
}
