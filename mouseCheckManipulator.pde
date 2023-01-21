float[][] matrixX(float tx){
  float[][] matrixX={{1,0,0, 0},
                      {0, cos(tx),-sin(tx), 0}, 
                      {0, sin(tx), cos(tx), 0}, 
                      {0,0,0,1}};
  return  matrixX;
}

float[][] matrixY(float ty){
  float[][] matrixY={{cos(ty),0, sin(ty), 0},
                      {0, 1,0, 0}, 
                      {-sin(ty), 0, cos(ty), 0}, 
                      {0,0,0,1}};
  return  matrixY;
}

float[][] matrixZ(float tz){
  float[][] matrixZ={{cos(tz),-sin(tz), 0, 0}, 
                    {sin(tz), cos(tz), 0, 0}, 
                    {0,0, 1, 0}, 
                    {0,0,0,1}};
  return  matrixZ;
}
float[][] matrixTranslate(float x, float y, float z){
  float[][] matrixTranslate={{1,0, 0, x}, 
                    {0, 1, 0, y}, 
                    {0,0, 1, z}, 
                    {0,0,0,1}};
  return  matrixTranslate;
}


void mouseCheck(){
  if(mousePressed==true){
    changeAngles=false;
    //координаты мыши в трехмерном пространстве без поворотов и смещений
    float x_mouse=mouseX;
    float y_mouse=mouseY;
    float z_mouse=0;
    float[][] mouse_coords={{x_mouse},{y_mouse},{z_mouse}, {1}};
    
    //Transformations
    float[][] MTr1={{-1, 0,0, 0},{0,1,0, 0},{0,0,1, 0}, {0,0,0,1}}; //scale(-1, 1, 1);
    float[][] MTr2=matrixX(PI/2); //rotateX(PI/2);
    float[][] MTr3=matrixZ(PI/2); //rotateZ(PI/2);
    float[][] MTr4=matrixTranslate(1*sceBoxSize, width/2, -height*0.6); //translate(1*sceBoxSize, width/2, -height*0.6);
    float[][] MTr5=matrixTranslate(camTX,camTY,camTZ); //translate(camTX,camTY,camTZ);
    //float[][] MTr6={{targetCamRX, 0,0, 0},{0,targetCamRY,0, 0},{0,0, targetCamRZ, 0}, {0,0,0,1}}; //smoothRX(targetCamRX); smoothRY(targetCamRY); smoothRZ(targetCamRZ);
    float[][] MTr7=matrixX(radians(camRX)); //rotateX(radians(camRX));
    float[][] MTr8=matrixY(radians(camRY)); //rotateY(radians(camRY));
    float[][] MTr9=matrixZ(radians(camRZ)); //rotateZ(radians(camRZ));
    float[][] MTr10={{1, 0,0, 0},{0,-1,0, 0},{0,0,-1, 0}, {0,0,0,1}};; 
    
    float[][] MTr_plane_to_3D= dot(MTr10, dot(MTr9, dot(MTr8, dot(MTr7, dot(MTr5, dot(MTr4, dot(MTr3, dot(MTr2, MTr1))))))));
    //float[][] MTr_plane_to_3D_inv=inverse4(MTr_plane_to_3D); //<>// //<>//
    float[][] mouse_coords_3D= dot(MTr_plane_to_3D, mouse_coords); //координаты мышки в 3х-мерном пространстве с учетом камеры и сдвигов
    //println("!!!");
    //printMatrix(mouse_coords_3D);
    //mouse_coords_3D[1][0]=-mouse_coords_3D[1][0];
    //mouse_coords_3D[2][0]=-mouse_coords_3D[2][0];
    //эти 2 точки тоже лежат в плоскости экрана, найдем их координаты в 3д, чтобы составить уравнение плоскости и найти вектор нормали
    float[][] point1_coords={{0},{0},{0}, {1}};  
    float[][] point2_coords={{100},{0},{0}, {1}}; //<>// //<>//
    float[][] point3_coords={{0},{100},{0}, {1}};
    float[][] point1_coords_3D=dot(MTr_plane_to_3D, point1_coords);
    float[][] point2_coords_3D=dot(MTr_plane_to_3D, point2_coords);
    float[][] point3_coords_3D=dot(MTr_plane_to_3D, point3_coords);
    //println("2");
    //printMatrix(point2_coords_3D);
    //println("3");
    //printMatrix(point3_coords_3D);
    //координаты вектора нормали (не нормарованные)
    float[][] v1=subM(point1_coords, point2_coords);
    float[][] v2=subM(point1_coords, point3_coords);
    float[][] v1_3l={v1[0],v1[1],v1[2]};
    float[][] v2_3l={v2[0],v2[1],v2[2]};
    //println("2");
    //printMatrix(v1_3l);
    //println("3");
    //printMatrix(v2_3l);
    
    //веторное произведение двух веторов, лежащих в плоскости -вектор нормали
    float[][] normal=vect_mul(v1_3l, v2_3l);
    normal=dot(MTr_plane_to_3D, normal);
    //printMatrix(normal);
    float nx=normal[0][0]; float ny=normal[1][0]; float nz=normal[2][0];
    
    //коэффициент, необходимый дальше
    float a=(nx*(x-mouse_coords_3D[0][0])+ny*(y-mouse_coords_3D[1][0])+nz*(z-mouse_coords_3D[2][0]))/ (sq(nx)+sq(ny)+sq(nz)); //<>// //<>//
    //println(a);
    float[][] mouse_coords_3D_3l= {mouse_coords_3D[0], mouse_coords_3D[1], mouse_coords_3D[2]};
    //ближайшая к концу манипулятора точка, лажащая на прямой через точку мышки перпендикулярно плоскости экрана
    float[][] mouse_man_coords_3D= addM(mouse_coords_3D_3l, dotL(normal, a));
    //printMatrix(mouse_man_coords_3D);
    
    x=mouse_man_coords_3D[0][0];
    y=mouse_man_coords_3D[1][0];
    z=mouse_man_coords_3D[2][0];
  }
}
