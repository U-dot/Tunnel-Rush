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
  int[] c = {int(random(255)), int(random(255)), int(random(255))};
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
    fill(c[0], c[1], c[2]);
    translate(width/2, height/2, z-posZ*distanceTunnel);
    for (int i = 0; i < number; i++) {
      polygon3D(oba[i], type, radius, size, deepness);
    }
    pop();
  }
}

void colisiones(Obstacle obs, Player p) {
  for (int i = 0; i < obs.number; i++) {
    if ((abs(obs.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI <= 0.46 || (abs(obs.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI <= TWO_PI && abs(obs.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI >= 5.8))) {
      if ((z-obs.posZ*distanceTunnel)%100 >= 0 && (z-obs.posZ*distanceTunnel)%100 <= 20 && z-obs.posZ*distanceTunnel >= 299) {
        page++;
      }
    }
  }
}

void gameOver(){
  z--;
  page++;
}
