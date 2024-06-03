import 'dart:io';
import 'dart:math';
void main() {
  int numbers = 20;
  displayFirstNPrimes(numbers);
}

void displayFirstNPrimes(int numbers) {
  int count = 0;
  int n = 2;
  print('20 số nguyên tố đầu tiên là:');
  while (count < numbers) {
    if (isPrime(n)) {
      print(n);
      count++;
    }
    n++;
  }
}

bool isPrime(int num) {
  if (num < 2) {
    return false;
  }
  for (int i = 2; i <= sqrt(num).toInt(); i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}
