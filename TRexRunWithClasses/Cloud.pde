class Cloud {
  float x = 800;
  float y;
  float speed;

  Cloud (float y) {
    this.y = y;
  }

  void display() {
    image(cloud, x, y);
  }

  void move() {
    x -= 0.5;
  }
  
  void run() {
    display();
    move();
  }
}
