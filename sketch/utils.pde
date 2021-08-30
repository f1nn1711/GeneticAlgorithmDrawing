float mean(float ... values) {
  float sum = 0;
  for (float value : values) {
    sum = sum + value;
  }
  
  return sum/values.length;
}
