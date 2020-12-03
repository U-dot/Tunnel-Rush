int Counter = 0;
class Player {
  //Atributos
  int[] c = {int(random(255)), int(random(255)), int(random(255))};
  float radius;
  float angle;
  int count;

  //Constructor
  Player(float r, float a) {
    Counter++;
    radius = r;
    angle = a;
    count = Counter;
  }

  //Métodos
  void drawP() {
    if (count == 1) {
      if (keyPressed && key == CODED) {
        if (keyCode == LEFT) {
          angle+=1.5;
        } else if (keyCode == RIGHT) {
          angle-=1.5;
        }
      }
    } else if (count == 2) {
      if (keyPressed) {
        if (key == 'a') {
          angle+=1.5;
        } else if (key == 'd') {
          angle-=1.5;
        }
      }
    }
    translate(width/2, height/2, 300);
    fill(c[0], c[1], c[2]);
    stroke(c[0], c[1], c[2]);
    circle(cos(radians(angle))*radius, sin(radians(angle))*radius, 10);
    if (radians(angle)%TWO_PI == 0)
      angle = 0;
  }
}
