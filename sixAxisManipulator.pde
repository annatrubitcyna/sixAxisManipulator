////тк надо разбираться в прямой/обратной задачей кинематики, работать с матрицами и ориентацией
////в начале решила разобраться с прямой

///прямая работает, начала делать обратную пока в никаком виде, скопирована прямая и добавлено несколько функций 

//final float[] l={0, 100, 100, 100, 100};

//private float x=l[2]+l[3]+l[4];
//private float y=0;
//private float z=l[1];
//private float x1;
//private float y1;
//private float z1;
//private float x2;
//private float y2;
//private float z2;
//private float x3;
//private float y3;
//private float z3;
//private float x4;
//private float y4;
//private float z4;
//private float x5;
//private float y5;
//private float z5;
//private float t1=0;
//private float t2=PI/2;
//private float t3=0;
//private float t4=0;
//private float t5=0;
//private float t6=0;

//float[] angles=backwardTransfer(x, y, z);
//boolean changeAngles=false;


//float[] backwardTransfer(float x, float y, float z)
//{
//  float[] a = {0, 0, l[2], l[3]};  // массив значений a_i
//  float[] d = {0, l[1], 0, 0};  // массив значений d_i
//  float r1 = sqrt(sq(x)+sq(y));
//  float r2 = z - d[1];
//  float r3 = sqrt(sq(r1)+sq(r2));
//  t1 = atan2(y, x);

//  if(abs((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3))<=1){
//    float psi1 = acos((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3));
//    float psi2 = atan2(r2, r1);
//    if(abs((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]))<=1){
//      t2 = psi2 + psi1;
//      float psi3 = acos((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]));
//      t3 = PI - psi3;
//    }
//  }
//  float[] angles={t1, t2, t3, t4, t5, t6};
//  return angles;
//}

//float[][] straightTransfer(float t1, float t2, float t3, float t4, float t5, float t6)
//{
//  x1 = 0;
//  y1 = 0;
//  z1 = l[1];
//  x2 = (l[2] * cos(t2)) * cos(t1);
//  y2 = (l[2] * cos(t2)) * sin(t1);
//  z2 = l[1]+ l[2] * sin(t2);
//  x3 = (l[2] * cos(t2) + l[3] * cos(t3)) * cos(t1);
//  y3 = (l[2] * cos(t2) + l[3] * cos(t3)) * sin(t1);
//  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t3); 
//  x = l[2] * cos(t2) + l[3] * cos(t3) + l[4]  * cos(-t5 - (-t3 + t2)) * cos(t1);
//  y = l[2] * cos(t2) + l[3] * cos(t3) + l[4]  * cos(-t5 - (-t3 + t2)) * sin(t1);
//  z = l[1] + l[2] * sin(t2) + l[3] * sin(-t3 - t2) + l[4] * sin(t5 + (t3 + t2));
//  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x4, y4, z4}, {x5, y5, z5}, {x, y, z}};
//  return coords;
//}



//void drawManipulator()
//{
//  clear();
//  stroke(255, 0, 0);
//  strokeWeight(7);
//  strokeCap(ROUND);
//  if(!changeAngles){
//    angles=backwardTransfer(x, y, z);
//  }
//  float[][] coords=straightTransfer(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
//  x1=coords[0][0];
//  y1=coords[0][1];
//  z1=coords[0][2];
  
//  x2=coords[1][0];
//  y2=coords[1][1];
//  z2=coords[1][2];
  
//  x3=coords[2][0];
//  y3=coords[2][1];
//  z3=coords[2][2];
  
//  x4=coords[3][0];
//  y4=coords[3][1];
//  z4=coords[3][2];
  
//  x5=coords[4][0];
//  y5=coords[4][1];
//  z5=coords[4][2];
  
//  x=coords[5][0];
//  y=coords[5][1];
//  z=coords[5][2];
  
//  line(0, 0, 0, x1, y1, z1);
//  stroke(255, 255, 0);
//  line(x1, y1, z1, x2, y2, z2);
//  stroke(0, 0, 255);
//  line(x2, y2, z2, x3, y3, z3);
//  stroke(0, 255, 255);
//  line(x3, y3, z3, x4, y4, z4);
//  stroke(255, 0, 255);
//  line(x4, y4, z4, x5, y5, z5);
//  stroke(255, 0, 0);
//  line(x5, y5, z5, x, y, z);
  
//  if (keyPressed){
//    if (key == CODED){
//      if (keyCode == UP)
//      {
//        z+=1;
//      } else if (keyCode == DOWN)
//      {
//        z-=1;
//      } else if (keyCode == RIGHT)
//      {
//        x+=1;
//      } else if (keyCode == LEFT)
//      {
//        x-=1;
//      }else if (keyCode == CONTROL)
//      {
//        y+=1;
//      } else if (keyCode == ALT)
//      {
//        y-=1;
//      }
//      changeAngles=false;
//    }
//    else{
//      if (key== 'a'){
//        angles[0]-=radians(5);
//      }
//      if (key == 's'){
//        angles[0]+=radians(5);
//      }
//      if (key== 'f'){
//        angles[1]-=radians(5);
//      }
//      if (key== 'd'){
//        angles[1]+=radians(5);
//      }
//      if (key== 'g'){
//        angles[2]-=radians(5);
//      }
//      if (key== 'h'){
//        angles[2]+=radians(5);
//      }
//      changeAngles=true;
//    }
//  }
//}
