import 'dart:io';

void main() {
  List<double> grades = inputGrade();

  if (grades.isEmpty) {
    print('Không có điểm nào được nhập.');
    return;
  }

  double gpa = calculateAverage(grades);
  print('Điểm trung bình: $gpa');

  for (double grade in grades) {
    print('Điểm: $grade - Phân loại: ${classifyStudent(grade)}');
  }

}

List<double> inputGrade() {
  List<double> grades = [];
  print('Nhập điểm của các sinh viên [0, 10], (nhập "x" để kết thúc):');
  String? input;
  double grade;
  do {
    stdout.write('Nhập điểm: ');
    input = stdin.readLineSync();
    if (input != null && input.toLowerCase() != 'x') {
      try {
        grade = double.parse(input);
        if (grade >= 0 && grade <= 10) {
          grades.add(grade);
        } else {
          print('Điểm phải thuộc khoảng [0,10].');
        }
      } catch (e) {
        print('Điểm không hợp lệ, vui lòng nhập lại.');
      }
    }
  } while (input == null || input.toLowerCase() != 'x');
  return grades;
}

double calculateAverage(List<double> grades) {
  double sum = 0.0;
  for (double grade in grades) {
    sum += grade;
  }
  return sum / grades.length;
}

String classifyStudent(double grade) {
  return (grade >= 9) ? 'xuất sắc'
      : (grade >= 8) ? 'Giỏi'
      : (grade >= 7) ? 'Khá'
      : (grade >= 6) ? 'Trung bình'
      : 'Yếu';
}
