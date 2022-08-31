///сделана первая версия обратной задачи. Сейчас она не работает, скорее всего ошибка в строчке с поиском R для обратной задачи, тк R меняется от смены координат.
// или нет, надо смотреть
//скорее всего фигня в неоднозначности. Те при решении прямой угол один, а при обратной другой, дающий такое же решение
//поэтому и происходит дребезжание- тк решается то так, то по-другому
//надо разобраться какая неоднозначность в поиске первых 3х углов и решить ее, опираясь на предыдущие углы
//то же самое надо сделать и с последними 3мя углами
//? вопрос_ почему такой  проблемы не возникало, когда был 3х осевой манипулятор
//возможно это уже следующая задача и обратную надо проверять по-другому
//вероятно это прикол с t1 как его решить - ??? 

final float[] l={0, 100, 100, 100, 100};

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
private float t1=0;
private float t2=PI/2;
private float t3=-PI/2;
private float t4=0;
private float t5=0;
private float t6=0;
float[] angles={0, PI/2, -PI/2, 0, 0, 0};
float[] orientation={0, 0, 0};
boolean changeAngles=true;


float[][] straightTransferCoordF(float t1, float t2, float t3,float t5)
{
  x1 = 0;
  y1 = 0;
  z1 = l[1];
  x2 = (l[2] * cos(t2)) * cos(t1);
  y2 = (l[2] * cos(t2)) * sin(t1);
  z2 = l[1]+ l[2] * sin(t2);
  x3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * cos(t1);
  y3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * sin(t1);
  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t2+t3);
  
  x = (l[2] * cos(t2) + l[3] * cos(t3 + t2) + l[4] * cos(t5 + (t3 + t2))) * cos(t1);
  y = (l[2] * cos(t2) + l[3] * cos(t3 - t2) + l[4] * cos(t5 + (t3 + t2))) * sin(t1);
  z = l[1] + l[2] * sin(t2) + l[3] * sin(t3 + t2) + l[4] * sin(t5 + (t3 + t2));
  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x, y, z}};
  return coords;
}


float[][][] getT(float t1, float t2, float t3, float t4, float t5, float t6){
  
   t3 = t3 + PI / 2;
  
  float[] a = {0, 0, l[2], 0, 0, 0, 0};
  float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
  float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};
  
  float[][] T_0_1 = {{cos(t1), -sin(t1) * cos(alpha[1]), sin(t1) * sin(alpha[1]), a[1] * cos(t1)},
                    {sin(t1), cos(t1) * cos(alpha[1]), -cos(t1) * sin(alpha[1]), a[1] * sin(t1)},
                    {0, sin(alpha[1]), cos(alpha[1]), d[1]},
                    {0, 0, 0, 1}};
  
  float[][] T_1_2 = {{cos(t2), -sin(t2) * cos(alpha[2]), sin(t2) * sin(alpha[2]), a[2] * cos(t2)},
                    {sin(t2), cos(t2) * cos(alpha[2]), -cos(t2) * sin(alpha[2]), a[2] * sin(t2)},
                    {0, sin(alpha[2]), cos(alpha[2]), d[2]},
                    {0, 0, 0, 1}};
  
  float[][] T_2_3 = {{cos(t3), -sin(t3) * cos(alpha[3]), sin(t3) * sin(alpha[3]), a[3] * cos(t3)},
                    {sin(t3), cos(t3) * cos(alpha[3]), -cos(t3) * sin(alpha[3]), a[3] * sin(t3)},
                    {0, sin(alpha[3]), cos(alpha[3]), d[3]},
                    {0, 0, 0, 1}};
  float[][]T_3_4 = {{cos(t4), -sin(t4) * cos(alpha[4]), sin(t4) * sin(alpha[4]), a[4] * cos(t4)},
                    {sin(t4), cos(t4) * cos(alpha[4]), -cos(t4) * sin(alpha[4]), a[4] * sin(t4)},
                    {0, sin(alpha[4]), cos(alpha[4]), d[4]},
                    {0, 0, 0, 1}};
  float[][] T_4_5 = {{cos(t5), -sin(t5) * cos(alpha[5]), sin(t5) * sin(alpha[5]), a[5] * cos(t5)},
                    {sin(t5), cos(t5) * cos(alpha[5]), -cos(t5) * sin(alpha[5]), a[5] * sin(t5)},
                    {0, sin(alpha[5]), cos(alpha[5]), d[5]},
                    {0, 0, 0, 1}};
  float[][] T_5_6 = {{cos(t6), -sin(t6) * cos(alpha[6]), sin(t6) * sin(alpha[6]), a[6] * cos(t6)},
                    {sin(t6), cos(t6) * cos(alpha[6]), -cos(t6) * sin(alpha[6]), a[6] * sin(t6)},
                    {0, sin(alpha[6]), cos(alpha[6]), d[6]},
                    {0, 0, 0, 1}};
  float[][] T_0_2=dot(T_0_1, T_1_2);
  float[][] T_0_3=dot(T_0_2, T_2_3);
  float[][] T_0_4=dot(T_0_3, T_3_4);
  float[][] T_0_5=dot(T_0_4, T_4_5);
  float[][] T_0_6=dot(T_0_5, T_5_6);
  float[][][] T = {T_0_1, T_0_2, T_0_3, T_0_4, T_0_5, T_0_6};
  return T;
}

