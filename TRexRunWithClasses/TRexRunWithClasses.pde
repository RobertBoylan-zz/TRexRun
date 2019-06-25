TRex tRex;
ArrayList<Terrain> terrainList = new ArrayList<Terrain>();
ArrayList<Cloud> cloudList = new ArrayList<Cloud>();
ArrayList<Bit> bitList = new ArrayList<Bit>();
String oldHighScore[];
int highScore;
int cloudTime;
int tRexImageIndex;
int tRexAdd;
int addObstacle;
int terrainAdd;
PImage cloud;
PImage tRexImage1;
PImage tRexImage2;
PImage tRexImage3;
PImage cactusImage1;
PImage cactusImage2;
PImage birdImage1;
PImage birdImage2;
boolean gameOver = false;

void setup () {
  imageMode(CENTER);
  size(800, 200);
  
  tRex = new TRex();

  terrainList.add(new Terrain (width, height-40, 1));
  cloudList.add(new Cloud(random(50, 100)));
  bitList.add(new Bit(random(183, 198), int(random(1, 5))));

  cloud = loadImage("cloud.png");
  cloud.resize(100, 50);

  tRexImage1 = loadImage("trex1.png");
  tRexImage1.resize(50, 50);

  tRexImage2 = loadImage("trex2.png");
  tRexImage2.resize(50, 50);

  tRexImage3 = loadImage("trex3.png");
  tRexImage3.resize(50, 50);

  cactusImage1 = loadImage("cactus1.png");
  cactusImage1.resize(30, 50);

  cactusImage2 = loadImage("cactus2.png");
  cactusImage2.resize(50, 50);

  birdImage1 = loadImage("bird1.png");
  birdImage1.resize(30, 30);
  birdImage2 = loadImage("bird2.png");
  birdImage2.resize(30, 30);

  terrainAdd = 0;
  
  oldHighScore = loadStrings("highscore.txt");

  if (oldHighScore.length > 0) {
    highScore = int(oldHighScore[0]);
  }
}

void draw () {
  if (!gameOver) {
    fill(#50A4C1);
    rect(-1, -1, 801, 181);
    fill(0);
    fill(#AA8245);
    rect(-1, 180, 801, 20);
    line(0, 180, 800, 180);

    terrainAdd++;
    addObstacle++;
    cloudTime++;
    tRexAdd++;

    for (int i = 0; i<terrainList.size(); i++) { 
      terrainList.get(i).run();
    }
    for (int i = 0; i<cloudList.size(); i++) { 
      cloudList.get(i).run();
    } 
    for (int i = 0; i<bitList.size(); i++) {
      bitList.get(i).run();
    }

    tRex.run();

    if (addObstacle >= 8) {
      bitList.add(new Bit(random(183, 198), int(random(1, 5))));
      addObstacle=0;
    }
    if (!tRex.canJump) {
      if (tRexAdd <= 5) {
        tRexImageIndex = 1;
      }
      if (tRexAdd <= 10 && tRexAdd > 5) {
        tRexImageIndex = 2;
      }
      if (tRexAdd > 10) {
        tRexImageIndex = 3;
      }
      if (tRexAdd > 16) {
        tRexAdd = 0;
      }
    }

    if (terrainAdd >= 110) {
      terrainList.add(new Terrain (800, 160, int(random(1, 5))));
      terrainAdd = 0;
    }

    if (cloudTime >= random(600, 1200)) {
      cloudList.add(new Cloud(random(50, 100)));
      cloudTime = 0;
    }
  } else {
    background(0);
    textSize(100);
    fill(#49584B);
    text("Game Over", 120, 100);
    textSize(40);
    text("Score: ", 290, 140);
    text(tRex.score, 440, 140);
    textSize(20);
    text("Highscore: ", 310, 165);
    
    if (highScore > tRex.score) {
      text(highScore, 430, 165);
    }
    
    else {
      text(tRex.score, 430, 165);
      saveStrings("highscore.txt", new String[] {str(tRex.score)});
    }
  }

  removeTerrain();
  removeCloud();
  removeBit();
}

void removeTerrain() {
  for (int i = 0; i <terrainList.size(); i++) {
    if (terrainList.get(i).x <= -15) {
      terrainList.remove(i);
    }
  }
}

void removeCloud() {
  for (int i = 0; i <cloudList.size(); i++) {
    if (cloudList.get(i).x <= -50) {
      cloudList.remove(i);
    }
  }
}

 void removeBit() {
    for (int i = 0; i < bitList.size(); i++) {
      if (bitList.get(i).x <= -5) {
        bitList.remove(i);
      }
    }
  }
