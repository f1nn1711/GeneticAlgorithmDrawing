float mean(float ... values) {
  float sum = 0;
  for (float value : values) {
    sum = sum + value;
  }
  
  return sum/values.length;
}

float diff(float v1, float v2) {
  if (v1 > v2) {
    return v1 - v2;
  } else {
    return v2 - v1;
  }
}
