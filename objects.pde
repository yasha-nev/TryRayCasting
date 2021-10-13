class Object{
  float x0,y0, x1, y1;
  Object(){}
  Object(float X0,float Y0,float X1,float Y1){
    x0 = X0;
    y0 = Y0;
    x1 = X1;
    y1 = Y1;
  }
  float[] DefinePoint(float lx0, float ly0,float lx1, float ly1){
    float[] xy = new float[2];
    float nx, ny;
    float a = ly1;
    float b = -lx1;
    float c = ly0 * (lx1 + lx0) - lx0 * (ly1 + ly0);
    
    float a1 = y1 - y0;
    float b1 = -(x1 - x0);
    float c1 = y0 * x1 - x0 * y1;
    
    ny = -(c * a1 - c1 * a) / (b * a1 - a * b1);
    nx = -(c * b1 - c1 * b) / (b1 * a - b * a1);
    xy[0] = nx;
    xy[1] = ny;
    return xy;
  }
  
  int DefinePos(float nx,float ny){
    if (max(x1, x0) - nx >= -0.5 && max(y1, y0) - ny >= -0.5 && min(x1, x0) - nx <= 0.5 && min(y1, y0) - ny <= 0.5){
      return 1;
    }
    else return 0;
  }
  
  void Body(){
    rect(x0, y0, x1 - x0, y1 - y0);
  }
}

class Rect extends Object{
  float[][] point = new float[4][4];
  Rect(float X0,float Y0,float X1,float Y1){
    super(X0, Y0, X1, Y1);
    InitArray();
  }
  void Body(){
    line(x0, y0, x1, y0);
    line(x0, y1, x1, y1);
    line(x0, y0, x0, y1 );
    line(x1, y0, x1, y1);
  }
  float[] DefinePoint(float lx0, float ly0,float lx1, float ly1){
    float[] xy = new float[2];
    float nx, ny;
    float distance = 10000;
    xy[0] = 1000;
    xy[1] = 1000;
    for (int i = 0; i < 4; i++){
      float a = ly1;
      float b = -lx1;
      float c = ly0 * (lx1 + lx0) - lx0 * (ly1 + ly0);
      
      float a1 = point[i][3] - point[i][1];
      float b1 = -(point[i][2] - point[i][0]);
      float c1 = point[i][1] * point[i][2] - point[i][0] * point[i][3];
      
      ny = -(c * a1 - c1 * a) / (b * a1 - a * b1);
      nx = -(c * b1 - c1 * b) / (b1 * a - b * a1);
      
      float n_distance = sqrt((lx0 - nx) * (lx0 - nx) + (ly0 - ny) * (ly0 - ny));
      if (distance > n_distance && DefinePos(nx, ny) == 1){
        xy[0] = nx;
        xy[1] = ny;
        distance = n_distance;
      }
    }
    return xy;
  }
  int DefinePos(float nx,float ny){
     if (max(x1, x0) - nx >= -0.5 && max(y1, y0) - ny >= -0.5 && min(x1, x0) - nx <= 0.5 && min(y1, y0) - ny <= 0.5){
       return 1;
    }
    else return 0;
  }
  
  void InitArray(){
    point[0][0] = x0;       point[0][1] = y0;       point[0][2] = x1;       point[0][3] = y0; 
    point[1][0] = x0;       point[1][1] = y1;       point[1][2] = x1;       point[1][3] = y1; 
    point[2][0] = x0;       point[2][1] = y0;       point[2][2] = x0;       point[2][3] = y1; 
    point[3][0] = x1;       point[3][1] = y0;       point[3][2] = x1;       point[3][3] = y1; 
  }
}
