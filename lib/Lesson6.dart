void main() {
  // bool isAdult = true;
  // bool hasID = false;
  //
  // print(isAdult && hasID); // false
  // print(isAdult || hasID); // true
  // print(!isAdult);         // false
  //
  // List<String> names = ['Alice', 'Bob', 'Charlie'];
  // for (var item in numbers){
  //   print(item);
  // }
  // List<int> numbers = [1, 2, 3];
  // numbers.add(4); // Danh sách bây giờ là [1, 2, 3, 4]
  // numbers.remove(2); // Danh sách bây giờ là [1, 3, 4]
  // print(numbers.length); // 3
  // print(numbers.sublist(1,3));

  // String? name; // name có thể null
  // name = 'Alice';
  //
  // int? age;
  // age = null; // hợp lệ
  //
  // String? name;
  // print(name?.length); // null, không gây lỗi
  //
  // int? age;
  // int defaultAge = age ?? 18; // defaultAge là 18 nếu age là null
  bool addItem = true;
  List<int> items = [
    1,
    2,
    if (addItem) 3, // 3 chỉ được thêm vào nếu addItem là true
  ];
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> combinedList = [...list1, ...list2]; // [1, 2, 3, 4, 5, 6]
}