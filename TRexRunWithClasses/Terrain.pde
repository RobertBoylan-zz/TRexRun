class Terrain {
  float x, y;
  float speed = 4;
  int terrainType;
  int birdType;
  int birdAdd;

  Terrain (float x, float y, int terrainType) {
    this.x = x;
    this.y = y;
    this.terrainType = terrainType;
  }

  void collision() {
    if (dist(tRex.x, tRex.y, x, y) <= 40) {
      gameOver = true;
    }
  }

  void move() {
    x -= speed;

    if (tRex.accelerate) {
      speed *= 1.1;
      tRex.accelerate =false;
    }
  }

  void bird() {

    birdAdd++;

    if (terrainType == 2) {
      if (birdAdd < 30) {
        birdType = 2;
      } else if (birdAdd < 60) {
        birdType = 1;
      } else {
        birdAdd = 0;
      }
    }
  }

  void display() {
    imageMode(CENTER);

    if (terrainType == 1) {
      y = 160;
      image(cactusImage1, x, y);
    } else if (terrainType == 2) {
      y = 150;
      if (birdType == 1) {
        image(birdImage1, x, y);
      } else if (birdType == 2) {
        image(birdImage2, x, y);
      }
    } else {
      y = 160;
      image(cactusImage2, x, y);
    }
  }

  void run () {
    bird();
    collision();
    move();
    display();
  }
}
