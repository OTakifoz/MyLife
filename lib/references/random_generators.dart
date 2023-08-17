import 'dart:math';

int randomMinMaxInteger(int min, int max) {
  Random random = Random();

  random = Random();
  int randomInt = min + random.nextInt(max - min);

  return randomInt;
}
