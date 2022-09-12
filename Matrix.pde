float[][] dot(float[][] first, float[][] second){
  int m=first.length;
  int n=second.length;
  int k=second[0].length;
  //println("nmk:", n, m, k);
  float[][] ans= new float[m][k];
  
  for (int i = 0; i < m; i++){
    for (int j = 0; j < k; j++){
      ans[i][j]=0;
      for (int f = 0; f < n; f++){
        ans[i][j]+=first[i][f]* second[f][j];
      }
    }
  }
  
  //float[][] T = ans;

  //println("Tm0:",T[0][0], T[0][1], T[0][2], T[0][3]);
  //println("Tm1:", T[1][0], T[1][1], T[1][2], T[1][3]);
  //println("Tm2:", T[2][0], T[2][1], T[2][2], T[2][3]);
  //println("Tm3:", T[3][0], T[3][1], T[3][2], T[3][3]);
  
  return ans;
}

float[][] transpose(float[][] matrix){
  int v=matrix.length;
  int h=matrix[0].length;
  float[][] matrixT=new float[h][v];
  for(int i=0; i<v; i++){
    for(int j=0; j<h; j++){
      matrixT[j][i]=matrix[i][j];
    }
  }
  return matrixT;
}

float[][] subM(float[][] first, float[][] second){
  int n=first.length;
  int k=first[0].length;
  float[][] ans= new float[n][k];
  
  for (int i = 0; i < n; i++){
    for (int j = 0; j < k; j++){
      ans[i][j]=first[i][j]-second[i][j];
    }
  }
  
  return ans;
}

float[][] dotL(float[][] first, float lambda){
  int n=first.length;
  int k=first[0].length;
  float[][] ans= new float[n][k];
  
  for (int i = 0; i < n; i++){
    for (int j = 0; j < k; j++){
      ans[i][j]=first[i][j]*lambda;
    }
  }
  
  return ans;
}
