class Obstacle{
  //Atributos
  int posZ;
  int angle;

    //Figura 2D-3D
  Obstacle(int posZ1,int angle1){
    posZ=posZ1;
    angle=angle1;

  }
  //Método-Función
  void display(){
    translate(width/2, height/2,z-posZ*100);
    triangle(0,0,5,10,-5,10);
    translate(-width/2, -height/2,-z+posZ*100);
  }
}
