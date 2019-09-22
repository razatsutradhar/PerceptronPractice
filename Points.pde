float f(float x){
  return(.3*x + .2);
}

class Points {
  float x;
  float y;
  float px;
  float py;
  int label = 0;
  float b = 1;
  Points() {
    x = random(-1, 1);
    y = random(-1, 1);
    px = map(x,-1,1,0,width);
    py = map(y,-1,1,height,0);
    if (y > f(x)) {
      label = 1;
    } else {
      label = -1;
    }
  }

  Points(float x, float y) {
    this.x = x;
    this.y = y;
    px = map(x,-1,1,0,width);
    py = map(y,-1,1,height,0);
    if (x > y) {
      label = 1;
    } else {
      label = -1;
    }
 //   println(px + "    " + py);
  }
  float pixelX() {
    return  map(x, -1, 1, 0, width);
  }
  float pixelY() {
    return  map(y, -1, 1, height, 0);
  }
  int label() {

    return label;
  }

  float[] coords() {
    return new float[] {px, py, b};
  }
  float[] rawCoords(){
     return new float[]{x,y,b}; 
  }

  void show() {
    stroke(0);

    if (label == 1) {
      fill(255);
    } else {
      fill(0);
    }

    ellipse(pixelX(), pixelY(), 12, 12);
  }

}
