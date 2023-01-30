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

//для удобства все первые 0, поэтому a1=a[1], однако у углов (angles) отсчет с 0
float[] a = {0, 0, l[2], 0, 0, 0, 0};
float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};

int start_method=0; // 0 для задания через углы в радианах, 1- углы в градусах, 2- координаты+ матрица R
//использовать, чтобы задать стартовое положение через углы поворота сочленений манипулятора в радианах!
float[] angles={0, 0, 0, 0, 0,  0};
boolean changeAngles=true;
boolean first=true;
boolean singularity=false;

String exeption="OK";
private float[][] R =new float[3][3];
boolean mouseCheck=false;


int caseM=0;

void drawManipulator()
{
  //printMatrix(nullMatrix(1,3));
  //printMatrix(eye(3));
  //printMatrix(blockMatrix( dotL(eye(3),5), nullMatrix(3,1), nullMatrix(1,3), eye(1)));
  
  //float[][] v1={{1},{2},{3}};
  //float[][] v2={{4},{5},{6}};
  //float[][] v3=vect_mul(v1,v2);
  //printMatrix(v3);
  
  
  //float[][] check={{1,2,3, 4, 0},{6, 0, 8, 9, 10},{11, 12, 0, 14, 15}, {16,17,18,19,20}, {21,22,23,24,0}};
  //float[][] check={{1,0},{0,1}};
  //printMatrix(dotL(inverse(check), 1));
  //print("det: "); println(det(check));
  
  clear();
  //background(255);
  stroke(255, 0, 0);
  strokeWeight(7); //7
  strokeCap(ROUND);
  stroke(255, 255, 0);
  line(pointc_coords_3D[0][0]*0.9,pointc_coords_3D[1][0]*0.9,pointc_coords_3D[2][0]*0.9, -pointc_coords_3D[0][0]*0.9,-pointc_coords_3D[1][0]*0.9,-pointc_coords_3D[2][0]*0.9);
  
  //stroke(255, 255, 255, 50);
  //sphereDetail(10);
  //sphere(l[1]+l[2]+l[3]);
  //sphere(l[1]+l[2]+l[3]+l[4]);
  
  if (first){
    //использовать, чтобы задать стартовое положение через углы поворота сочленений манипулятора в радианах!
    if(start_method==0){
       float[] angles1={0, 0, 0, 0, 0,  0}; //тут задавать
      for(int i=0;i<6; i++){
        angles[i]=an(angles1[i]);
        first=false;
      }
    }
    
    //использовать, чтобы задать стартовое положение через углы поворота сочленений манипулятора в градусах (в радианах наверху)
    if(start_method==1){
      float[] angles1={0, 10, 20, 0, 0,  0}; //тут задавать
      for(int i=0;i<6; i++){
        angles[i]=an(angles1[i]*PI/180);
      }
    }
    
    //использовать, чтобы задавать стартовое положение через координаты и оси последней системы координат (1 столбец- ось x, 2-y, 3-z)
    //для получения общего вида, либо смотреть конспект, либо переписать матрицу, полученную после управления манипулятора клавишами
    if(start_method==2){
      R[0][0]=0.087;R[0][1]= -0.854; R[0][2]= -0.513;
      R[1][0]= 0.708; R[1][1]= -0.309; R[1][2]= 0.635;
      R[2][0]= -0.701; R[2][1]= -0.418; R[2][2]= 0.578;
      start_coords(-70, -10, 90, R);
    }
  }
 
  
  
  
  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  
  float[][][] Ha=straightTwist();
  Ta=straightTwist();
  //printMatrix(Ha[5]);
  if (!changeAngles) {
    R=getR(Ta[5]);
    angles=backwardTransfer(x, y, z, R);
    changeAngles=true;
  }
  
  //float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], Ta);
  float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], Ta);
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
  
  pushMatrix();
  translate (x,y,z);
  stroke(255,255,255);
  sphere(3);
  popMatrix();  
  noFill();
  
  //drawOrientation(x, y, z, T);  //это для отрисовки только последней системы координат
  drawOrientations(x1, y1, z1, x2, y2, z2, x3, y3, z3, x, y, z, Ta);
  drawAngles();
  //stroke(255,255,255);
  //strokeWeight(17);
  //float nl=sqrt(sq(nx)+sq(ny)+ sq(nz))/100;
  //line(0,0,0,nx/nl,ny/nl,nz/nl);
  keyCheck();
  float[][] centre_of_gr=centreOfGravity(0,1,1,1,1,5);
  //printMatrix(centre_of_gr);
  
  pushMatrix();
  translate (centre_of_gr[0][0],centre_of_gr[1][0], centre_of_gr[2][0]);
  stroke(255,255,0);
  sphere(3);
  popMatrix();  
  noFill();
}
