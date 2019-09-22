int sign(float f) {
  if (f < 0) {
    return -1;
  } else {
    return 1;
  }
}
class Perceptron {
  float[] weights; //weights given to the inputs
  float LR = .1; //learning rates
  Perceptron(int n) {
    //assign random weights in class construction
    weights = new float[n];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }

  int guess(float[] coords) {
    float sum = 0;
    for (int i = 0; i < coords.length; i++) {
      sum += coords[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }
  float guessY(float x){
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return (-w2/w1) - (w0/w1) * x;
  }
  //tune all the wieghts
  void train(Points p) {
    int guess = guess(p.coords());
    int error = p.label() - guess;

    for (int i = 0; i < weights.length ; i++) {
      weights[i] += error * p.coords()[i] * LR;
    }
  }

  void showGuess(Points p) {
    stroke(0);

    if (guess(p.coords()) == p.label()) {
      fill(0,255,0);
    } else {
      fill(255,0,0);
    }

    ellipse(p.coords()[0], p.coords()[1], 4, 4);
        
    fill(255);
    
  //  println(map(,0,width,0,width) + "    " + map(mouseY,0,height,height/2,-height/2)+ "  "+ mouseX);
  }
}
