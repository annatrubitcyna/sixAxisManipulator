void goByGcodes(){
  
  
  float[][] trajectory=getTrajectoryByGcode();
  float table_x=100;
  float table_y=100;
  float table_z=100;
  R[0][0]= 1;R[0][1]= 0; R[0][2]= 0;
  R[1][0]= 0; R[1][1]= -1; R[1][2]= 0;
  R[2][0]= 0; R[2][1]= 0; R[2][2]= -1;
  start_coords(table_x, table_y, table_z, R);
  for(int i=0; i<trajectory.length; i++){
    float[] start_point={trajectory[i][0], trajectory[i][1], trajectory[i][2]};
    float[] next_point={trajectory[i+1][0], trajectory[i+1][1], trajectory[i+1][2]};
    float speed=trajectory[i][4];
    goWithSpeedPoinToPoint(start_point, next_point, speed);
  }
  
}

float[][] getTrajectoryByGcode(){
  ArrayList<float[]> trajectory =new ArrayList<float[]>();
  float x_g=0; float y_g=0; float z_g=0; float e_g=0; float f_g=0;
  boolean flag_line=true;
  String line;
  while(flag_line){
    try {
      line = gcodeReader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
      flag_line=false;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();
      flag_line=false;
    } else {
      String[] lines = split(line, TAB);
      for(int j=0; j<lines.length; j++){
        line=lines[j];
        //print(line);
        if (startswith(line, "G1 ")){
          int i;
          i = find(line, "Z") + 1;
          if (i != 0){    // because if Z hasn't been found that line.find=-1, i=0 //<>//
              String z_gs = "";
              print(line.length());
              while (((i == (line.length() - 1)) | (line.charAt(i) == ' ') | (line.charAt(i) == ';')) == false){
                  z_gs += line.charAt(i);
                  i += 1;
              }
              z_g = float(z_gs);
          }
          
          i = find(line, "X") + 1;
          if (i != 0){ 
              String x_gs = "";
              while ((i == line.length() - 1) | (line.charAt(i) == ' ') | (line.charAt(i) == ';') == false){
                  x_gs += line.charAt(i);
                  i += 1;
              }
              x_g = float(x_gs);
          }
          
          i = find(line, "Y") + 1;
          if (i != 0){ 
              String y_gs = "";
              while ((i == line.length() - 1) | (line.charAt(i) == ' ') | (line.charAt(i) == ';') == false){
                  y_gs += line.charAt(i);
                  i += 1;
              }
              y_g = float(y_gs);
          }
          
          i = find(line, "E") + 1;
          if (i != 0){ 
              String e_gs = "";
              while ((i == line.length() - 1) | (line.charAt(i) == ' ') | (line.charAt(i) == ';') == false){
                  e_gs += line.charAt(i);
                  i += 1;
              }
              e_g = float(e_gs);
          }
          
          i = find(line, "F") + 1;
          if (i != 0){ 
              String f_gs = "";
              while ((i == line.length() - 1) | (line.charAt(i) == ' ') | (line.charAt(i) == ';') == false){
                  f_gs += line.charAt(i);
                  i += 1;
              }
              f_g = float(f_gs);
          }
          float[] new_point={x_g, y_g, z_g, e_g, f_g};
          trajectory.add(new_point);
          print(new_point[0]);
        }
      }
    }
  }
  float[][] trajectory_array=trajectory.toArray(new float[trajectory.size()][5]);
  printMatrix(trajectory_array);
  return trajectory_array;
}
