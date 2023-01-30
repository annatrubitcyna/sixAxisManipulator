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
  float[][] ExpWt= addM(eye(3), dotL(wt, sin(1)));
  float[][] wtsq=dot(wt, wt);
  ExpWt= addM(ExpWt, dotL(wtsq, 1-cos(1)));
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
  float[][] wt=blockOfMatrix(Twist, 0,0,2,2); //<>//
  float[][] v=blockOfMatrix(Twist, 0,3,2,3);
  float[][] w={{-wt[1][2]},{wt[0][2]},{-wt[0][1]}};
  printMatrix(wt);
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


float[][][] straightTwist(){
  float[][][] UnitTwists=getUnitTwists(); //<>//
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
      float[][] TwistI0=dot(H[i-1], dot(UnitTwist, inverse(H[i-1])));
      ExpTwist=getExpTwist(dotL(TwistI0, angles[i]));
      expMul[i]=dot(expMul[i-1], ExpTwist);
      H[i]=dot(expMul[i], Ht0[i]);
    }
  }
  return H;
}
