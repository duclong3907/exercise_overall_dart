import 'dart:io';
void main() {
  var agePerson1 = inputAge("Nhập tuổi của người thứ nhất: ");
  var agePerson2 = inputAge("Nhập tuổi của người thứ hai: ");
  print(ResultCompareAges(agePerson1, agePerson2));
}

int inputAge(String mess) {
  int agePerson = 0;
  do{
    print(mess);
    try{
      agePerson = int.parse(stdin.readLineSync()!);
      if(agePerson <= 0 || agePerson >= 150)
        print("Tuổi không hợp lệ!");
    }catch(e) {
      print('Vui lòng nhập số nguyên');
    }
  }while(agePerson <= 0 || agePerson >= 150);
  return agePerson;
}

String ResultCompareAges(int agePerson1, int agePerson2) {
  return (agePerson1 > agePerson2) ? "Người thứ nhất lớn tuổi hơn người thứ hai!"
      : (agePerson1 < agePerson2) ? "Người thứ hai lớn tuổi hơn người thứ nhất!"
      : "Hai người bằng tuổi nhau!";
}