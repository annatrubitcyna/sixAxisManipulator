float[][] getJ(float[][][] T){
  float[][] J= new float[6][6];
  float[][][] p={{{0},{0},{0}}, {{x1},{y1},{z1}}, {{x2},{y2},{z2}}, {{x2},{y2},{z2}}, {{x3},{y3},{z3}}, {{x3},{y3},{z3}}, {{x},{y},{z}}};
  for(int i=0; i<6; i++){
    float[][] Ri={{1,0,0},{0,1,0},{0,0,1}};
    if(i!=0) Ri=getR(T[i-1]);
    float[][] z_v={{0},{0},{1}};
    float[][] zi0=dot(Ri, z_v);
    float[][] ps=subM(p[6],p[i]);
    float[][] Jvi=vect_mul(zi0, ps);
    J[0][i]= Jvi[0][0]; J[1][i]= Jvi[1][0]; J[2][i]= Jvi[2][0];
    J[3][i]= zi0[0][0]; J[4][i]= zi0[1][0]; J[5][i]= zi0[2][0];
  }
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
  print("det "); println(detJ);
  if(detJ!=0){
    float[][] inverseJ=inverse(J);
    print(inverseJ[0][0]);
    theta_s= dot(inverseJ, grip_s);
    singularity=false;
  }
  else singularity=true;
  return theta_s;
}
