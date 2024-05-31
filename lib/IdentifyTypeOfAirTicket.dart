import 'dart:io';

void main(){
  int age = inputAge("Nhập tuổi của hành khách: ");
  String memberType = '';
  bool isMember = false;
  if(!isChild(age)) {
    isMember = getMemberShipStatus("Bạn có muốn đăng kí thành viên không? (Yes/No)");
    memberType = choiceTypeMemebership(isMember);
  }
  print("");
  String ticketType = identifyTicketType(age, isMember, memberType);
  print(ticketType);

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

String choiceTypeMemebership(bool isMember){
  var type = '';
  if(isMember){
    do{
      print("Chọn loại thành viên bạn muốn đăng kí (Gold/Silver): ");
      type = stdin.readLineSync()!.toLowerCase();
      if(type != 'gold' && type != 'silver')
        print("Vui lòng nhập đúng loại thành viên gold/silver:");
    }while(type != 'gold' && type !='silver');
  }
  return type;
}

bool getMemberShipStatus(String mess){
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

String identifyTicketType(int age, bool isMember, String memberType){
  return isChild(age) ?  "Child Ticket"
      : isGoldMember(isMember, memberType) ? "Gold Member Ticket"
      : isSilverMember(isMember, memberType) ? "Silver Member Ticket"
      : "Standard Ticket";
}

bool isChild(int age) {
  return age < 12;
}

bool isGoldMember(bool isMember, String memberType) {
  return isMember && memberType == "gold";
}

bool isSilverMember(bool isMember, String memberType) {
  return isMember && memberType == "silver";
}