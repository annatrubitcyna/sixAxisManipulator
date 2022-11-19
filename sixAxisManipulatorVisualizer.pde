///сделана первая версия обратной задачи. Сейчас она не работает, скорее всего ошибка в строчке с поиском R для обратной задачи, тк R меняется от смены координат.
// или нет, надо смотреть
//скорее всего фигня в неоднозначности. Те при решении прямой угол один, а при обратной другой, дающий такое же решение
//поэтому и происходит дребезжание- тк решается то так, то по-другому
//надо разобраться какая неоднозначность в поиске первых 3х углов и решить ее, опираясь на предыдущие углы
//то же самое надо сделать и с последними 3мя углами
//? вопрос_ почему такой  проблемы не возникало, когда был 3х осевой манипулятор
//возможно это уже следующая задача и обратную надо проверять по-другому
//вероятно это прикол с t1 как его решить - ??? 

final float[] l={0, 100, 100, 100, 100}; //array of link lengths
private float x=l[2]+l[3]+l[4];
private float y=0;
private float z=l[1];
private float x1;
private float y1;
private float z1;
private float x2;
private float y2;
private float z2;
private float x3;
private float y3;
private float z3;

private float t1;
private float t2;
private float t3;
private float t4;
private float t5;
private float t6;

float[] angles={0, 0, 0, 0, 0, 0};
boolean changeAngles=false;
boolean first=true;

String exeption="OK";
private float[][] R =new float[3][3];
private float[] r ={1,2};


int caseM=0;

void drawManipulator()
{
  clear();
  stroke(255, 0, 0);
  strokeWeight(7);
  strokeCap(ROUND);
  
  //stroke(255, 255, 255, 50);
  //sphereDetail(10);
  //sphere(l[1]+l[2]+l[3]);
  //sphere(l[1]+l[2]+l[3]+l[4]);
  
  if (first){
    //start_angles(0, PI/2, -PI/2, 0, PI, 0);
    //R[0][0]=-1;R[0][1]= 0; R[0][2]= 0;
    //R[1][0]= 0; R[1][1]= 1; R[1][2]= 0;
    //R[2][0]= 0; R[2][1]= 0; R[2][2]= 1;
    R=getRfromSixOrCoordinates(0.5, 0.6, 0.3);
    
    ////R[0][0]=0.087;R[0][1]= -0.854; R[0][2]= -0.513;R[1][0]= 0.708; R[1][1]= -0.309; R[1][2]= 0.635;R[2][0]= -0.701; R[2][1]= -0.418; R[2][2]= 0.578;
    start_coords(-70, -10, 90, R);
  }
 
  
  
  
  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  if (!changeAngles) {
    R=getR(Ta[5]);
    angles=backwardTransfer(x, y, z, R);
    changeAngles=true;
  }
  float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], Ta[5]); 
  //эта функция может искать T внутри, тогда ее передавать не надо, а надо t4, t5, t6
  
  //это сделано для удобства функции line, можно работать с coords
  x1=coords[0][0];
  y1=coords[0][1]; 
  z1=coords[0][2];
  
  x2=coords[1][0];
  y2=coords[1][1];
  z2=coords[1][2];
  
  x3=coords[2][0];
  y3=coords[2][1];
  z3=coords[2][2];
  
  x=coords[3][0];
  y=coords[3][1];
  z=coords[3][2];
  
  stroke(255, 0, 0);
  line(0, 0, 0, x1, y1, z1);
  stroke(255, 255, 0);
  line(x1, y1, z1, x2, y2, z2);
  stroke(0, 0, 255);
  line(x2, y2, z2, x3, y3, z3);
  stroke(0, 255, 255);
  line(x3, y3, z3, x, y, z);
  
  noFill();
  
  //drawOrientation(x, y, z, T);  //это для отрисовки только последней системы координат
  drawOrientations(x1, y1, z1, x2, y2, z2, x3, y3, z3, x, y, z, Ta);
  
  keyCheck();
}
