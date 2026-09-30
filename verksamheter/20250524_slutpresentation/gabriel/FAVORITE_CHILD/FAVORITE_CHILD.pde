



int ballX = 160, ballY = 120, ballDX = 2, ballDY = 2;
int paddle1Y = 100, paddle2Y = 100;
int paddleHeight = 60;
int paddleWidth = 10;
int ballSize = 20;
int score1 = 0, score2 = 0;
int maxScore = 5; 
int difficulty = 1;
color ballColor = color(255);




void setup() {
  size(400, 300);
  
 
  setDifficulty(difficulty);
}

void draw() {
  background(0);
  fill(255);
  rect(10, paddle1Y, paddleWidth, paddleHeight);
  rect(width - 20, paddle2Y, paddleWidth, paddleHeight);
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
  
  textSize(32);
  text(score1, 50, 50);
  text(score2, width - 70, 50);
  
  if (score1 >= maxScore || score2 >= maxScore) {
    textSize(64);
    text("SKILL ISSUE LIL BRO", width / 2 - 150, height / 2);
    noLoop();
    return;
  }
  
  ballX += ballDX;
  ballY += ballDY;
  
  if (ballY <= 0 || ballY >= height - ballSize) ballDY = -ballDY;
  if (ballX <= 20 && ballY >= paddle1Y && ballY <= paddle1Y + paddleHeight) {
    ballDX = -ballDX;
    ballDX *= 1.1; // Increase speed
    ballDY *= 1.1; // Increase speed
    ballColor = color(random(255), random(255), random(255)); // Change ball color
    
  }
  if (ballX >= width - 40 && ballY >= paddle2Y && ballY <= paddle2Y + paddleHeight) {
    ballDX = -ballDX;
    ballDX *= 1.1; // Increase speed
    ballDY *= 1.1; // Increase speed
    ballColor = color(random(255), random(255), random(255)); // Change ball color
    
  }
  if (ballX <= 0) {
    score2++;
    resetBall();
    
  }
  if (ballX >= width - ballSize) {
    score1++;
    resetBall();
    
  }
  
  
  if (ballY > paddle2Y + paddleHeight / 2 && paddle2Y < height - paddleHeight) {
    paddle2Y += 3;
  } else if (ballY < paddle2Y + paddleHeight / 2 && paddle2Y > 0) {
    paddle2Y -= 3;
  }
}

void resetBall() {
  ballX = 160;
  ballY = 120;
  ballDX = 2;
  ballDY = 2;
}

void setDifficulty(int level) {
  if (level == 1) {
    ballDX = 2;
    ballDY = 2;
    paddleHeight = 80;
  } else if (level == 2) {
    ballDX = 3;
    ballDY = 3;
    paddleHeight = 60;
  } else if (level == 3) {
    ballDX = 4;
    ballDY = 4;
    paddleHeight = 40;
  }
}

void keyPressed() {
  if (key == 'w' && paddle1Y > 0) paddle1Y -= 5;
  if (key == 's' && paddle1Y < height - paddleHeight) paddle1Y += 5;
  if (keyCode == UP && paddle2Y > 0) paddle2Y -= 5;
  if (keyCode == DOWN && paddle2Y < height - paddleHeight) paddle2Y += 5;
  if (key == '1') setDifficulty(1);
  if (key == '2') setDifficulty(2);
  if (key == '3') setDifficulty(3);
}
