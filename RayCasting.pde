Gamer g = new Gamer();
boolean[] keys = new boolean[255];
Object[] o = new Object[9];

void setup(){
  size(750, 750);
  smooth();
  g.InitScreen();
  initArray();
}

void draw(){
  background(0);
  updatePlayers();
  
  g.RayCasting(o);
  g.Lines();
  
  fill(0);
  rect(0,0, 150,150);
  
  for (int i = 0; i <9; i++){
    o[i].Body();
  }
  g.Body();
}

void keyPressed(){
  keys[keyCode] = true;
}

void keyReleased(){
  keys[keyCode] = false;
}

void updatePlayers(){
  if (keys[UP]){ g.Move(1);}
  if (keys[DOWN]){ g.Move(-1);}
  if (keys[LEFT]){ g.Rotate(-1);}
  if (keys[RIGHT]){ g.Rotate(1);}
}

void initArray(){
  o[0] = new Object(0, 0, width, 0);
  o[1] = new Object(0, height, width, height);
  o[2] = new Object(0, 0, 0, height);
  o[3] = new Object(width, 0, width, height);
  o[4] = new Rect(100, 100, 200, 200);
  o[5] = new Rect(550, 550, 650, 650);
  o[6] = new Rect(100, 550, 200, 650);
  o[7] = new Rect(550, 100, 650, 200);
  o[8] = new Rect(width/2 - 50, height /2 - 50, width/2 + 50, height/ 2 + 50);
}
