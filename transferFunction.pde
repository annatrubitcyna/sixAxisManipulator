float[][][] getT3(float t1, float t2, float t3){
  t3 = t3 + PI / 2;
  
  //float[] a = {0, 0, l[2], 0, 0, 0, 0};
  //float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
  //float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};
  
  
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
  float[][] T_0_2=dot(T_0_1, T_1_2);
  float[][] T_0_3=dot(T_0_2, T_2_3);
  float[][][] T = {T_0_1, T_0_2, T_0_3};
  return T;
}

float[][][] getT(float t1, float t2, float t3, float t4, float t5, float t6){
  
  //float[] a = {1, 1, l[2], 1, 1, 1, 1};
  //float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
  //float[] d = {1, l[1], 1, 1, l[3], 1, l[4]};
   
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
  float[][][] T3 = getT3(t1, t2, t3);
  float[][] T_0_1=T3[0];
  float[][] T_0_2=T3[1];
  float[][] T_0_3=T3[2];
  float[][] T_0_4=dot(T_0_3, T_3_4);
  float[][] T_0_5=dot(T_0_4, T_4_5);
  float[][] T_0_6=dot(T_0_5, T_5_6);
  float[][][] T = {T_0_1, T_0_2, T_0_3, T_0_4, T_0_5, T_0_6};
  return T;
}

float[][] getR(float[][] T){  
  float[][] R = {{T[0][0], T[0][1], T[0][2]},
                  {T[1][0], T[1][1], T[1][2]},
                  {T[2][0], T[2][1], T[2][2]}}; //мб эту процедуру стоит вынести в отдельную функцию - отделить кусок от матрицы  
  return R;
}
