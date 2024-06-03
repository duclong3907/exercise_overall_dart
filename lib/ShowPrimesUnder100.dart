import 'dart:math';

void main() {
  displayPrimesUnder100();
}

bool isPrime(int number) {
  if (number < 2) {
    return false;
  }
  for (int i = 2; i <= sqrt(number).toInt(); i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void displayPrimesUnder100() {
  List<int> primes = [];
  for (int i = 2; i < 100; i++) {
    if (isPrime(i)) {
      primes.add(i);
    }
  }
  print('Các số nguyên tố nhỏ hơn 100: \n[${primes.join(', ')}]');
}
