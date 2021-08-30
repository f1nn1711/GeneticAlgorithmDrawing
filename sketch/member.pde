class drawingObject {
  int[][] points = new int[nOfVertecies][2];
  float fitness = 0;

  drawingObject(boolean randomObj) {
    if (randomObj == true) {
      for (int i = 0; i < nOfVertecies; i++) {
        int randomX = int(random(0, width));
        int randomY = int(random(0, height));
        int[] point = {randomX, randomY};

        points[i] = point;
      }
    }
  }

  void calcualateFitness() {
    for (int i = 0; i < nOfVertecies; i++) {
      float fit = mean(points[i][0]-vertecies[i][0], points[i][1]-vertecies[i][1]);
      fitness = fitness + fit;
    }
  }

  void mutate() {
    for (int i = 0; i < nOfVertecies; i++) {
      float mutateChance = random(0, 1);
      if (mutateChance < mutationRate) {
        int randomX = int(random(0, width));
        int randomY = int(random(0, height));
        //int randomX = points[i][0] + round(random((points[i][0]+(points[i][0]*0.1)), (points[i][0]+(points[i][0]*0.1))));
        //int randomY = points[i][1] + round(random((points[i][1]+(points[i][1]*0.1)), (points[i][1]+(points[i][1]*0.1))));
        int[] point = {randomX, randomY};

        points[i] = point;
      }
    }
  }

  void render() {

    //noFill();
    beginShape();

    for (int i = 0; i < nOfVertecies; i++) {
      vertex(points[i][0], points[i][1]);
    }

    endShape(CLOSE);
  }
}
