float[][] getJ(float[][][] T){
  float[][] J= new float[6][6];
  float[][][] p={{{0},{0},{0}}, {{x1},{y1},{z1}}, {{x2},{y2},{z2}}, {{x2},{y2},{z2}}, {{x3},{y3},{z3}}, {{x3},{y3},{z3}}, {{x},{y},{z}}};
  for(int i=0; i<6; i++){
    float[][] Rim1={{1,0,0},{0,1,0},{0,0,1}};
    if(i!=0) Rim1=getR(T[i-1]);
    float[][] z_v={{0},{0},{1}};
    float[][] zi0=dot(Rim1, z_v);
    float[][] ps=subM(p[6],p[i]);
    //ps=dot(inverse(Rim1), ps);
    float[][] Jvi=vect_mul(zi0, ps);
    J[0][i]= round(Jvi[0][0],5); J[1][i]= round(Jvi[1][0],5); J[2][i]= round(Jvi[2][0],5);
    J[3][i]= round(zi0[0][0],5); J[4][i]= round(zi0[1][0],5); J[5][i]= round(zi0[2][0],5);
  }
  printMatrix(J);
  return J;
}

float[][] straightSpeedTransfer(float[][][] T, float[][] theta_s){
  float[][] J=getJ(T);
  float[][] grip_s= dot(J, theta_s);
  return grip_s;
}

float[][] backSpeedTransfer(float[][][] T, float[][] grip_s){
  float[][] J= getJ(T);
  float detJ=det(J);
  float[][] theta_s={{0},{0},{0}, {0},{0},{0}};
  //printMatrix(J);
  if(detJ!=0){
    float[][] inverseJ=inverse(J);
    theta_s= dot(inverseJ, grip_s);
    singularity=false;
  }
  else singularity=true;
  return theta_s;
}
