float[][] centreOfGravity(float m0, float m1, float m2, float m3, float m4, float m5 ){
  // m0-масса подставки, m1-m4 -звеньев, m5-груза
  float[] m_v={m0,m1,m2,m3,m4,m5};
  float[][][] p_v={{{0},{0},{0}}, 
                {{x1}, {y1}, {z1}},
                {{x2}, {y2}, {z2}},
                {{x3}, {y3}, {z3}},
                {{x},{y},{z}}};
  
  float[][] centre={{0},{0},{0}};
  for (int i=0; i<4; i++){
    centre=addM(centre, dotL(dotL(addM(p_v[i], p_v[i+1]), 0.5), m_v[i+1]));
  }
  centre=addM(centre, dotL(p_v[4], m5));
  float[][] centre_of_gr=dotL(centre, 1/(m0+m1+m2+m3+m4+m5));
  return centre_of_gr;
}