float[][] getR(float t1, float t2, float t3, float t4, float t5, float t6){
  float[][] T = getT(t1, t2, t3, t4, t5, t6)[5];  
  float[][] R = {{T[0][0], T[0][1], T[0][2]},
                  {T[1][0], T[1][1], T[1][2]},
                  {T[2][0], T[2][1], T[2][2]}}; //мб эту процедуру стоит вынести в отдельную функцию - отделить кусок от матрицы  
  return R;
}


float[][] straightTransferCoord(float t1, float t2, float t3, float t4, float t5, float t6)
{
  x1 = 0;
  y1 = 0;
  z1 = l[1];
  x2 = (l[2] * cos(t2)) * cos(t1);
  y2 = (l[2] * cos(t2)) * sin(t1);
  z2 = l[1]+ l[2] * sin(t2);
  x3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * cos(t1);
  y3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * sin(t1);
  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t2+t3);
  
  float[][] Q ={{0}, {0}, {0}, {1}};
  float[][] T = getT(t1, t2, t3, t4, t5, t6)[5];
  
  
  float[][] XYZ = dot(T, Q);
  
  float x=XYZ[0][0];
  float y=XYZ[1][0];
  float z=XYZ[2][0];
  println("xyz", x, y, z);
  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x, y, z}};
  return coords;
}


//странный способ для ориентации ??? по ходу из НТИ

//float[][] straightTransfer(float t1, float t2, float t3, float t4, float t5, float t6)
//{
  
//  float[][] T = getT(t1, t2, t3, t4, t5, t6);
  
//  float[][] R = {{T[0][0], T[0][1], T[0][2]},
//                {T[1][0], T[1][1], T[1][2]},
//                {T[2][0], T[2][1], T[2][2]}};
//  float y_angle = -PI / 2;
//  float[][] T_y = {{cos(y_angle), 0, sin(y_angle)},
//                  {0, 1, 0},
//                  {-sin(y_angle), 0, cos(y_angle)}};
//  float x_angle = PI;
//  float[][] T_x = {{1, 0, 0},
//                  {0, cos(x_angle), -sin(x_angle)},
//                  {0, sin(x_angle), cos(x_angle)}};
//  T = dot(dot(R, T_y), T_x);
//  return T; 
//}

//float[] straightTransferOr(float t1, float t2, float t3, float t4, float t5, float t6){
  
//  float[][] T=straightTransfer(t1, t2, t3, t4, t5, t6);
//  float aalpha;
//  float betta;
//  float gamma;
  
//  //if (round(T[0][2]) == 1 | round(T[0][2]) == -1){
//  //    if (round(T[0][2]) == -1){
//  //        betta = PI / 2;
//  //    }
//  //    else{
//  //        betta = -PI / 2;
//  //    }
//  //    gamma = 0;
//  //    aalpha = atan2(T[1][0], T[1][1]);
//  //}
//  //else{
//      betta = -asin(T[2][0]);
//      aalpha = atan2(-T[1][2] / cos(betta), T[2][2] / cos(betta));
//      gamma = atan2(T[0][1] / cos(betta), T[0][0] / cos(betta));
//  //}
//  //println(t1, t2, t3, t4, t5, t6);
//  println(-aalpha*180/PI, betta*180/PI, gamma*180/PI);
//  float[] orientation={-aalpha, betta, gamma};
//  //float[] orientation={};
//  return orientation;
//}

