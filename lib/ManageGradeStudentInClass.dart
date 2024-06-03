import 'dart:io';

void main() {
  Map<String, double> studentScores = {};

  int choice;
  do {
    printMenu();
    choice = int.parse(stdin.readLineSync() ?? "0");
    switch (choice) {
      case 1:
        addStudentScore(studentScores);
        break;
      case 2:
        updateStudentScore(studentScores);
        break;
      case 3:
        removeStudent(studentScores);
        break;
      case 4:
        printAllStudentScores(studentScores);
        break;
      case 5:
        printStudentScore(studentScores);
        break;
      case 6:
        print("Thoát chương trình.");
        break;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng chọn lại.");
    }
  } while (choice != 6);
}

void printMenu() {
  print("\n--- Menu Quản Lý Điểm Số Học Sinh ---");
  print("1. Thêm điểm số học sinh mới");
  print("2. Cập nhật điểm số học sinh");
  print("3. Xóa học sinh");
  print("4. In danh sách học sinh và điểm số");
  print("5. Tìm điểm số của học sinh");
  print("6. Thoát");
  print("Nhập lựa chọn của bạn: ");
}

void addStudentScore(Map<String, double> studentScores) {
  print("Nhập tên học sinh cần thêm: ");
  String name = stdin.readLineSync() ?? "";
  print("Nhập điểm số của học sinh $name: ");
  double? score = double.tryParse(stdin.readLineSync() ?? "");

  if (score != null) {
    studentScores[name] = score;
    print("Đã thêm học sinh $name với điểm số $score.");
  } else {
    print("Điểm số không hợp lệ.");
  }
}

void updateStudentScore(Map<String, double> studentScores) {
  print("Nhập tên học sinh cần cập nhật điểm số: ");
  String name = stdin.readLineSync() ?? "";
  if (studentScores.containsKey(name)) {
    print("Nhập điểm số mới của học sinh $name: ");
    double? score = double.tryParse(stdin.readLineSync() ?? "");
    if (score != null) {
      studentScores[name] = score;
      print("Đã cập nhật điểm số của học sinh $name thành $score.");
    } else {
      print("Điểm số không hợp lệ.");
    }
  } else {
    print("Không tìm thấy học sinh $name.");
  }
}

void removeStudent(Map<String, double> studentScores) {
  print("Nhập tên học sinh cần xóa: ");
  String name = stdin.readLineSync() ?? "";
  print(studentScores.remove(name) != null ?"Đã xóa học sinh $name."
    :"Không tìm thấy học sinh $name.");
}

void printAllStudentScores(Map<String, double> studentScores) {
  print("Danh sách học sinh và điểm số:");
  studentScores.forEach((name, score) {
    print("$name: $score");
  });
}

void printStudentScore(Map<String, double> studentScores) {
  print("Nhập tên học sinh cần tìm điểm số: ");
  String name = stdin.readLineSync() ?? "";
  print(studentScores.containsKey(name)
      ? "Điểm số của học sinh $name là ${studentScores[name]}."
      :"Không tìm thấy học sinh $name."
  );
}
