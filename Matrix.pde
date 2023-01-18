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
  return ans;
}

void printMatrix(float[][] M){
  print("[");
  for(int i=0; i<M.length; i++){
    for (int j=0; j<M[0].length; j++){
      print(M[i][j], ",");
    }
    println("]");
  }
  print("]");
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

float[][] addM(float[][] first, float[][] second){
  int n=first.length;
  int k=first[0].length;
  float[][] ans= new float[n][k];
  
  for (int i = 0; i < n; i++){
    for (int j = 0; j < k; j++){
      ans[i][j]=first[i][j]+second[i][j];
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

//только для матрицы 3 на 3
float det(float[][] matrix){
  float det3=matrix[0][0]*matrix[1][1]*matrix[2][2]+matrix[0][2]*matrix[1][0]*matrix[2][1]+matrix[2][0]*matrix[0][1]*matrix[1][2];
  det3-=(matrix[0][2]*matrix[1][1]*matrix[2][0] + matrix[0][0]*matrix[1][2]*matrix[2][1] +matrix[2][2]*matrix[1][0]*matrix[0][1]);
  return det3;
}

//только для матрицы 4 на 4
float det4(float[][] matrix){
  float det=0;
  //разложение по 1 столбцу
  for(int i=0; i<4; i++){ 
      //минор
      float[][] matrix3=new float[3][3];
      int i3=0; int i3s=0; 
      while (i3<3){
        if(i3==i) i3s+=1;
        int  j3=0; int j3s=0;
        while(j3<3){
          if(j3==0) j3s+=1;
          matrix3[i3][j3]=matrix[i3s][j3s];
          j3+=1; j3s+=1;
        }
        i3+=1; i3s+=1;
      }
      //алг дополенение (определитель)
      det+=matrix[i][0]*pow(-1, i)*det(matrix3); //<>//
    }
  return det; //<>//
}

//только для матрицы 3 на 3
float[][] inverse(float[][] matrix){
  float[][] matrixAt=new float[3][3];
  matrixAt[0][0]=matrix[1][1]*matrix[2][2]-matrix[1][2]*matrix[2][1];
  matrixAt[0][1]=-(matrix[1][0]*matrix[2][2]-matrix[2][0]*matrix[1][2]);
  matrixAt[0][2]=matrix[1][0]*matrix[2][1]-matrix[2][0]*matrix[1][1];
  matrixAt[1][0]=-(matrix[0][1]*matrix[2][2]-matrix[0][2]*matrix[2][1]);
  matrixAt[1][1]=matrix[0][0]*matrix[2][2]-matrix[2][0]*matrix[0][2];
  matrixAt[1][2]=-(matrix[0][0]*matrix[2][1]-matrix[2][0]*matrix[0][1]);
  matrixAt[2][0]=matrix[0][1]*matrix[1][2]-matrix[1][1]*matrix[0][2];
  matrixAt[2][1]=-(matrix[0][0]*matrix[1][2]-matrix[1][0]*matrix[0][2]);
  matrixAt[2][2]=matrix[0][0]*matrix[1][1]-matrix[1][0]*matrix[0][1];
  float[][] matrixAtT=transpose(matrixAt);
  float[][] inv_matrix= dotL(matrixAtT, 1/det(matrix));
  return inv_matrix;
}

//только для матрицы 4 на 4
float[][] inverse4(float[][] matrix){
  float[][] matrixAt=new float[4][4];
  for(int i=0; i<4; i++){
    for (int j=0; j<4; j++){
      //минор
      float[][] matrix3=new float[3][3];
      int i3=0; int  i3s=0;
      while (i3<3){
        if(i3==i) i3s+=1;
        int  j3=0; int j3s=0;
        while(j3<3){
          if(j3==j) j3s+=1;
          matrix3[i3][j3]=matrix[i3s][j3s];
          j3+=1; j3s+=1;
        }
        i3+=1; i3s+=1;
      }
      //алг дополенение (определитель)
      matrixAt[i][j]=pow(-1, i+j)*det(matrix3);
    }
  }
  float[][] matrixAtT=transpose(matrixAt);
  float[][] inv_matrix= dotL(matrixAtT, 1/det4(matrix));
  return inv_matrix;
}
