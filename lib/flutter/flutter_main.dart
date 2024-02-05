



//StatelessWidget
//


//您可能想知道为什么StatefulWidget和State是单独的对象。在Flutter中，这两类对象有不同的生命周期。
// Widgets是临时对象，用于构造应用程序当前状态的表示。State另一方面，对象在调用之间是持久的 build()，允许它们记住信息。


//控件逻辑独立封装

//定义callback typedef CartChangedCallback = Function(Product product, bool inCart);



//state 中 weight获取

//，如果要添加 padding、margin、边框或背景颜色，你就可以用上 Container 了。


//所有布局 widgets 都具有以下任一项：
//
//一个 child 属性，如果它们只包含一个子项 —— 例如 Center 和 Container
//
//一个 children 属性，如果它们包含多个子项 —— 例如 Row、Column、ListView 和 Stack

//一个 Flutter app 本身就是一个 widget，大多数 widgets 都有一个 build() 方法，在 app 的 build() 方法中实例化和返回一个 widget 会让它显示出来。



//在 Flutter 中创建行或列，可以将子 widgets 列表添加到 Row 或 Column widget 中
//通过使用 Expanded widget，可以调整 widgets 的大小以适合行或列。

//一个个控件组合的写法
// final leftColumn = Container(
//   padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//   child: Column(
//     children: [
//       titleText,
//       subTitle,
//       ratings,
//       iconList,
//     ],
//   ),
// );


//=============container
//增加 padding、margins、borders
//改变背景色或者图片
//只包含一个子 widget，但是这个子 widget 可以是行、列或者是 widget 树的根 widget
//Container 还用来为每个图片添加圆角和外边距：

//============GridView
//==============Stack 多个控件叠加。

//===============Card
// 默认情况下，Card 的大小是 0x0 像素。你可以使用 SizedBox 控制 card 的大小。
//================== ListTile 用来做item
//它可以很轻松的创建一个包含三行文本以及可选的行前和行尾图标的行。 ListTile 在 Card 或者 ListView 中最常用，但是也可以在别处使用






// android 与 widget
//widget 和 View 还是有一些差异。首先，widget 有着不一样的生命周期：它们是不可变的，一旦需要变化则生命周期终止。
// 任何时候 widget 或它们的状态变化时， Flutter 框架都会创建一个新的 widget 树的实例。
// 对比来看，一个 Android View 只会绘制一次，除非调用 invalidate 才会重绘。


// Text Widget 是一个普通的 StatelessWidget,假如你想要动态地改变 “I Like Flutter”，例如当你点击一个 FloatingActionButton 的时候，该怎么办呢？
// 为了实现这个效果，将 Text Widget 嵌入一个 StatefulWidget 中


//如何在布局中添加或删除一个组件？ 返回不同的组件


//在 Flutter 中你需要使用 Navigator 和 Route 在同一个 Activity 内的不同界面间进行跳转。
// void main() {
//   runApp(MaterialApp(
//     home: const MyAppHome(), // Becomes the route named '/'.
//     routes: <String, WidgetBuilder>{
//       '/a': (context) => const MyPage(title: 'page A'),
//       '/b': (context) => const MyPage(title: 'page B'),
//       '/c': (context) => const MyPage(title: 'page C'),
//     },
//   ));
// }

// Navigator.of(context).pushNamed('/b');

//再例如，你需要执行消耗 CPU 的计算密集型工作，那么你可以将其转移到一个 Isolate 上以避免阻塞事件循环
// io 密集用async

//http flutter pub add http

//如果 Widget 不支持事件监听，将 Widget 包装进一个 GestureDetector 中并向 onTap 参数传入一个方法。

//sp
// Future<void> _incrementCounter() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int counter = (prefs.getInt('counter') ?? 0) + 1;
//   await prefs.setInt('counter', counter);
// }