void drawOrientation(float x, float y, float z, float[][]T, int len){
  float[][] R = {{T[0][0], T[0][1], T[0][2]},
                {T[1][0], T[1][1], T[1][2]},
                {T[2][0], T[2][1], T[2][2]}};
  float[][] x0={{len}, {0}, {0}};
  float[][] newX=dot(R, x0);
  stroke(255, 0, 0);
  line(x, y, z, x+newX[0][0], y+newX[1][0], z+newX[2][0]);
  float[][] y0={{0}, {len}, {0}};
  float[][] newY=dot(R, y0);
  stroke(0, 255, 0);
  line(x, y, z, x+newY[0][0], y+newY[1][0], z+newY[2][0]);
  float[][] z0={{0}, {0}, {len}};
  float[][] newZ=dot(R, z0);
  stroke(0, 0, 255);
  line(x, y, z, x+newZ[0][0], y+newZ[1][0], z+newZ[2][0]);
}

void drawOrientations(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x, float y, float z,float[][][]T_a){
  
  stroke(255, 0, 0);
  line(0, 0, 0, 200, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 200, 0);
  //stroke(0, 0, 255);
  //line(0, 0, 0, 0, 0, 50);
  
  ////subscribe axis
  //fill(255, 0, 0);
  //textSize(40);
  //text("x", 180, 30);
  
  drawOrientation(x1, y1, z1, T_a[0], 5);
  drawOrientation(x2, y2, z2, T_a[1], 5);
  drawOrientation(x3, y3, z3, T_a[3], 5);
  drawOrientation(x, y, z, T_a[5], 10);
}

float[] threeAxisBackwardTransfer(float x, float y, float z)
{
  float[] a = {0, 0, l[2], l[3]};  // массив значений a_i
  float[] d = {0, l[1], 0, 0};  // массив значений d_i
  float r1 = sqrt(sq(x)+sq(y));
  float r2 = z - d[1];
  float r3 = sqrt(sq(r1)+sq(r2));
  t1 = atan2(y, x);

  if (abs((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3))<=1) {
    float psi1 = acos((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3));
    float psi2 = atan2(r2, r1);
    if (abs((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]))<=1) {
      t2 = psi2 + psi1;
      float psi3 = acos((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]));
      t3 = -(PI - psi3);
    }
  }
  
  if(abs(angles[1]-t2)>abs(angles[1]+t2)){
    t2=-t2;
    t3=PI/2+t2-t3;
  }
  float[] angles={t1, t2, t3};
  return angles;
}

float[] orientationBackwardsTransfer(float t1, float t2, float t3, float[][] R)
{
  t3 = t3 + PI / 2;
  float[] a = {0, 0, l[2], 0, 0, 0, 0};
  float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
  float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};
  
  float[][] T_0_1 = {{cos(t1), -sin(t1) * cos(alpha[1]), sin(t1) * sin(alpha[1]), a[1] * cos(t1)},
                    {sin(t1), cos(t1) * cos(alpha[1]), -cos(t1) * sin(alpha[1]), a[1] * sin(t1)},
                    {0, sin(alpha[1]), cos(alpha[1]), d[1]},
                    {0, 0, 0, 1}};
  
  float[][] T_1_2 = {{cos(t2), -sin(t2) * cos(alpha[2]), sin(t2) * sin(alpha[2]), a[2] * cos(t2)},
                    {sin(t2), cos(t2) * cos(alpha[2]), -cos(t2) * sin(alpha[2]), a[2] * sin(t2)},
                    {0, sin(alpha[2]), cos(alpha[2]), d[2]},
                    {0, 0, 0, 1}};
  
  float[][] T_2_3 = {{cos(t3), -sin(t3) * cos(alpha[3]), sin(t3) * sin(alpha[3]), a[3] * cos(t3)},
                    {sin(t3), cos(t3) * cos(alpha[3]), -cos(t3) * sin(alpha[3]), a[3] * sin(t3)},
                    {0, sin(alpha[3]), cos(alpha[3]), d[3]},
                    {0, 0, 0, 1}};
                    
  float[][] T3 = dot(dot(T_0_1, T_1_2), T_2_3);
  //float[][] R3 = {{T3[0][0], T3[0][1], T3[0][2]},
  //              {T3[1][0], T3[1][1], T3[1][2]},
  //              {T3[2][0], T3[2][1], T3[2][2]}};
  float[][] R3T = {{T3[0][0], T3[1][0], T3[2][0]},
                {T3[0][1], T3[1][1], T3[2][1]},
                {T3[0][2], T3[1][2], T3[2][2]}};
  float[][] R36= dot(R3T, R);
  //print("R ", R[2][2], "\n");
  //print("R3*R36 ", dot(R3, R36)[2][2], "\n");
  if(R36[2][2]==1){
    t5=0;
    t6=0; //выбираем t6 любым
    t4=atan2(R36[1][0], R36[0][0])-t6;
  }
  else if (R36[2][2]==-1){
    t5=0;
    t6=0; //выбираем t6 любым
    t4=atan2(-R36[0][1], -R36[0][0])+t6;
  }
  else{
  int sign=1; //1 или -1
  t4=atan2(sign*sqrt(1-sq(R36[2][2])), R36[2][2]);
  t5=atan2(sign*R36[1][2], sign*R36[0][2]);
  t6=atan2(sign*R36[2][1], -sign*R36[2][0]);
  
  //t4=acos(R[2][2]);
  //t5=atan2(R[1][2], R[0][2]);
  //t6=atan2(R[2][1], -R[2][0]);
  }
  float[] angles={t4, t5, t6};
  return angles;
}

