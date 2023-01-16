void drawDHAngles(){
  // не совсем можно назвать их углами Денавита Хартенберга (но условно соответствуют рисунку и центрам систем координат)
  stroke(255, 255, 255);
  strokeWeight(7); //7
  
  pushMatrix(); 
  for (int i=0; i<6; i++){
    if(angles[i]>0)  arc(0, 0, 100, 100, 0, angles[i]);
    else arc(0, 0, 100, 100, angles[i], 0);
    //переходим в следующую систему координат, чтобы там нарисовать угол
    if(i==2) rotateZ(angles[i]+PI/2);
    else rotateZ(angles[i]);
    translate(0, 0, d[i+1]);
    translate(a[i+1], 0, 0);
    rotateX(alpha[i+1]);
    
  }
  
  popMatrix();
}

void drawAngles(){
  // более удобное для понимания расположение углов
  strokeWeight(2);
  stroke(155, 155, 155);
  strokeJoin(MITER);
  
  pushMatrix(); 
  
  for (int i=0; i<3; i++){
    translate(0, 0, d[i]);
    translate(a[i], 0, 0);
    rotateX(alpha[i]);
    
    line(0, 0, 0, 50, 0, 0);
    if(angles[i]>0)  arc(0, 0, 100, 100, 0, angles[i]);
    else arc(0, 0, 100, 100, angles[i], 0);
    if(i==2) rotateZ(angles[i]+PI/2);
    else rotateZ(angles[i]);
  }
  
  translate(0, 0, d[3]);
  translate(a[3], 0, 0);
  rotateX(alpha[3]);
  translate(0, 0, d[4]+d[6]*cos(angles[4]));
  float d_a4=2*d[6]*sin(angles[4]);
  if(angles[3]>0)  arc(0, 0, d_a4, d_a4, 0, angles[3]);
  else arc(0, 0, d_a4, d_a4, angles[3], 0);
  translate(0, 0, -d[4]-d[6]*cos(angles[4]));
  rotateZ(angles[3]);
  
  translate(0, 0, d[4]);
  translate(a[4], 0, 0);
  rotateX(alpha[4]);
  line(0, 0, 0, 0, -100, 0);
  if(angles[4]>0)  arc(0, 0, 100, 100, -PI/2, -PI/2+angles[4]);
  else arc(0, 0, 100, 100, -PI/2+angles[4], -PI/2);
  rotateZ(angles[4]);
  
  translate(0, 0, d[5]);
  translate(a[5], 0, 0);
  rotateX(alpha[5]);
  translate(0, 0, d[6]);
  if(angles[5]>0)  arc(0, 0, 40, 40, 0, angles[5]);
  else arc(0, 0, 40, 40, angles[5], 0);
  rotateZ(angles[5]);
  
  popMatrix();
}
