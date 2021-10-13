class Gamer{
  float x = 250;
  float y = 250;
  float angle = 3.14/ 2;
  float speed = 3;
  int n = 150;
  
  float[] sX = new float[n];
  float[] sY = new float[n];
  
  float[] m_nx = new float[n];
  float[] m_ny = new float[n];
  
  void Body(){
    stroke(255);
    for (int i = 0; i < n; i ++){
      line(m_nx[i], m_ny[i], x, y);
      circle(m_nx[i], m_ny[i], 10);
    }
    
    fill(250);
    circle(x,y, 25);
    
    fill(255,55,55);
    circle(x+10 * cos(angle),y + 10 * sin(angle), 10); 
  }
  
  void Move(int vert){
    x += speed * vert * cos(angle);
    y += speed * vert * sin(angle);
  }
  
  void Rotate(int ang){
    angle += 3.14/50 * ang;
    for (int i = 0; i < n; i ++){
      sX[i] = -50 * cos(angle + PI/2 /n  * (i-n/2 - 0.5));
      sY[i] = -50 * sin(angle + PI/2 /n  * (i-n/2 - 0.5));
    }
  }
  
  void InitScreen(){
    for (int i = 0; i < n; i ++){
      sX[i] = -50 * cos(angle + PI/2 /n * (i-n/2 - 0.5));
      sY[i] = -50 * sin(angle + PI/2 /n * (i-n/2 - 0.5));
    }
  }
  
  void RayCasting(Object o[]){
    ClearMinArr();
    for (int j = 0; j < 9; j++){
      for (int i = 0; i < n; i++){
        float[] xy = new float[2];
        xy = o[j].DefinePoint(x, y, sX[i], sY[i]);
        float nx = xy[0];
        float ny = xy[1];
        
        if (distance(nx, ny, x, y) < distance(nx,ny, sX[i]+x, sY[i]+y) && o[j].DefinePos(nx, ny) == 1){
          if (distance(nx, ny, x, y) < distance(m_nx[i], m_ny[i],x,y)){
            m_nx[i] = nx;
            m_ny[i] = ny;
          }
        }
      }
    }
  }
  
  void ClearMinArr(){
    for (int i = 0; i < n; i ++){
      m_nx[i] = 10000;
      m_ny[i] = 10000;
    }
  }
  
  float distance(float x1, float y1, float x2, float y2){
    return sqrt((x2-x1) * (x2-x1)+(y2-y1) * (y2-y1));
  }
  
  void Lines(){
    fill(155);
    rect(0, height/2, width, height/2);
    for (int i = 0; i < n; i++){
      fill(25000 / distance(x,y,m_nx[i],m_ny[i]));
      rect(width/n * i, height/2, width/n, 30000/distance(x,y,m_nx[i],m_ny[i]));
      rect(width/n * i, height/2, width/n, -30000/distance(x,y,m_nx[i],m_ny[i]));
    }
  }
}
