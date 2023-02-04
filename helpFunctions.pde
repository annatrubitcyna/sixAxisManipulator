float round(float a, int n){
  return (round(a*pow(10, n)))/pow(10, n);
}

void draw_dotted_circle(float x, float y, float r){
  int n_dot=60;
  for (int i=0; i<n_dot; i+=2){
    arc(x, y, r, r, i*(2*PI/n_dot), (i+1)*(2*PI/n_dot));
  }
}

//только для векторов размерности 3
float[][] vect_mul(float[][] v1, float[][] v2){
  float vmx=v1[1][0]*v2[2][0]-v1[2][0]*v2[1][0];
  float vmy=-v1[0][0]*v2[2][0]+v1[2][0]*v2[0][0];
  float vmz=v1[0][0]*v2[1][0]-v1[1][0]*v2[0][0];
  float[][] vect_mul={{vmx},{vmy},{vmz}};
  return vect_mul;
}

float norm_vect(float[][] vect){
  int n=vect.length;
  float ans=0;
  for(int i=0;i<n;i++){
    ans+=vect[i][0]*vect[i][0];
  }
  return sqrt(ans);
}


int find(String str, String sub){
  for(int i=0;i<str.length();  i++){
    if(str.charAt(i)==sub.charAt(0)){
      boolean flag=true;
      for(int j=0; j<sub.length(); j++){
        if (str.charAt(i+j)!=sub.charAt(j)) {
          flag=false;
          break;
        }
      }
      if(flag){
        return i;
      }
    }
  }
  return -1;
}


boolean startswith(String str, String sub){
  for(int j=0; j<sub.length(); j++){
    if (str.charAt(j)!=sub.charAt(j)) {
      return false;
    }
  }
  return true;
}
