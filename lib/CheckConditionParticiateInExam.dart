import 'dart:io';
void main() {
  var age = inputAge("Nhập tuổi của người tham gia thi: ");
  var isRegistered = getRegisterStatus("Bạn đã đăng ký chưa? (Yes/No): ");
  print(checkConditionExam(age, isRegistered));
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

bool getRegisterStatus(String mess){
  print(mess);
  bool status = false;
  String response;
  do{
    response = stdin.readLineSync()!.toLowerCase();
    if(response == 'yes' || response =='y')
      status = true;
    else if(response == 'no' || response =='n')
      status = false;
    else
      print("Vui lòng nhập đúng định dạng yes/no");
  }while(response != 'yes' && response != 'no' && response != 'y' && response != 'n');
  return status;
}

String checkConditionExam(int age, bool isRegistered) {
  return (age > 18 && isRegistered) ? "Người đăng kí đủ điều kiện tham gia cuộc thi!"
      : "Người đăng kí không đủ điều kiện tham gia cuộc thi!";
}