import 'dart:io';

void main() {
  double rate = 23000;
  double usd = getUserInput();
  double vnd = convertUsdToVnd(usd, rate);
  displayResult(usd, vnd);
}

double getUserInput() {
  double usd = 0.0;
  print("Nhập số tiền USD: ");
  do{
    try{
      usd = double.parse(stdin.readLineSync()!);
      if(usd < 0)
        print("số tiền không thể âm!");
    }catch(e) {
      print('Vui lòng nhập giá trị số!');
    }
  } while(usd < 0);
  return usd;
}

double convertUsdToVnd(double usd, double rate) {
  return usd * rate;
}

void displayResult(double usd, double vnd) {
  print("Số tiền $usd USD tương đương với ${vnd.toStringAsFixed(2)} VND");
}
