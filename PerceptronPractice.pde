Perceptron p = new Perceptron(3);
Points[] inputs = new Points[100];

void setup() {
  size(500, 500);
  for (int i = 0; i < inputs.length; i ++) {
    inputs[i] = new Points();
  }
  strokeWeight(1);
}


void draw() {
  background(100);

  for (Points point : inputs) {
    point.show();
    p.showGuess(point);
  }
    for (Points point : inputs) {
      p.train(point);
    }

  //line(0, height, width, 0);
  Points p1 = new Points (-1, f(-1));
  Points p2 = new Points (1, f(1));
  line(p1.coords()[0],p1.coords()[1],p2.coords()[0],p2.coords()[1]);
  Points p3 = new Points(-1, p.guessY(-1));
  Points p4 = new Points(1, p.guessY(1));
  stroke(0,0,255);
  line(p3.coords()[0],p3.coords()[1],p4.coords()[0],p4.coords()[1]);
  
  
  println(p3.coords()[0] +"   "+ p3.coords()[1]+"   "+p4.coords()[0]+"   "+p4.coords()[1]);
}

void keyPressed() {
  if (key == 't') {
    background(150);
    for (int i = 0; i < inputs.length; i ++) {
      inputs[i] = new Points();
    }

  }
}
