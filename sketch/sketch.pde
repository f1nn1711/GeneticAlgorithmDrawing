int boxSize = 200;
int popSize = 3;
int nOfVertecies = 4;
populationManager population;
int[][] vertecies = {
  {(width/2)-(boxSize/2), (height/2)-(boxSize/2)},
  {(width/2)+(boxSize/2), (height/2)-(boxSize/2)},
  {(width/2)+(boxSize/2), (height/2)+(boxSize/2)},
  {(width/2)-(boxSize/2), (height/2)+(boxSize/2)}
};//points start at top left and go CW

void setup() {
  size(1000,600);
  population = new populationManager();
}

void draw() {
  background(175);
  stroke(255,0,0,50);
  strokeWeight(4);
  noFill();
  square((width/2)-(boxSize/2),(height/2)-(boxSize/2),boxSize);
  stroke(0,255,0,100);
  population.render();
}
