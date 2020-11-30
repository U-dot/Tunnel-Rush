class Obstacle {
  //Atributos
  int posZ;
  int angle;
  int type;
  int number;
  //Múltiplos de n=3 o n=4 son varias veces el obstáculo n
  int[] c = {int(random(255)), int(random(255)), int(random(255))};

  //Constructor
  Obstacle(int posZ1, int angle1, int type1, int number1) {
    posZ = posZ1;
    angle = angle1;
    type= type1;
    number=number1;
  }
  
  //Método_Función
  void display() {
    push();
    fill(c[0],c[1],c[2]);
    translate(width/2,height/2,z-posZ*100);
    for(int i=0;i<number;i++){
      polygon3D(angle+360/number*(i+1));
    }
    pop();
  }
  void polygon3D(int angle1) {
    rotate(radians(angle1));
    float angle2 = TWO_PI / type;
    float radius=playerRadius/2/cos(radians(angle2)/2);
    float x = cos(radians(angle1))*playerRadius;
    float y = sin(radians(angle1))*playerRadius;    
    polygon(x,y,playerRadius/2,type); 
    float sx,sy,a=0;
    float sx1 = x + cos(a) * radius;
    float sy1 = y + sin(a) * radius;
    a=0;
    while(a<TWO_PI){     
      sx = sx1;
      sy = sy1;
      beginShape();
      vertex(sx, sy, 0);
      vertex(sx, sy, -15);
      a += angle2;
      sx1 = x + cos(a) * radius;
      sy1 = y + sin(a) * radius;
      vertex(sx1, sy1, -15);
      vertex(sx1, sy1, 0);
      vertex(sx, sy, 0);
      endShape(CLOSE);
    }
  }//A partir de ejemplo de Processing
}
