//=====================类& 对象=============================

// const 构造函数 和 const实例，   可以构造一个编译时常量，
void a17() {
  //Some classes provide constant constructors.
  // To create a compile-time constant using a constant constructor,
  // put the const keyword before the constructor name:
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  assert(identical(a, b)); // They are the same instance!

  var a1 = const ImmutablePoint(1, 1); // Creates a constant
  var b1 = ImmutablePoint(1, 1); // Does NOT create a constant

  assert(!identical(a1, b1)); // NOT the same instance!
}

class ImmutablePoint {
  const ImmutablePoint(int i, int j);
}

//============== final 运行时常量 ，只能赋值一次
//Instance variables can be final, in which case they must be set exactly once
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);

  ProfileMark.unnamed() : name = '';
}

//===============每个类都是隐式接口。

//Static variables Static methods
class Queue {
  static const initialCapacity = 16;
// ···
}

//=====构造方法

class Vector2d {
  final double x;
  final double y;

  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the y parameter to the named super constructor like:
  // 等于
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

//Besides invoking a superclass constructor, you can also initialize instance variables
// before the constructor body runs. Separate initializers with commas.

// Initializer list sets instance variables before the constructor body runs.
//初始化列表，before the constructor body runs.
//在构造函数前运行
/**
 * fromJsonPoint.fromJson(Map<String, double> json)
    : x = json['x']!,
    y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
    }
 */

//this
class Point {
  double x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);
}

//常量构造函数  Constant constructors
//If your class produces objects that never change, you can make these objects compile-time constants.
// To do this, define a const constructor and make sure that all instance variables are final.
class ImmutablePoint1 {
  static const ImmutablePoint1 origin = ImmutablePoint1(0, 0);

  //都是final
  final double x, y;

  const ImmutablePoint1(this.x, this.y);
}

//Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
// factory构造函数，允许不创建新的对象，返回你要返回的对象。
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

//====================成员方法================

//定义operator
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);

  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object other) => other is Vector && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}

//getter setter
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;

  set right(double value) => left = value - width;

  double get bottom => top + height;

  set bottom(double value) => top = value - height;
}

void main1() {
  var rect = Rectangle(3, 4, 20, 15);

  assert(rect.left == 3);
  rect.right = 12; // setter 相当于执行的语句，否则你还是要定义一个方法
  assert(rect.left == -8);
}

//混合继承  Mixins

//=================拓展方法=================
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
// ···
}

a18() {
  "11".parseInt();

  //You can’t invoke extension methods on variables of type dynamic. F
  //or example, the following code results in a runtime exception:
  dynamic d = '2';
  print(d.parseInt()); // Runtime exception: NoSuchMethodError
}

//You can invoke an unnamed extension’s static members only within the extension declaration.
//只能在定义处调用
extension on String {
  bool get isBlank => trim().isEmpty;
}

//call  objects  类（）   执行的方法 叫call
class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

void a19() {
  var wf = WannabeFunction();
  var out = wf('Hi', 'there,', 'gang');
  void main() => print(out);
}

//base 不允许 mixin  和implements
// To enforce inheritance of a class or mixin’s implementation,
// use the base modifier. A base class disallows implementation outside of its own library. T

//https://dart.cn/language/modifier-reference
// Declaration	Construct?	Extend?	Implement?	Mix in?	Exhaustive? (穷举)
// class	Yes	Yes	Yes	No	No
// base class	Yes	Yes	No	No	No
// interface class	Yes	No	Yes	No	No
// final class	Yes	No	No	No	No
// sealed class	No	No	No	No	Yes
// abstract class	No	Yes	Yes	No	No
// abstract base class	No	Yes	No	No	No
// abstract interface class	No	No	Yes	No	No
// abstract final class	No	No	No	No	No
// mixin class	Yes	Yes	Yes	Yes	No
// base mixin class	Yes	Yes	No	Yes	No
// abstract mixin class	No	Yes	Yes	Yes	No
// abstract base mixin class	No	Yes	No	Yes	No
// mixin	No	No	Yes	Yes	No
// base mixin	No	No	No	Yes	No

//====================异步编程=======
// 消耗时间的，写法和同步一样。

Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}

lookUpVersion() {}

// await for  直到循环结束，或者break
void main3() async {
  // ...
  // await for (final request in requestServer) {
  //   handleRequest(request);
  // }
  // ...
}

void handleRequest(request) {}

//异步场景包括调用系统 API，例如非阻塞的 I/O 操作、HTTP 请求或与浏览器交互。
// 还有一些场景是利用 Dart 的 isolate 进行计算，或等待一个计时器的触发。这些场景要么是在不同的线程运行，
// 要么是被系统或 Dart 运行时处理，让 Dart 代码可以在计算时同步运行
