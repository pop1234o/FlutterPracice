import 'dart:io';

class DartMain {
  void main() {
    //https://dart.cn/
    //dart有点像 java+kotlin ，写法上像java，然后加了一些kotlin的特性
  }

  void a1() {
    //胖箭头 ,匿名函数
    //flybyObjects.where((name) => name.contains('turn')).forEach(print);
    /*
    *
    *
    *
    * */

    //类的定义，构造函数，创建对象和kotlin一样，不用new
    var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
    voyager.describe();

    var voyager3 = Spacecraft.unlaunched('Voyager III');
    voyager3.describe();
  }
}

class Spacecraft {
  String name;
  DateTime? launchDate; //可null 变量（属性）

  // Read-only non-final property   只读非final的属性
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  //直接给属性赋值，不用写了
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // 匿名构造函数，只能定义一次
  // Spacecraft(this.name,String abc) {
  //   // Initialization code goes here.
  // }

  // Named constructor that forwards to the default one.
  //重载 自定义的构造函数
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//=======枚举=========
enum PlanetType { terrestrial, gas, ice }

String a1(PlanetType type) {
  //和Java一样，必须用 ; 结尾
  if (PlanetType.gas == type) {}
  return "11";
}

// ============增强枚举============
/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  //定义默认枚举，构造函数中传入默认值
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  /// required 代表必须传入
  const Planet({required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant => planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void a2() {
  const yourPlanet = Planet.mercury;
  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }
}

//继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

//多继承
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
// ···
}

void a3() {
  //自此，PilotedCraft 类中就包含了 astronauts 字段以及 describeCrew() 方法。
  var yourPlanet = PilotedCraft("name", DateTime.now());
  var astronauts = yourPlanet.astronauts;
}

//所有的类都隐式定义成了一个接口。因此，任意类都可以作为接口被实现。
class MockSpaceship implements Spacecraft, Piloted {
  @override
  DateTime? launchDate;

  @override
  String name = "";

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();

  @override
  int astronauts = 0;

  @override
  void describeCrew() {
    // TODO: implement describeCrew
  }
// ···
}

//抽象类
abstract class Describable {
  //抽象方法
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

//异步

const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> printWithDelay1(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

//async 和 await 关键字有助于使异步代码变得易于阅读。
// async 相当于创建了一个域，await就是执行异步的方法
Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

//你也可以使用 async* 关键字，其可以为你提供一个可读性更好的方式去生成 Stream。
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    //想stream中插入一个数据
    yield '${craft.name} flies by $object';
  }
}

//异常
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
