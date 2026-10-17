float[] x;
float[] y;
boolean bossloaded;
int turbo = 0;
boolean mega = false;
int direction;
int gameState = 0;
int playerlife = 11;
int rects = 0; // Variable para contar cuántas veces se presiona la tecla E
int killcounter = 0;
PImage[] background;
PImage bolass;
PImage Bosss;

Boss boss;
ArrayList<Bola> bolas;  // Lista de bolas
ArrayList<Particula> particulas;  // Lista de partículas (puntos que caen)
ArrayList<Particula1> particulas1;  // Lista de partículas (puntos que caen)

float tiempoUltimaPresion = 0; // Tiempo de la última vez que se presionó 'E'
float intervalo = 500; // Intervalo en milisegundos (0.5 segundos)

// Variables para crear partículas cada 0.75 segundos
float tiempoUltimaParticula = 0;  // Tiempo de la última vez que se creó una partícula
float intervaloParticulas = 750;  // Intervalo en milisegundos (0.75 segundos)

float tiempoUltimaParticula1 = 0;  // Tiempo de la última vez que se creó una partícula
float intervaloParticulas1 = 750;  // Intervalo en milisegundos (0.75 segundos)

void setup()
{
  if (bossloaded == true) {
    
  
  }
  if (bossloaded == false) {
  
  }
  
  
  size(500,500);
  x = new float[200];
  y = new float[200];
  x[1] = width / 2;
  y[1] = height / 2;
  background = new PImage[3];
  background[0] = loadImage("2.png");
  background[1] = loadImage("4.png");
  background[2] = loadImage("1.png");
 // background[3] = loadImage("11.png");
  
  bolass = loadImage("pixil-frame-0 (00).png");
  Bosss = loadImage("5.png");
  imageMode(CENTER);
  noSmooth();
  
  boss = new Boss();
  
  bolas = new ArrayList<Bola>();  // Inicializamos la lista de bolas
  particulas = new ArrayList<Particula>();  // Inicializamos la lista de partículas
  particulas1 = new ArrayList<Particula1>();  // Inicializamos la lista de partículas
}
void draw()
{
  background(background[gameState]);
  text(killcounter, 40, 10);

  
  if (keyPressed)

  { 
    if (keys[68]) x[1] = x[1] + 2;
    if (keys[83]) y[1] = y[1] + 2;
    if (keys[65]) x[1] = x[1] - 2;
    if (keys[87]) y[1] = y[1] - 2;
    
 //if (keys[82] backround = 3);   
  
    
    // Comprobamos si la tecla 'E' ha sido presionada y si ha pasado suficiente tiempo
    if (keys[69] && (millis() - tiempoUltimaPresion >= intervalo))
    {
      // Crear una nueva bola en la posición del personaje
      Bola nuevaBola = new Bola(x[1], y[1]);
      bolas.add(nuevaBola);  // Añadir la nueva bola a la lista
      
      tiempoUltimaPresion = millis();  // Actualizar el tiempo de la última acción
    }
  }                                                                                                                                                       
  if (x[1] > width) x[1] = 0;
  if (y[1] < 0) y[1] = height;
  image(background[1], x[1], y[1]);
  
  if(x[1] > 46 && y[1] > 84 && x[1] < 220 && y[1] < 148) 
    gameState = 2;
  
  // Si estamos en el estado 2 (mostrando 1.png), se deben generar partículas
  if (gameState == 2) {
    stroke(#FA0000);
    strokeWeight(10);
    if(playerlife<=0){gameState=0;exit();}
    text(playerlife,10,10);
    // Generar partículas cada 0.75 segundos solo si hay menos de 3 en pantalla
    
    if (millis() - tiempoUltimaParticula >= intervaloParticulas && particulas.size() < 9) 
    {
         if (killcounter <  20)
         {
             particulas.add(new Particula(random(width), 0, "down"));  // Agregar partículas en la parte superior de la pantalla
         }
         else
         {
             print("KILLYTFDWUDQWYDFDDYUWQ KOMMWE NU");
             particulas.add(new Particula(width, random(height), "right"));  // Agregar partículas en la parte superior de la pantalla
             particulas.add(new Particula(0, random(height), "left"));  // Agregar partículas en la parte superior de la pantalla
             
         }
         tiempoUltimaParticula = millis();  // Actualizar el tiempo de la última creación de partículas
    }
    
    if (millis() - tiempoUltimaParticula1 >= intervaloParticulas1 && particulas1.size() < 9) {
      if (killcounter < 20)
      {
      particulas1.add(new Particula1(random(width), 0));  // Agregar partículas en la parte superior de la pantalla
      }
      tiempoUltimaParticula1 = millis();  // Actualizar el tiempo de la última creación de partículas
    }  
    
    for (int i = 0; i < particulas1.size(); i++) {
      Particula1 p = particulas1.get(i);  // Obtener cada partícula
      if(p.mover(i)) particulas1.remove(i);;  // Mover la partícula hacia abajo
      p.dibujar();  // Dibujar la partícula
      // If the particle is at a too low distance to the player,
      if (dist(x[1], y[1], p.x, p.y) < random(40)) {
        // reduce the health of the player
        playerlife -= 0.5;
        p.y = 10000000L;
        print("LOSELIFE");
        println(playerlife);
      }
      
    }
    // Mover y dibujar las partículas
    for (int i = 0; i < particulas.size(); i++) {
      Particula p = particulas.get(i);  // Obtener cada partícula
      p.mover();  // Mover la partícula hacia abajo
      p.dibujar();  // Dibujar la partícula
      if (dist(x[1], y[1], p.x, p.y) < 15) {
        // reduce the health of the player
        playerlife -= 0.25;
        p.y =10000L;
        print("LOSELIFE");
      }
    }
  }
  
  // Actualizar y dibujar todas las bolas
  for (int i = 0; i < bolas.size(); i++) {
    Bola b = bolas.get(i);  // Obtener cada bola de la lista
    b.mover();  // Mover la bola
    b.dibujar();  // Dibujar la bola
  }

  // Mostrar el contador de veces que se presiona la tecla E
  fill(255); // Para mostrar el texto en blanco
  text("Tecla E presionada: " + rects + " veces", 10, height - 10);
  
  if (killcounter >= 20) {
    boss.show();
  }
}

void keyPressed() {
  keys[keyCode] = true;
  println(keyCode + " - " + key);
  
  // Verificar si la tecla presionada es la 'E' (código de la tecla 'E' es 69)
  if (keyCode == 69) {
    rects++;  // Incrementar el contador cada vez que se presiona 'E'
  }
}

void keyReleased() {
  keys[keyCode] = false;
}

boolean[] keys = new boolean[1024];
