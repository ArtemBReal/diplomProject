var num = 10;
var word = 'Hello';

const constData = 5;

void main(List<String> arguments) {
  //работа с переменными
  /*
  var point = 4.5;
  print(num);
  print(word);
  print(point);
  print('Переменная: ${point + 0.5}. Что-то ещё: ${word.toUpperCase()}');

  dynamic dynamicData = 5;
  dynamicData = 'word';
  dynamicData = false;
  print(dynamicData);
  print(constData);

  var a = 15.2, b = 5;
  print('+ : ${a + b}');
  print('- : ${a - b}');
  print('* : ${a * b}');
  print('/ : ${a ~/ b}');
  print('% : ${a % b}');
  */

  //условные операторы
  /*
  var a = 15, b = 5;
  if (a == b) {
    print('Yes');
  } else {
    print('No');
  }

  //var res;
  //if (a == 5) {
  //  res = 10;
  //}else{
  //  res = 20;
  //}

  var res = a == 5 ? 10 : 20; //тернарный оператор

  var digit = 5;
  switch (digit) {
    case 2:
      print('Equal 2');
      break;
    case 5:
      print('Equal 5');
      break;
    default:
      print('Number is unknown');
  }
  */

  //списки данных
  /*
  var nums = [5, 7, 'Да', 9.1, false]; //List()
  nums.add('Добавил');
  print(nums);
  nums.addAll([5, 2, 3, 1]);
  print(nums);

  nums.remove(1);
  nums.removeAt(5);
  print(nums);

  //nums.removeWhere((element) => (element >= 5));

  print('First: ${nums.first}. Last: ${nums.last}. Length: ${nums.length}');

  List<int> nums2;
  nums2 = [4, 6, 7];

  print(nums2);

  var digits = {5, 6, 7, 2, 5, 3, 6}; //Set<int>
  print(digits);
  */

  //Циклы
  /*
  var nums = [5, 7, 8, 2, 5];

  //for (var i = 0; i < nums.length; i++) {
  //  print('Element $i: ${nums[i]}');
  //}

  //for (var element in nums) {
  //  print('Element: $element');
  //}

  //nums.forEach((element) {
  //  print(element);
  //});

  var i = 0;
  while (i < 10) {
    i++;
    //print('Element $i: ${nums[i]}');
    print(i);
  }
  */

  //Функции
  /*
  var res = sum('a', 'b');
  print('Res: $res');
  */

  //Классы
  var bob = User();
  bob.name = 'Bob';
  print(bob.name);

  var alice = User()
    ..name = 'Alice'
    ..age = 21;
  print('\n${alice.name}, ${alice.age}');

  var carl = User('Carl', 40, true, ['Football', 'Skate']);
  print('\n${carl.name}, ${carl.age}, ${carl.isHappy}, ${carl.hobbies}');

  var Dan = User('Dan', 26, false, ['Dancing', 'Singing', 'Programming']);
  Dan.info();

  carl.info();
  alice.info();
}

//int sum(a, b) {
//  return a + b;
//}

//int sum(a, b) => a + b;
dynamic sum(a, b) => a + b;

//------------------------------
class User {
  String name = '';
  int age = 0;
  bool isHappy = false;
  List<String> hobbies = [];

  User([name, age, isHappy, hobbies]) {
    if (name != null) {
      this.name = name;
    }
    if (age != null) {
      this.age = age;
    }
    if (isHappy != null) {
      this.isHappy = isHappy;
    }
    if (hobbies != null) {
      this.hobbies = hobbies;
    }
  }

  void info() {
    var happy = isHappy ? 'happy' : 'not happy';
    print('\nUser $name is $age years old. He is $happy. His hobbies:');
    hobbies.forEach((element) {
      print(element);
    });
  }
}
