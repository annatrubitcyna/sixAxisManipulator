void check_workspace_to_print(){
  R[0][0]= 1;R[0][1]= 0; R[0][2]= 0;
  R[1][0]= 0; R[1][1]= -1; R[1][2]= 0;
  R[2][0]= 0; R[2][1]= 0; R[2][2]= -1;
  int n=50;
  float x_max=300;
  float x_min=-300;
  float y_max=300;
  float y_min=-300;
  float z_max=200;
  float z_min=0;
  workspace=new ArrayList<float[]>();
  for(int i=0; i<n; i++){
    for(int j=0; j<n; j++){
      for(int k=0; k<n; k++){
        float x_check=x_min+(x_max-x_min)*k/n;
        float y_check=y_min+(y_max-y_min)*j/n;
        float z_check=z_min+(z_max-z_min)*i/n;        
        angles=backwardTransfer(x_check, y_check, z_check, R);
        if(exeption.equals("OK")){
          float[] new_check_point={x_check,y_check,z_check};
          workspace.add(new_check_point);
        }
      }
    }
  }
}

void draw_workspace(){
    for(int i=0; i<workspace.size()-1; i++){
      stroke(255, 255, 255);
      strokeWeight(3);
      line(workspace.get(i)[0], workspace.get(i)[1], workspace.get(i)[2], workspace.get(i+1)[0], workspace.get(i+1)[1], workspace.get(i+1)[2]);
    }
}
