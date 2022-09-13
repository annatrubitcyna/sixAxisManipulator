boolean firstCloserToThird(float first, float second, float third){
  return abs(third-first)<abs(third-second);
}

float[] newThreeAxisBackwardTransfer(float x, float y, float z)
{
  float[] a = {0, 0, l[2], l[3]};  // массив значений a_i
  float[] d = {0, l[1], 0, 0};  // массив значений d_i
  float r1 = sqrt(sq(x)+sq(y));
  float r2 = z - d[1];
  float r3 = sqrt(sq(r1)+sq(r2));
  //t1 = atan2(y, x);

  if (abs((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3))<=1) {
    float psi1 = acos((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3));
    float psi2 = atan2(r2, r1);
    if (abs((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]))<=1) {
      //t2 = psi2 + psi1;
      float psi3 = acos((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]));
      //t3 = -(PI - psi3);
      exeption="OK";
      
      
      float t11=atan2(y, x);
      float t12;
      if(t11>0) t12=t11-PI;
      else t12=t11+PI;
      //float t12=(atan2(y, x)+PI)%(2*PI);
      
      float t211=(psi2+psi1)%(2*PI);
      float t212=(psi2-psi1)%(2*PI);
      
      float t221=(PI-(psi2+psi1))%(2*PI);
      float t222=(PI-(psi2-psi1))%(2*PI);
      
      
      
      float t31=psi3-PI;
      float t32=PI-psi3;
      
      if(firstCloserToThird(t11, t12, angles[0])){
        t1=t11;
        if(firstCloserToThird(t211, t212, angles[1])){
          t2=t211;
          t3=t31;
        }
        else{
          t2=t212;
          t3=t32;
        }
      }
      else{
        t1=t12;
        if(firstCloserToThird(t221, t222, angles[1])){
          t2=t221;
          t3=t32;
        }
        else{
          t2=t222;
          t3=t31;
        }
      }
      
      if(abs(t1-PI)<0.01){
        print("!!!!");
      }
      
      
      //чтоб не было резкого перехода
      //if(t1-PI/2>0.001 | (-PI/2-t1)>0.001){
      //  t1= atan(y/x);
      //  t2=PI-(psi2-psi1);
      //  //t3=-t3;
      //}
    }
    else{
      exeption="threeAxisBackwardTransferEx";
    }
  }
  else{
    exeption="threeAxisBackwardTransferEx";
  }
  
  float[] angles={t1, t2, t3};
  return angles;
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
      exeption="OK";
    }
    else{
      exeption="threeAxisBackwardTransferEx";
    }
  }
  else{
    exeption="threeAxisBackwardTransferEx";
  }
  
  float[] angles={t1, t2, t3};
  return angles;
}

float[] orientationBackwardsTransfer(float t1, float t2, float t3, float[][] R)
{
                    
  float[][] T3 = getT3(t1, t2, t3)[2];
  float[][] R3= getR(T3);
  float[][] R3T =transpose(R3);
  float[][] R36= dot(R3T, R);
  //print("R ", R[2][2], "\n");
  //print("R3*R36 ", dot(R3, R36)[2][2], "\n");
  return findEulerAngles(R36);
}

float[] backwardTransfer(float x, float y, float z, float[][] R)
{
  //+- не косячная запись p40=p60-d6*R60*[0; 0;1]
  float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};
  float[][] k={{0}, {0}, {1}};
  float[][] p46=dotL(dot(R, k), d[6]);
  float[][] p60={{x}, {y}, {z}};
  float[][] p4=subM(p60, p46);
  
  float[] threeAngles = newThreeAxisBackwardTransfer(p4[0][0], p4[1][0], p4[2][0]); //получаем первые 3 угла из геометрии
  t1=round(threeAngles[0], 5); t2=round(threeAngles[1], 5); t3=round(threeAngles[2], 5); //инициализируем
  threeAngles = orientationBackwardsTransfer(t1, t2, t3, R); //получаем последние 3 угла из первых 3х и ориентации
  t4=round(threeAngles[0], 5); t5=round(threeAngles[1], 5); t6=round(threeAngles[2], 5);
  
  float[] newAngles={t1, t2, t3, t4, t5, t6};
  //float[] newAngles={t1, t2, t3, angles[3], angles[4], angles[5]};
  println("t", t1, t2, t3, t4, t5, t6);
  return newAngles;
}

float[] findEulerAngles(float[][] R){
  if(R[2][2]==1){
    t5=0;
    t6=0; //выбираем t6 любым
    t4=atan2(R[1][0], R[0][0])-t6;
  }
  else if (R[2][2]==-1){
    t5=0;
    t6=0; //выбираем t6 любым
    t4=atan2(-R[0][1], -R[0][0])+t6;
  }
  else{
  int sign=1; //1 или -1
  t5=atan2(sign*sqrt(1-sq(R[2][2])), R[2][2]);
  t4=atan2(sign*R[1][2], sign*R[0][2]);
  t6=atan2(sign*R[2][1], -sign*R[2][0]);
  
  //t4=acos(R[2][2]);
  //t5=atan2(R[1][2], R[0][2]);
  //t6=atan2(R[2][1], -R[2][0]);
  }
  float[] angles={t4, t5, t6};
  return angles;
  
}
