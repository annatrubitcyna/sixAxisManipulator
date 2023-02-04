float[][][] getUnitTwists(){
  float[][][] UnitTwists=new float[6][4][4];
  for(int i=0;i<6;i++){
    int a=0;
    if(i==1) a=1;    
    float[][] UnitTwistsi={{0,-1,0,0}, 
                           {1,0,0,-a},
                           {0,0,0,0},
                           {0,0,0,0}};
    UnitTwists[i]=UnitTwistsi;
  }
  return UnitTwists;
}
float[][] getExpWt(float[][] wt){
  float[][] w={{-wt[1][2]},{wt[0][2]},{-wt[0][1]}};
  float theta_w=norm_vect(w);
  if(round(theta_w, 5)!=0){ 
    wt=dotL(wt, 1/theta_w);
  }
  float[][] ExpWt= addM(eye(3), dotL(wt, sin(theta_w)));
  float[][] wtsq=dot(wt, wt);
  ExpWt= addM(ExpWt, dotL(wtsq, 1-cos(theta_w)));
  return ExpWt;
}

//float[][] getExpTwist(float[][] r, float[][] wt){
//  float[][] first={{1,0,0, r[0][0]},{0,1,0,r[1][0]},[0,0,1, r[2][0]}, {0,0,0,1}};
//  float[][] third={{1,0,0, -r[0][0]},{0,1,0,r[1][0]},[0,0,1, r[2][0]}, {0,0,0,1}};
//  float[][] ExpWt=getExpWt(wt)
//  float[][] second=blockMatrix(ExpWt, nullMatrix(3,1), nullMatrix(1,3), eye(1)}; //блочная матрица
//  float[][] ExpTwist= dot(first, dot(second, third));
//  return ExpTwist;
//}


float[][] getExpTwist(float[][] Twist){
  float[][] wt=blockOfMatrix(Twist, 0,0,2,2);
  float[][] v=blockOfMatrix(Twist, 0,3,2,3);
  float[][] w={{-wt[1][2]},{wt[0][2]},{-wt[0][1]}};
  //printMatrix(wt);
  float[][] ExpWt=getExpWt(wt);
  float[][] wTvw=dotL(w, dot(transpose(w), v)[0][0]);
  float[][] ExpTwist21=addM(   dot(subM(eye(3), ExpWt), vect_mul(w, v)),    wTvw);
  if(round(norm_vect(w), 5)!=0) ExpTwist21=dotL(ExpTwist21, 1/sq(norm_vect(w))); 
  float[][] ExpTwist=blockMatrix(ExpWt, ExpTwist21, nullMatrix(1,3), eye(1)); //блочная матрица
  return ExpTwist;  
}



float[][][] getHt0(){
  float[][] H10t0={{1,0,0, 0},
                   {0,0,-1,0},
                   {0,1,0,l[1]},
                   {0,0,0,1}};
  float[][] H20t0={{1,0,0, l[2]},
                   {0,0,-1,0},
                   {0,1,0,l[1]},
                   {0,0,0,1}};
  float[][] H30t0={{0,0,1, l[2]},
                   {0,-1,0,0},
                   {1,0,0,l[1]},
                   {0,0,0,1}};
  float[][] H40t0={{0,-1,0, l[2]+l[3]},
                   {0,0,-1,0},
                   {1,0,0,l[1]},
                   {0,0,0,1}};
  float[][] H50t0={{0,0,1, l[2]+l[3]},
                   {0,-1,0,0},
                   {1,0,0,l[1]},
                   {0,0,0,1}};
  
  float[][] H60t0={{0,0,1, l[2]+l[3]+l[4]},
                   {0,-1,0,0},
                   {1,0,0,l[1]},
                   {0,0,0,1}};
  float[][][] Ht0={H10t0, H20t0, H30t0, H40t0, H50t0, H60t0};
  return Ht0;
}


float[][][] getHt0_i_im1(){
  float[][] H10t0={{1,0,0, 0},
                   {0,0,-1,0},
                   {0,1,0,l[1]},
                   {0,0,0,1}};
  float[][] H21t0={{1,0,0, l[2]},
                   {0,1,0,0},
                   {0,0,1,0},
                   {0,0,0,1}};
  float[][] H32t0={{0,0,1, 0},
                   {1,0,0,0},
                   {0,1,0,0},
                   {0,0,0,1}};
  float[][] H43t0={{1,0,0, 0},
                   {0,0,1,0},
                   {0,-1,0,l[3]},
                   {0,0,0,1}};
  float[][] H54t0={{1,0,0, 0},
                   {0,0,-1,0},
                   {0,1,0,0},
                   {0,0,0,1}};
  
  float[][] H65t0={{1,0,0, 0},
                   {0,1,0,0},
                   {0,0,1,l[4]},
                   {0,0,0,1}};
  float[][][] Ht0_i_im1={H10t0, H21t0, H32t0, H43t0, H54t0, H65t0};
  return Ht0_i_im1;
}

