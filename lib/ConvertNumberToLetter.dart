import 'dart:io';

void main() {
  int number = getUserInput();
  String words = convertNumberToWords(number);
  print(words);
}

int getUserInput() {
  int number = -1;
  print("Nhập số nguyên không âm (tối đa 3 chữ số): ");
  do{
    try{
      number = int.parse(stdin.readLineSync()!);
      if(number < 0 || number > 999)
        print("Vui lòng nhập số trong khoảng từ [0,999]!");
    }catch(e) {
      print('Vui lòng nhập số nguyên');
    }
  } while(number < 0 || number >999);
  return number;
}

String convertNumberToWords(int number) {
  if (number < 10) {
    return oneDigitToWords(number);
  } else if (number < 20) {
    return teenToWords(number);
  } else if (number < 100) {
    return tensToWords(number);
  } else {
    return hundredsToWords(number);
  }
}

String oneDigitToWords(int number) {
  switch (number) {
    case 0: return "zero";
    case 1: return "one";
    case 2: return "two";
    case 3: return "three";
    case 4: return "four";
    case 5: return "five";
    case 6: return "six";
    case 7: return "seven";
    case 8: return "eight";
    case 9: return "nine";
    default: return "";
  }
}

// 10 -> 19
String teenToWords(int number) {
  switch (number) {
    case 10: return "ten";
    case 11: return "eleven";
    case 12: return "twelve";
    case 13: return "thirteen";
    case 14: return "fourteen";
    case 15: return "fifteen";
    case 16: return "sixteen";
    case 17: return "seventeen";
    case 18: return "eighteen";
    case 19: return "nineteen";
    default: return "";
  }
}

// 20 -> 99
String tensToWords(int number) {
  int tens = number ~/ 10;
  int ones = number % 10;
  String tensWord = "";
  switch (tens) {
    case 2: tensWord = "twenty"; break;
    case 3: tensWord = "thirty"; break;
    case 4: tensWord = "forty"; break;
    case 5: tensWord = "fifty"; break;
    case 6: tensWord = "sixty"; break;
    case 7: tensWord = "seventy"; break;
    case 8: tensWord = "eighty"; break;
    case 9: tensWord = "ninety"; break;
  }
  if (ones > 0) {
    return "$tensWord ${oneDigitToWords(ones)}";
  } else {
    return tensWord;
  }
}

// 100 -> 999
String hundredsToWords(int number) {
  int hundreds = number ~/ 100;
  int remainder = number % 100;
  String hundredsWord = "${oneDigitToWords(hundreds)} hundred";
  if (remainder > 0) {
    return "$hundredsWord and ${convertNumberToWords(remainder)}";
  } else {
    return hundredsWord;
  }
}