float round(float a, int n){
  return (round(a*pow(10, n)))/pow(10, n);
}

float[] backwardTransfer(float x, float y, float z, float[][] R)
{
  //косячная запись p40=p60-d6*R60*[0; 0;1]
  //тк косячно работают матрицы
  float[][] d6m={{0}, {0}, {l[4]}};
  float[][] p46=dot(R, d6m);
  float[][] p4={{x-p46[0][0]}, {y-p46[1][0]}, {z-p46[2][0]}};
  
  float[] threeAngles = threeAxisBackwardTransfer(p4[0][0], p4[1][0], p4[2][0]); //получаем первые 3 угла из геометрии
  t1=round(threeAngles[0], 5); t2=round(threeAngles[1], 5); t3=round(threeAngles[2], 5); //инициализируем
  threeAngles = orientationBackwardsTransfer(t1, t2, t3, R); //получаем последние 3 угла из первых 3х и ориентации
  t4=round(threeAngles[0], 5); t5=round(threeAngles[1], 5); t6=round(threeAngles[2], 5);
  
  float[] newAngles={t1, t2, t3, t4, t5, t6};
  //float[] newAngles={t1, t2, t3, angles[3], angles[4], angles[5]};
  println("t", t1, t2, t3, t4, t5, t6);
  return newAngles;
}



void drawManipulator()
{
  clear();
  stroke(255, 0, 0);
  strokeWeight(7);
  strokeCap(ROUND);
  if (!changeAngles) {
    float[][] R=getR(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
    angles=backwardTransfer(x, y, z, R);
    changeAngles=true;
  }
  float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  
  //float[][] R=getR(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  //angles=backwardTransfer(coords[3][0], coords[3][1],coords[3][2], R, angles);
  //coords=straightTransferCoord(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  
  //float[][] T=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5])[5];
  //orientation=straightTransferOr(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
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
  
  line(0, 0, 0, x1, y1, z1);
  stroke(255, 255, 0);
  line(x1, y1, z1, x2, y2, z2);
  stroke(0, 0, 255);
  line(x2, y2, z2, x3, y3, z3);
  stroke(0, 255, 255);
  line(x3, y3, z3, x, y, z);
  
  noFill();
  
  //drawOrientation(x, y, z, T);
  
  float[][][] T_a=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  drawOrientations(x1, y1, z1, x2, y2, z2, x3, y3, z3, x, y, z, T_a);
  
  
  //float axLen=10;
  //float xO=x+axLen*cos(orientation[0]);
  //float yO=y+axLen*cos(orientation[1]);
  //float zO=z+axLen*cos(orientation[2]);

  //вывод справочной инфы
  
  
  if (keyPressed){
    if (key == CODED) {
      if (keyCode == UP)
      {
        z+=1;
      } else if (keyCode == DOWN)
      {
        z-=1;
      } else if (keyCode == RIGHT)
      {
        x+=1;
      } else if (keyCode == LEFT)
      {
        x-=1;
      } else if (keyCode == CONTROL)
      {
        y+=1;
      } else if (keyCode == ALT)
      {
        y-=1;
      }
      changeAngles=false;
    } else {
      if (key== 'q'){
        angles[0]-=radians(5);
      }
      if (key == 'w'){
        angles[0]+=radians(5);
      }
      if (key== 'e'){
        angles[1]-=radians(5);
      }
      if (key== 'r'){
        angles[1]+=radians(5);
      }
      if (key== 't'){
        angles[2]-=radians(5);
      }
      if (key== 'y'){
        angles[2]+=radians(5);
      }
      if (key== 'a'){
        angles[3]-=radians(5);
      }
      if (key== 's'){
        angles[3]+=radians(5);
      }
      if (key== 'd'){
        angles[4]-=radians(5);
      }
      if (key== 'f'){
        angles[4]+=radians(5);
      }
      if (key== 'g'){
        angles[5]-=radians(5);
      }
      if (key== 'h'){
        angles[5]+=radians(5);
      }
      changeAngles=true;
    }
  }
}
