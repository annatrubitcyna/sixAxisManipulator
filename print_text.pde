//useful information about text:
//text(float, x, y) always print a number with 3 decimal places
 
private float k=1.2; //length factor between strings
int start_x;
int start_y;
int text_size;

void print_angle(String name, String letters, int n){
  start_x=1200;
  start_y=100;
  text_size=40;
  textSize(text_size);
  text(name, start_x, start_y+text_size*k*(n-1));
  text(round(angles[n-1]*180/PI),start_x+5*text_size/2, start_y+text_size*k*(n-1));
  text(angles[n-1],start_x+7*text_size, start_y+text_size*k*(n-1));
  
  //how can we change the angle (keys)
  textSize(30);
  text(letters, start_x-3*text_size/2, start_y+text_size*k*(n-1));
}
void print_c23(){
  start_x=100;
  start_y=270;
  text_size=30;
  
  textSize(text_size);
  text("X2: ", start_x, start_y);
  text(x2,start_x+5*text_size/2, start_y);
  text("Y2: ", start_x, start_y+text_size*k);
  text(y2,start_x+5*text_size/2, start_y+text_size*k);
  text("Z2: ", start_x, start_y+text_size*k*2);
  text(z2,start_x+5*text_size/2, start_y+text_size*k*2);
  
  start_y=400;
  textSize(text_size);
  text("X3: ", start_x, start_y);
  text(x3,start_x+5*text_size/2, start_y);
  text("Y3: ", start_x, start_y+text_size*k);
  text(y3,start_x+5*text_size/2, start_y+text_size*k);
  text("Z3: ", start_x, start_y+text_size*k*2);
  text(z3,start_x+5*text_size/2, start_y+text_size*k*2);
}

void print_text(){
  
  start_x=100;
  start_y=100;
  text_size=40;
  
  fill(255);
  textSize(text_size);
  text("X_EE: ", start_x, start_y);
  text(x,start_x+5*text_size/2, start_y);
  text("Y_EE: ", start_x, start_y+text_size*k);
  text(y,start_x+5*text_size/2, start_y+text_size*k);
  text("Z_EE: ", start_x, start_y+text_size*k*2);
  text(z,start_x+5*text_size/2, start_y+text_size*k*2);
  
  textSize(20);
  text("left right", start_x-5*text_size/2, start_y);
  text("ctrl alt", start_x-5*text_size/2, start_y+text_size*k);
  text("down up", start_x-5*text_size/2, start_y+text_size*k*2);
  
  print_c23();  
  
  print_angle("Th1", "q w", 1);
  print_angle("Th2", "e r", 2);
  print_angle("Th3", "t y", 3);
  print_angle("Th4", "a s", 4);
  print_angle("Th5", "d f", 5);
  print_angle("Th6", "g h", 6);
}
