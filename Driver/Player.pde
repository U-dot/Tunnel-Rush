class Player {
  //Atributos
  //boolean[] keys = {false, false, false, false};
  int[] c = {int(random(255)), int(random(255)), int(random(255))};
  float radius;
  float angle;

  //Constructor
  Player(float r, float a) {
    radius = r;
    angle = a;
  }

  //Métodos
  void drawP() {
    push();
    translate(width/2, height/2, 300);
    fill(c[0], c[1], c[2]);
    stroke(c[0], c[1], c[2]);
    circle(cos(radians(angle))*radius, sin(radians(angle))*radius, playerSize);
    if (radians(angle)%TWO_PI == 0) {
      angle = 0;
    }
    /*if (keys[0] || keys[2]) {
     angle += 1.5;
     } else if (keys[1] || keys[3]) {
     angle -= 1.5;
     }*/
     pop();
  }
  void keyPressed1() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          angle += 1.5;
        } else if (keyCode == RIGHT) {
          angle -= 1.5;
        }
      }
    }
  }

  void Mouse() {
    if (mousePressed) {
      if (mouseButton == RIGHT) {
        angle -= 1.5;
      } else if (mouseButton == LEFT) {
        angle += 1.5;
      }
    }
  }
}
