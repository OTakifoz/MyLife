// ignore_for_file: avoid_print

import 'dart:math';

void testRandom() {
  final List<String> olaylar = [
    'Olay 1',
    'Olay 2',
    'Olay 3',
    'Olay 4',
    'Olay 5',
    'Olay 6',
    'Olay 7',
    'Olay 8',
    'Olay 9',
    'Olay 10',
  ];

  final List<double> olasiliklar = [10, 20, 30, 25, 32, 0, 44, 22, 11, 1];
  final List<double> normalizeOlasiliklar = normalizeProbabilities(olasiliklar);

  final Random random = Random();
  final double rastgeleSayi =
      random.nextDouble(); // 0 ile 1 arasında rastgele bir sayı

  int secilenIndex = 0;
  double toplamOlasilik = 0;

  for (int i = 0; i < normalizeOlasiliklar.length; i++) {
    toplamOlasilik += normalizeOlasiliklar[i];
    if (rastgeleSayi <= toplamOlasilik) {
      secilenIndex = i;
      break;
    }
  }

  print('Seçilen Olay: ${olaylar[secilenIndex]}');
}

List<double> normalizeProbabilities(List<double> probabilities) {
  final double total = probabilities.reduce((a, b) => a + b);
  return probabilities.map((p) => p / total).toList();
}
