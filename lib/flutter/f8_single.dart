
https://flutter.cn/community/tutorials/singleton-pattern-in-flutter-n-dart

class LazySingleton {
  LazySingleton._privateConstructor();

  static late final LazySingleton _instance = LazySingleton._privateConstructor();

  factory LazySingleton() {
    return _instance;
  }

  void someMethod() {
    print('Hello, Lazy Singleton here!');
  }
}

class LazySingleton1 {
  LazySingleton1._privateConstructor();

  static LazySingleton1? _instance;

  static LazySingleton1 get instance {
    _instance ??= LazySingleton1._privateConstructor();
    return _instance!;
  }

  void someMethod() {
    print('Hello, Lazy Singleton here!');
  }
}
