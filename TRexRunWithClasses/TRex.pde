class TRex {
  float x = 0;
  float y = 160;
  float speedY = 14;
  float  gravity = 0.8;
  boolean canJump = false;
  int score;
  float scoreMultiplier = 1;
  float steps;
  boolean accelerate = false;

  TRex () {
  }

  void display() {
    if (tRexImageIndex==1) {
      image(tRexImage1, x, y);
    } else if (tRexImageIndex==2) {
      image(tRexImage2, x, y);
    } else if (tRexImageIndex==3) {
      image(tRexImage3, x, y);
    }
  }

  void score() {

    if (frameCount%10 == 0) {
      steps++;
      score += steps*scoreMultiplier;
    }

    if (steps >= 600) {
      scoreMultiplier *= 1.1;
      steps = 0;
    }

    fill(#49584B);
    textSize(20);
    text("Score: ", 620, 25);
    text(score, 700, 25);
  }

  void move() {
    if (x < 75) {
      x += 5;
    }
  }

  void jump() {
    if (!canJump) {
      if (keyPressed && key  == ' ') {
        speedY = 14 ;
        canJump = true;
        speedY *= -1;
      }
    } else {
      speedY += gravity;
      y += speedY;
      tRexImageIndex = 1;

      if (y >= 161) {
        canJump = false;
        y = 160;
      }
    }
  }
  
  void run() {
    jump();
    display();
    move();
    score();
  }
}
