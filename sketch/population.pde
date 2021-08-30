class populationManager {
  ArrayList<drawingObject> members = new ArrayList<drawingObject>();

  populationManager(boolean randomPop) {
    for (int i = 0; i < popSize; i++) {
      members.add(new drawingObject(randomPop));
    }
  }

  populationManager calculateNewPopulation(populationManager startingPop) {
    float maxFit = 0;
    float minFit = 999999999;

    for (drawingObject member : startingPop.members) {
      member.calcualateFitness();

      if (member.fitness < minFit) {
        minFit = member.fitness;
      }

      if (member.fitness > maxFit) {
        maxFit = member.fitness;
      }
    }

    for (drawingObject member : startingPop.members) {
      member.fitness = ceil(map(member.fitness, minFit, maxFit+1, 1, 100));
    }

    ArrayList<drawingObject> pool = new ArrayList<drawingObject>();
    
    for (drawingObject member : startingPop.members) {
      for (int i = 0; i < 100-member.fitness; i++) {
        pool.add(member);
      }
    }
    
    populationManager newPopulation = new populationManager(false);
    for (drawingObject member : newPopulation.members) {
      int randomIndex1 = round(random(0, pool.size()-1));
      int randomIndex2 = round(random(0, pool.size()-1));
      
      int[][] points1 = pool.get(randomIndex1).points;
      int[][] points2 = pool.get(randomIndex2).points;
      
      int[][] newPoints = new int[points1.length][2];
      
      for (int i = 0; i < points1.length; i++) {
        newPoints[i][0] = points1[i][0]+(points2[i][0] - points1[i][0]);
        newPoints[i][1] = points1[i][1]+(points2[i][1] - points1[i][1]);
      }
      
      member.points = newPoints;
      member.mutate();
    }
    
    return newPopulation;
  }

  void render() {
    for (drawingObject member : members) {
      member.render();
    }
  }
}
