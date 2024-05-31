import 'dart:io';

void main() {
  List<String> students = ['long', 'duc', 'tran'];
  runMenu(students);
}

void runMenu(List<String> students) {
  String? choice;
  do {
    printMenu();
    choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        String result = addStudent(students);
        print(result);
        break;
      case '2':
        String result = removeStudent(students);
        print(result);
        break;
      case '3':
        String result = findStudent(students);
        print(result);
        break;
      case '4':
        printStudentCount(students);
        break;
      case '5':
        printAllStudents(students);
        break;
      case '6':
        print('Thoát chương trình.');
        break;
      default:
        print('Tùy chọn không hợp lệ, vui lòng chọn lại.');
        print("");
    }
  } while (choice != '6');
}

void printMenu() {
  print('Quản Lý Danh Sách Sinh Viên');
  print('1.Thêm một sinh viên mới vào danh sách.');
  print('2.Xóa một sinh viên khỏi danh sách dựa trên tên của họ.');
  print('3.Tìm và in ra vị trí của một sinh viên trong danh sách.');
  print('4.In ra số lượng sinh viên trong danh sách.');
  print('5.In ra toàn bộ danh sách sinh viên.');
  print('6. Thoát chương trình');
  print('Vui lòng chọn một tuỳ chọn trong 6 tuỳ chọn trên.');
}

String addStudent(List<String> students) {
  print('Nhập tên sinh viên mới: ');
  String? newStudent = stdin.readLineSync();
  if (newStudent != null && isValidName(newStudent)) {
    students.add(newStudent.toLowerCase());
    return 'Đã thêm sinh viên ${newStudent.toUpperCase()} vào danh sách.';
  } else {
    return 'Tên sinh viên không hợp lệ. Tên chỉ được chứa các chữ cái và khoảng trắng.';
  }
}

bool isValidName(String name) {
  final RegExp nameExp = RegExp(r'^[a-zA-Z\s]+$');
  return nameExp.hasMatch(name);
}

String removeStudent(List<String> students) {
  print('Nhập tên sinh viên cần xóa: ');
  String? studentToDelete = stdin.readLineSync();
  if (studentToDelete != null && isValidName(studentToDelete)) {
    return students.remove(studentToDelete.toLowerCase())
        ? 'Đã xóa sinh viên ${studentToDelete.toUpperCase()} khỏi danh sách.'
        : 'Không tìm thấy sinh viên ${studentToDelete.toUpperCase()}.';
  } else {
    return 'Tên sinh viên không hợp lệ. Tên chỉ được chứa các chữ cái và khoảng trắng.';
  }
}

String findStudent(List<String> students) {
  print('Nhập tên sinh viên cần tìm: ');
  String? studentToFind = stdin.readLineSync();
  if (studentToFind != null && isValidName(studentToFind)) {
    int index = students.indexOf(studentToFind.toLowerCase());
    return (index != -1)
        ? 'Sinh viên ${studentToFind.toUpperCase()} có vị trí là $index.'
        : 'Không tìm thấy sinh viên ${studentToFind.toUpperCase()}.';
  } else {
    return 'Tên sinh viên không hợp lệ. Tên chỉ được chứa các chữ cái và khoảng trắng.';
  }
}

void printStudentCount(List<String> students) =>
    print('Số lượng sinh viên trong danh sách là: ${students.length}');

void printAllStudents(List<String> students) {
  print('Danh sách sinh viên:');
  for (var student in students) {
    print(student.toUpperCase());
  }
}
