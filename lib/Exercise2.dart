import 'dart:io';
import 'dart:math';

void main() {
  List<double> numbers = inputNumbers();
  double sum = calculateSum(numbers);
  print('Tổng của các số: $sum');

  double average = calculateAverage(numbers);
  print('Trung bình cộng của các số: $average');

  print('Căn bậc hai của các số:');
  for (double number in numbers) {
    print(
        'Căn bậc hai của $number: ${number >= 0 ? calculateSqrtNumber(number) :
        'không có căn bậc 2 của $number'}');
  }
}

List<double> inputNumbers() {
  List<double> numbers = [];
  print('Nhập các số vào danh sách (nhập "x" để kết thúc):');
  String? input;
  double number;
  do {
    stdout.write('Nhập số: ');
    input = stdin.readLineSync();
    if (input != null && input.toLowerCase() != 'x') {
      try {
        number = double.parse(input);
        numbers.add(number);
      } catch (e) {
        print('Số không hợp lệ, vui lòng nhập lại.');
      }
    }
  } while (input == null || input.toLowerCase() != 'x');
  return numbers;
}

double calculateSum(List<double> numbers) {
  double sum = 0.0;
  for (double number in numbers) {
    sum += number;
  }
  return sum;
}

double calculateAverage(List<double> numbers) {
  double sum = calculateSum(numbers);
  return sum / numbers.length;
}

double calculateSqrtNumber(double number) => sqrt(number);

