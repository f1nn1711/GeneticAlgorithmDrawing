class drawingObject {
  int[][] points = new int[nOfVertecies][2];
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
  
  void render() {
    
    //noFill();
    beginShape();
    
    for (int i = 0; i < nOfVertecies; i++) {
      vertex(points[i][0], points[i][1]);
    }
    
    endShape(CLOSE);
  }
}
