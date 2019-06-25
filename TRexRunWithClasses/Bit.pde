class Bit {

  float x = 800;
  float y;
  float speed = 4;
  int type;

  Bit (float y, int type) {
    this.y = y;
    this.type = type;
  }

  void move() {

    x -= speed;

    if (tRex.accelerate == true) {
      speed *= 1.1;
      tRex.accelerate = false;
    }
  }

  void display() {
    strokeWeight(1);
    stroke(#3E3C39);
    rect(x, y, int(random(2, 6)), 1);
  }

  void run() {
    display();
    move();
  }
}
