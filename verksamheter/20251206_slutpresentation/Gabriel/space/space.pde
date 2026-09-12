float playerX;
float playerY;

float playerSpeed = 5;
ArrayList<Bullet> bullets;


ArrayList<Enemy> enemies;
float enemySpeed = 1;
boolean movingRight = true;

void setup() {
  size(600, 600);
  playerX = width/2;
  playerY = height - 50;
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  

  int rows = 5;
  int cols = 8;
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      enemies.add(new Enemy(60 + c*60, 60 + r*40));
    }
  }
}

void draw() {
  background(0);
  
  
  fill(0, 255, 0);
  rect(playerX-20, playerY-10, 40, 20);
  
  
  if (keyPressed) {
    if (keyCode == LEFT) playerX -= playerSpeed;
    if (keyCode == RIGHT) playerX += playerSpeed;
  }
  playerX = constrain(playerX, 20, width-20);
  
  
  for (int i = bullets.size()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.update();
    b.display();
    if (b.offscreen()) {
      bullets.remove(i);
    } else {
      
      for (int j = enemies.size()-1; j >= 0; j--) {
        Enemy e = enemies.get(j);
        if (e.hit(b)) {
          enemies.remove(j);
          bullets.remove(i);
          break;
        }
      }
    }
  }
  
  
  boolean edge = false;
  for (Enemy e : enemies) {
    e.update(enemySpeed, movingRight);
    e.display();
    if (e.x > width-30 || e.x < 30) {
      edge = true;
    }
  }
  
 
  if (edge) {
    movingRight = !movingRight;
    for (Enemy e : enemies) {
      e.y += 20;
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(playerX, playerY-20));
  }
}


class Bullet {
  float x, y;
  float speed = 4;
  
  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    y -= speed;
  }
  
  void display() {
    fill(255);
    rect(x-2, y-10, 4, 10);
  }
  
  boolean offscreen() {
    return y < 0;
  }
}


class Enemy {
  float x, y;
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update(float speed, boolean right) {
    if (right) x += speed;
    else x -= speed;
  }
  
  void display() {
    fill(255, 0, 0);
    rect(x-15, y-15, 30, 30);
  }
  
  boolean hit(Bullet b) {
    return (b.x > x-15 && b.x < x+15 && b.y > y-15 && b.y < y+15);
  }
}
