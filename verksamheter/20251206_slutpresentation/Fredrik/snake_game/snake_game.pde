// types
class Point {
  int x, y;
  Point(int _x, int _y) { x=_x; y=_y; }
}

// constants
final int backgroundColor = 204; // gray
final int snakeColor = #ffff00; // yellow
final int startTextColor = #0000ff;  // blue
final int endTextColor = #ff0000;  // red
final int WIDTH = 32;
final int HEIGHT = 20;
final int RADIUS = 20;

// grid
final int EMPTY = 0;
final int APPLE = 1;
final int BODY = 2;
final int FACE = 3;
final int TAIL = 4;

// state
final int RUNNING = 0;
final int GAME_OVER = 1;
final int READY = 2;

int[] grid = new int[WIDTH*HEIGHT];
int direction;  // UP, DOWN, LEFT, RIGHT
int faceX, faceY;
int gameState;
String gameOverMessage;

// does not include face.
ArrayList<Point> snakePoints;

void setup() {
  frameRate(5);
}

void settings() {
  // Set window size.
  int w = WIDTH*RADIUS;
  int h = HEIGHT*RADIUS;
  //println(w, h);
  size(w,h);
  gameState = READY;
}

void startNewGame() {
  // Reset grid.
  for(int i=0; i<WIDTH*HEIGHT; i++) {
    grid[i] = EMPTY;
  }
  snakePoints = new ArrayList<Point>();
  gameState = RUNNING;
  // Initial positions. TODO: randomize.
  faceX = 4;
  faceY = 4;
  grid[faceX + faceY*WIDTH] = FACE;
  direction = RIGHT;
  int appleX = 4;
  int appleY = 8;
  grid[appleX + appleY*WIDTH] = APPLE;
}

void drawFace(int x, int y, float angle) {
  int r = RADIUS;
  fill(snakeColor);
  int fx = (x*RADIUS) + RADIUS/2;
  int fy = (y*RADIUS) + RADIUS/2;
  arc(fx,fy,r,r, angle, angle+PI+HALF_PI, PIE);
}

void drawApple(int x, int y) {
  fill(#ff0000);
  int fx = (x*RADIUS) + RADIUS/2;
  int fy = (y*RADIUS) + RADIUS/2;
  circle(fx, fy, RADIUS);
}

void drawBody(int x, int y) {
  fill(snakeColor);
  square((x*RADIUS), (y*RADIUS), RADIUS);
}

void gameOver(String message) {
  gameState = GAME_OVER;
  gameOverMessage = message;
  println("GAME OVER:", message);
}

void newApple() {
  int appleX = (int)random(WIDTH);
  int appleY = (int)random(HEIGHT);
  grid[appleX + appleY*WIDTH] = APPLE;
}

void moveFace(int dx, int dy) {
  int oldX = faceX, oldY = faceY;
  grid[faceX + faceY*WIDTH] = EMPTY;
  faceX += dx;
  faceY += dy;
  if(faceX < 0 || faceY < 0 || faceX >= WIDTH || faceY >= HEIGHT) {
    println(faceX, faceY);
    gameOver("hit edge");
    return;
  }
  int g = grid[faceX + faceY*WIDTH];
  boolean lengthen = false;
  switch(g) {
    case EMPTY: break;
    case BODY: case FACE: case TAIL: gameOver("hit self"); return;
    case APPLE:
      // TODO: lengthen
      newApple();
      lengthen = true;
      break;
    default:
      println("grid error", g);
      gameOver("internal error");
  }
  grid[faceX + faceY*WIDTH] = FACE;
  if(lengthen) {
    println("eat", oldX, oldY);
    Point p = new Point(oldX, oldY);
    snakePoints.add(0, p);
    grid[oldX + oldY*WIDTH] = BODY;
  } else {
    if(snakePoints.size() > 0) {
      Point p = snakePoints.get(snakePoints.size()-1);
      grid[p.x + p.y*WIDTH] = EMPTY;
    }
    for(int i=snakePoints.size()-1; i>0; i--) {
      Point p = snakePoints.get(i-1);
      snakePoints.set(i, p);
      grid[p.x + p.y*WIDTH] = BODY;
    }
    if(snakePoints.size() > 0) {
      Point p = new Point(oldX, oldY);
      snakePoints.set(0, p);
      grid[p.x + p.y*WIDTH] = BODY;
    }
  }
}

void keyPressed() {
  //println("keyPressed", key, keyCode);
  switch(gameState) {
    case RUNNING: keyRunning(); break;
    case READY: keyReady(); break;
    case GAME_OVER: keyGameOver(); break;
  }
}

void keyReady() {
  println("keyPressed. key:", key, ", keyCode:", keyCode);
  if(keyCode == ENTER) {
    startNewGame();
  }
}

void keyGameOver() {
  if(keyCode == ENTER) {
    gameState = READY;
  }
}

void keyRunning() {
  if(key == CODED) {
    switch(keyCode) {
      case UP:
      case DOWN:
      case LEFT:
      case RIGHT:
        setDirection(keyCode);
        break;
    }
  }
}

void setDirection(int newDir) {
  // Prevent snake from going straight back into itself.
  // Such a move would guarantee instant loss.
  switch(newDir) {
    case UP: if(direction == DOWN) return; break;
    case DOWN: if(direction == UP) return; break;
    case LEFT: if(direction == RIGHT) return; break;
    case RIGHT: if(direction == LEFT) return; break;
  }
  direction = newDir;
}

void draw() {
  switch(gameState) {
    case RUNNING: drawRunning(); break;
    case READY: drawReady(); break;
    case GAME_OVER: drawGameOver(); break;
  }
}

void drawReady() {
  background(backgroundColor);
  textAlign(CENTER);
  textSize(64);
  fill(startTextColor);
  text("START GAME", WIDTH*RADIUS/2, HEIGHT*RADIUS/2);
  textSize(32);
  text("Press Enter", WIDTH*RADIUS/2, HEIGHT*RADIUS/2 + 40);
}

void drawGameOver() {
  textAlign(CENTER);
  textSize(64);
  fill(endTextColor);
  text("GAME OVER", WIDTH*RADIUS/2, HEIGHT*RADIUS/2);
  textSize(32);
  text(gameOverMessage, WIDTH*RADIUS/2, HEIGHT*RADIUS/2 + 40);
  String pointsMessage = "points: "+snakePoints.size();
  text(pointsMessage, WIDTH*RADIUS/2, HEIGHT*RADIUS/2 + 80);
}

void drawRunning() {
  int faceRotation=0;
  // Update.
  switch(direction) {
    case RIGHT: moveFace(1, 0); faceRotation=0; break;
    case DOWN: moveFace(0, 1); faceRotation=1; break;
    case LEFT: moveFace(-1, 0); faceRotation=2; break;
    case UP: moveFace(0, -1); faceRotation=3; break;
    default:
      println("direction error", direction);
      gameOver("internal error");
  }

  // Draw.
  background(backgroundColor);
  for(int y=0; y<HEIGHT; y++) {
    for(int x=0; x<WIDTH; x++) {
      int g = grid[x + y*WIDTH];
      switch(g) {
        case EMPTY: break;
        case APPLE: drawApple(x, y); break;
        case FACE: {
          float angle = (faceRotation * HALF_PI) + QUARTER_PI;
          drawFace(x, y, angle);
          break;
        }
        case BODY: drawBody(x, y); break;
        default:
          println("grid error", g);
          gameOver("internal error");
      }
    }
  }
}
