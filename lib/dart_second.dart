//======================变量=====================
import 'dart:math';
import 'dart:math';

import 'package:flutter/material.dart';

var name = 'Bob';
String name1 = 'Bob';

//空安全
String? name2; // Nullable type. Can be `null` or string.
String name3 = ""; // Non-nullable type. Cannot be `null` but can be string.

//因为数字（就像 Dart 中的其他所有东西一样）都是对象。
// int? lineCount;
// assert(lineCount == null);

void a1() {
  int lineCount;
  bool weLikeToCount = true;
  if (weLikeToCount) {
    lineCount = 1;
  } else {
    lineCount = 0;
  }
  print(lineCount);
// 顶级变量和类变量是延迟初始化的，它们会在第一次被使用时再初始化。
}

//延时初始化
late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}

//
late String temperature = readThermometer(); // Lazily initialized
String readThermometer() {
  return "";
}

//终值 (final) 和常量 (const)
//const 变量是编译时常量。（const 常量隐式包含了 final。）

var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`

//===================================
//==============操作符==================
//===================================
// a++
// a + b
// a = b
// a == b
// c ? a : b
// a is T    a as T

// ===============??赋值
// Assign value to a
// a = value;
// Assign value to b if b is null; otherwise, b stays the same
// b ??= value;

var visibility = true ? 'public' : 'private';

// ??  就是 ?:  判空或者
String playerName(String? name) => name ?? 'Guest';

// ..  省去多余代码  ?.
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

// ?..  如果可能是空，在第一个调用
// querySelector('#confirm') // Get an object.
// ?..text = 'Confirm' // Use its members.
// ..classes.add('important')
// ..onClick.listen((e) => window.alert('Confirmed!'))
// ..scrollIntoView();

//var button = querySelector('#confirm');
// button?.text = 'Confirm';
// button?.classes.add('important');
// button?.onClick.listen((e) => window.alert('Confirmed!'));
// button?.scrollIntoView();

// fooList?[1]

//===================================
//==============类型==================
//===================================
// You can put the value of an expression inside a string by using ${expression}.

var s1 = '''
You can create
multi-line strings like this one.
''';

// You can create a “raw” string by prefixing it with r:

var s = r'In a raw string, not even \n gets special treatment.';

//================记录表达式========================
var record1 = ('first', a: 2, b: true, 'last');

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void a5() {
  var swap2 = swap((1, 2));
}

void a6() {
  // Record type annotation in a variable declaration:
  (String, int) record2 = ('A string', 123);
  record2.$1;
  record2.$2;

// Record type annotation in a variable declaration:
  ({int a, bool b}) record3 = (a: 123, b: true);
  record3.a;
  record3.b;

  (num, Object) pair = (42, 'a');
  var first = pair.$1; // Static type `num`, runtime type `int`.
  var second = pair.$2; // Static type `Object`, runtime type `String`.

  //比较
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // Prints 'true'.
}

//多结果返回
// Returns multiple values in a record:
(String, int) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

final json = <String, dynamic>{
  'name': 'Dash',
  'age': 10,
  'color': 'blue',
};

void a7() {
  // Destructures using a record pattern:
  var (name, age) = userInfo(json);
  print(name + age.toString());
/* Equivalent to:
  var info = userInfo(json);
  var name = info.$1;
  var age  = info.$2;
*/
}

//================集合========================

void a8() {
  var list = [
    'Car',
    'Boat',
    'Plane',
  ];

  //set
  var sets = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.

  //编译时常量
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };

  // map

  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  var gifts1 = Map<String, String>();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  //展开操作符  addall
  var list11 = [1, 2, 3];
  var list22 = [0, ...list];
  assert(list22.length == 4);

  var list33 = [0, ...?list];
  assert(list33.length == 1);

  // collection if and collection for
  var promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  var login = "2";
  var nav1 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
}

//================泛型========================
abstract class Cache<T> {
  T getByKey(String key);

  void setByKey(String key, T value);
}

void a9() {
  var names = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>); // true
}

//泛型限制
class Foo<T extends String> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}

//泛型方法
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

//=================类型别名================

typedef IntList = List<int>;

IntList il = [1, 2, 3];
//目的是为了更简短，用在viewModel中网络请求还是好用的。
typedef ListMapper<X> = Map<X, List<X>>;

Map<String, List<String>> m1 = {}; // Verbose.
ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

//把一个函数类型 起 别名
typedef Compare<T> = int Function(T a, T b);
//定义了一个函数
int sort(int a, int b) => a - b;

void main1() {
  assert(sort is Compare<int>); // True!
}

//类型安全
void printInts(List<int> a) => print(a);

void main2() {
  final list = [];
  list.add(1);
  list.add('2');
  //error - The argument type 'List<dynamic>' can't be assigned to the parameter type 'List<int>'. - argument_type_not_assignable
  // printInts(list);
}

//=======================模式匹配==================

void a10() {
  const a = 'a';
  const b = 'b';
  var obj = ["1"];
  switch (obj) {
// List pattern [a, b] matches obj first if obj is a list with two fields,
// then if its fields match the constant subpatterns 'a' and 'b'.
  //case [a, b]: 是两个元素数组， 而且元素类型也一样
    case [a, b]:
      print('$a, $b');
  }

  var (a1, b1) = ('left', 'right');
  (b1, a1) = (a1, b1); // Swap.
  print('$a1 $b1'); // Prints "right left".

  //=================
  var obj1 = 1;
  switch (obj1) {
  // Matches if 1 == obj.
    case 1:
      print('one');

  // Matches if the value of obj is between the
  // constant values of 'first' and 'last'.
    case >= 1 && <= 5:
      print('in range');

  // Matches if obj is a record with two fields,
  // then assigns the fields to 'a' and 'b'.
    case (var a, var b):
      print('a = $a, b = $b');

    default:
  }
// var color  = Color(1).red
//
//   var isPrimary = switch (color) {
//     Color.red || Color.yellow || Color.blue => true,
//     _ => false
//   };

  //=================for
  Map<String, int> hist = {
    'a': 23,
    'b': 100,
  };

  for (var MapEntry(key: key, value: count) in hist.entries) {
    print('$key occurred $count times');
  }

  for (var MapEntry(:key, value: count) in hist.entries) {
    print('$key occurred $count times');
  }
}

//sealed
sealed class Shape {}

class Square implements Shape {
  final double length;

  Square(this.length);
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);
}

double calculateArea(Shape shape) =>
    switch (shape) {
      Square(length: var l) => l * l, Circle(radius: var r) => 3.14 * r * r
    };

String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    _ => ''
  };
}

void a11(String? maybeString) {
  switch (maybeString) {
    case var s?:
    // 's' has type non-nullable String here.
      print(s.isEmpty);
  }

  List<String?> row = ['user', null];
  switch (row) {
    case ['user', var name!]: // ...
    // 'name' is a non-nullable string here.
      print(name);
  }

  (int?, int?) position = (2, 3);
  var (x!, y!) = position;
  var (a, b) = position;
  x.isOdd;
  // a.isOdd;//a可能是null

  switch ((1, 2)) {
  // 'var a' and 'var b' are variable patterns that bind to 1 and 2, respectively.
    case (var a, var b): // ...
    // 'a' and 'b' are in scope in the case body.
  }

  switch ((1, 2)) {
  // Does not match.
    case (int a, String b): // ...
  }
  //简单来说就是模式匹配，匹配上了类型，就赋值。

  var list = [1, 2, 3];
  var [_, two, _] = list;
  two.isOdd;
}

//=======================函数==================

//Dart is a true object-oriented language, so even functions are objects and have a type, Function.
// This means that functions can be assigned to variables or passed as arguments to other functions.

bool isNoble(int atomicNumber) => true;

/// Sets the [bold] and [hidden] flags ...   这是一个set
void enableFlags({bool? bold, bool hidden = false}) {}

// bold will be true; hidden will be false.
void a12() {
  enableFlags(hidden: true);
}

// const Scrollbar({super.key, required Widget child});

//可选参数 []  可以穿
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String say1(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

String say3(String from, String msg, [bool hidden = false]) {
  var result = '$from says $msg';
  return result;
}

void a13() {
  say("from", "msg");
}

//直接调用

void a14() {
  var list = [1, 2, 3];

// Pass printElement as a parameter.
  list.forEach(printElement);

  //匿名函数定义
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');

  const list1 = ['apples', 'bananas', 'oranges'];
  list1.map((item) {
    return item.toUpperCase();
  }).forEach((item) {
    print('$item: ${item.length}');
  });
}
void printElement(int element) {
  print(element);
}


// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main3() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);
  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}

//生成器函数
//When you need to lazily produce a sequence of values, consider using a generator function
//处理一系列数据，返回给你List不高效，一个个返回比较好。
//同步的
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
//异步的
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

void a15() {
  naturalsTo(5).forEach((element) {
    //一个个的接收，同步的
  });
}


//=======================控制流==================

void a16() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }

  // for (final Candidate(:name, :yearsExperience) in candidates) {
  //   print('$name has $yearsExperience of experience.');
  // }
  var pair = [1, 2]; //匹配两个 int  ，用is还不行，is是类型匹配，不是模式匹配
  if (pair case [int x, int y]){
    print(x);
  }

  var command = "";
  switch (command) {
    case 'OPEN':
      // executeOpen();
      continue newCase; // Continues executing at the newCase label.

    case 'DENIED': // Empty case falls through.
    case 'CLOSED':
      // executeClosed(); // Runs for both DENIED and CLOSED,

    newCase:
    case 'PENDING':
      // executeNowClosed(); // Runs for both OPEN and PENDING.
  }


  // token = switch (charCode) {
  //   slash || star || plus || minus => operator(charCode),
  //   comma || semicolon => punctuation(charCode),
  //   >= digit0 && <= digit9 => number(),
  //   _ => throw FormatException('Invalid')
  // };


  //A default case (default or _) covers all possible values that can flow through a switch.


  try {
    // breedMoreLlamas();
  } on OutOfMemoryError {
    // A specific exception
    // buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }

}





