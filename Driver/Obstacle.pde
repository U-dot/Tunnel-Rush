class Obstacle {
  //Atributos
  int posZ;
  float angle;
  int type;
  int number;
  int radius=playerRadius;
  int size=playerRadius/3;
  int deepness=20;
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
    stroke(0);
    fill(c[0],c[1],c[2]);
    translate(width/2,height/2,z-posZ*distanceTunnel);
    for(int i=0;i<number;i++){
      polygon3D(angle+TWO_PI/number*(i+1),
                type,
                radius,
                size,
                deepness);
      //polygon(size,type);
    }
    pop();
  }

}

void colisiones(Obstacle obs, Player p) {
  if ((z-obs.posZ*distanceTunnel)%100 >= 0 && (z-obs.posZ*distanceTunnel)%100 <= 20 && z-obs.posZ*distanceTunnel >= 299) {
    if (obs.oba.length == 1) {
      if (((abs(obs.oba[0] - radians(p.angle)) <= 6.8 && abs(obs.oba[0] - radians(p.angle)) >= 5.8) || (abs(obs.oba[0] - radians(p.angle)) <= 0.5 && abs(obs.oba[0] - radians(p.angle)) >= 0))) {
        z--;
      }
    } else if (obs.oba.length == 2) {
      if (((abs(obs.oba[0] - radians(p.angle)) <= 0.5)) || ((abs(obs.oba[0] - radians(p.angle)) >= 4.2) && (abs(obs.oba[0] - radians(p.angle)) <= 5.2))) {
        z--;
      } else if ((((abs(obs.oba[1] - radians(p.angle)) <= 0.5)) || ((abs(obs.oba[1] - radians(p.angle)) >= 7.4) && (abs(obs.oba[1] - radians(p.angle)) <= 8.3)))) {
        z--;
      }
    } else if (obs.oba.length == 3) {
      if (((abs(obs.oba[0] - radians(p.angle)) <= 0.47)) || ((abs(obs.oba[0] - radians(p.angle)) <= 1.5) && (abs(obs.oba[0] - radians(p.angle)) >= 0.6)) || ((abs(obs.oba[0] - radians(p.angle)) <= 2.55) && (abs(obs.oba[0] - radians(p.angle)) >= 1.7))) {
        z--;
      } else if (((abs(obs.oba[0] - radians(p.angle)) <= 6.7) && (abs(obs.oba[0] - radians(p.angle)) >= 5.8)) || ((abs(obs.oba[0] - radians(p.angle)) <= 5.75) && (abs(obs.oba[0] - radians(p.angle)) >= 4.8)) || ((abs(obs.oba[0] - radians(p.angle)) <= 4.6) && (abs(obs.oba[0] - radians(p.angle)) >= 3.7))) {
        z--;
      }
    } else if (obs.oba.length == 4) {
      if (((abs(obs.oba[0] - radians(p.angle)) <= 0.45)) || (obs.oba[0] - radians(p.angle)) >= -2.8 && (obs.oba[0] - radians(p.angle)) <= -0) {
        z--;
      } else if (((abs(obs.oba[0] - radians(p.angle)) <= 6.7)) && (abs(obs.oba[0] - radians(p.angle)) >= 3.5)) {
        z--;
      }
    }
  }
  if ((z-obs.posZ*distanceTunnel)%100 == 21 && z-obs.posZ*distanceTunnel >= 299)
    obstacles.remove(0);
}
