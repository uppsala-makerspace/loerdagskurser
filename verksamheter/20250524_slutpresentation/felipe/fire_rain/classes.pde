class Bola {
  float x, y;
  float h;
  float w;
  // Constructor
  Bola(float x, float y) {
    this.x = x;
    this.y = y;
    this.h = 5;
    this.w = 5;
  }

  // Método para mover la bola
  void mover() {
    this.y -= 3;  // Hacer que la bola se mueva hacia arriba
  }

  // Método para dibujar la bola
  void dibujar() {
    fill(0, 255, 0); // Color fijo para la bola (verde)
    rect(this.x, this.y, 10, 10);  // Dibujar la bola como un cuadrado
  }
}

// Clase Particula para manejar los puntos que caen
class Particula {
  float x, y;
  color c;
  String direction;

  // Constructor
  Particula(float x, float y, String any_direction) {
    this.x = x;
    this.y = y;
    this.c = color(255, 0, 0); // Color fijo para las partículas (rojo)
    this.direction = any_direction;
  }

  // Método para mover la partícula
  void mover() {
    if (this.direction == "down") {
      this.y += 2;  // Mover la partícula hacia abajo
    }
    if (this.direction == "left") {
      this.x += 2;  
    }
    if (this.direction == "right") {
      this.x +=-2;  
    }

    if (this.x > width) {
      particulas.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
    if (this.y > height) {
      particulas.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
    if (this.x < 0) {
      particulas.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
    if (this.y < 0) {
      particulas.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
  }
  // Método para dibujar la partícula
  void dibujar() {
    fill(c);  // Usar el color fijo para la partícula
    noStroke();
    ellipse(this.x, this.y, 10, 10);  // Dibujar la partícula como un punto (círculo pequeño)
  }
}

class Particula1 {
  float x, y;
  float w, h;
  int hp;
  color c;


  // Constructor
  Particula1(float x, float y) {
    this.x = x;
    this.y = y;
    this.c = color(255, 0, 0); // Color fijo para las partículas (rojo)
    this.w = random(30, 80);
    this.h =  random(30, 80);
    hp = int(random(3, 10));
  }

  // Método para mover la partícula
  boolean mover(int index) {
    this.y += 1.5;  // Mover la partícula hacia abajo
    if (this.y > height) {
      particulas1.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
    if (this.x > width) {
      particulas1.remove(this);  // Eliminar la partícula cuando se sale de la pantalla
    }
    for (int i = 0; i < bolas.size(); i++) {
      Bola b = bolas.get(i);
      boolean insideA = (b.x + (b.w/2) > this.x - (this.w/2) && b.x - (b.w/2) < this.x + (this.w/2));
      boolean insideB = (b.y + (b.h/2) > this.y - (this.h/2) && b.y - (b.h/2) < this.y - (this.h/2));

      if (insideA == true && insideB == true) {
        hp-=2;
        bolas.remove(i);
      }
      if (hp < 1) {
        killcounter +=1;
      }
    }
    return hp <= 0;
  }

  // Método para dibujar la partícula
  void dibujar() {
    fill(c);  // Usar el color fijo para la partícula
    noStroke();
    imageMode(CENTER);
    image(bolass, this.x, this.y, this.w, this.h);
  }
}