float[][] normalizeTwist(float[][] Twist){
  float[][] wt=blockOfMatrix(Twist, 0,0,2,2);
  float[][] v=blockOfMatrix(Twist, 0,3,2,3);
  float[][] w={{-wt[1][2]},{wt[0][2]},{-wt[0][1]}};
  if(round(norm_vect(w), 5)!=0)  wt=dotL(wt, 1/norm_vect(w));
  if(round(norm_vect(v), 5)!=0) v=dotL(v, 1/norm_vect(v));
  float[][] UnitTwist= blockMatrix(wt,v, nullMatrix(1,3),eye(1));
  return UnitTwist;
}

float[][] getTwistfromMatrix(float[][]  TwistM){
  float[][] wt=blockOfMatrix(TwistM, 0,0,2,2);
  float[][] v=blockOfMatrix(TwistM, 0,3,2,3);
  float[][] w={{-wt[1][2]},{wt[0][2]},{-wt[0][1]}};
  float[][] Twist={{w[0][0]},{w[1][0]},{w[2][0]},{v[0][0]},{v[1][0]},{v[2][0]}};
  return Twist;
}



float[][][] straightTwist(){
  float[][][] UnitTwists=getUnitTwists();
  float[][][] Ht0=getHt0();
  float[][][] expMul=new float[6][4][4];
  //float[][] wt={{0, -1,0},{1,0,0}, {0,0,0}};
  //float[][] r=nullMatrix(1, 3);
  float[][][] H=new float[6][4][4];
  

  for(int i=0; i<6; i++){
    float[][] UnitTwist=UnitTwists[i];
    float[][] ExpTwist;
    if (i==0){
      ExpTwist=getExpTwist(dotL(UnitTwist, angles[i]));
      expMul[i]=ExpTwist;
      H[i]=dot(ExpTwist, Ht0[i]);
    }
    else{
      //float[][] TwistI0=dot(H[i-1], dot(UnitTwist, inverse(H[i-1])));
      //float[][] UnitTwistI0=normalizeTwist(TwistI0);
      //ExpTwist=getExpTwist(dotL(UnitTwistI0, angles[i]));
      ExpTwist=getExpTwist(dotL(UnitTwist, angles[i]));
      ExpTwist=dot(Ht0[i-1], dot(ExpTwist, inverse(Ht0[i-1])));
      expMul[i]=dot(expMul[i-1], ExpTwist);
      H[i]=dot(expMul[i], Ht0[i]);
    }
    //print(i); printMatrix(H[i]);
  }
  return H;
}


float[][][] straightTwist_new(){
  float[][][] UnitTwists=getUnitTwists();
  float[][][] Ht0_i_im1=getHt0_i_im1();
  float[][][] H=new float[6][4][4];
  

  for(int i=0; i<6; i++){
    float[][] UnitTwist=UnitTwists[i];
    float[][] ExpTwist=getExpTwist(dotL(UnitTwist, angles[i]));
    float[][] H_i_im1=dot(ExpTwist, Ht0_i_im1[i]);
    if (i==0){
      H[i]=H_i_im1;
    }
    else{
      H[i]=dot(H[i-1], H_i_im1);
    }
    //print(i); printMatrix(H[i]);
  }
  return H;
}

float[][] getGeomJTwist(){
  float[][][] UnitTwists=getUnitTwists();
  float[][] Jacobian=new float[6][6];
  float[][][] H=straightTwist_new();
  for(int i=0; i<6; i++){
    float[][] Ti;
    if (i==0) Ti=UnitTwists[i];
    else Ti=dot(H[i-1], dot(UnitTwists[i], inverse(H[i-1])));
    float[][] Twisti=getTwistfromMatrix(Ti);
    Jacobian[i]=transpose_column_to_row(Twisti);
  }
  Jacobian=transpose(Jacobian);
  return Jacobian;
}


float[][] straightSpeedTransferTwist( float[][] theta_s){
  float[][] J=getGeomJTwist();
  float[][] grip_s= dot(J, theta_s);
  return grip_s;
}

float[][] backSpeedTransferTwist(float[][] grip_s){
  float[][] J= getGeomJTwist();;
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
