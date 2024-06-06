


// https://docs.flutter.cn/
//https://book.flutterchina.club/chapter1


//StatelessWidget


//Scaffold class 脚手架
// Implements the basic Material Design visual layout structure.This class provides APIs for showing drawers and bottom sheets.

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
//Expanded 和 Flexible——允许 Row 或 Column 的子级填充剩余空间或者尽可能地小。

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



//基础列表

//SingleChildScrollView    ListView.builder or GridView.builder.
// DraggableScrollableSheet  ! ListWheelScrollView
// Slivers 各种滑动


// 自适应应用和响应式应用的区别
// 自适应 和 响应式 可以看作应用里的两种维度：你的应用可能是自适应的，但不是响应式的，又或是反行其道。当然，你的应用可能既自适应又为响应式，也可能两者均未实现。
// 响应式
// 通常来说，一个 响应式 应用的布局会根据可用的屏幕大小而调整。常见的场景是在用户重新调整窗口大小或旋转屏幕时，重新布局 UI。对于需要在多种设备（手表、手机、平板、笔记本或台式机）上运行的应用而言，这是必要的要素。
// 自适应
// 应用以 自适应 的方式在不同的设备上（移动端和桌面端）运行，需要同时处理鼠标、键盘和触控输入。这也意味着应用的视觉密度、组件的选择（层级菜单或底部抽屉）、平台特定的行为（例如置顶的窗口）等内容将在不同的平台上有一定的差异。



//单子级 (Single child)
//
//Align——让子级在其内部进行对齐。可使用 -1 至 1 之间的任意值在垂直和水平方向上进行对齐。
//AspectRatio——尝试让子级以指定的比例进行布局。
//ConstrainedBox——对子级施加尺寸限制，可以控制最小和最大的尺寸。
//CustomSingleChildLayout——使用代理方法对单个子级进行定位。代理方法可以为子级确定布局限制和定位。
//Expanded 和 Flexible——允许 Row 或 Column 的子级填充剩余空间或者尽可能地小。
//FractionallySizedBox——基于剩余空间的比例限定子级的大小。
//LayoutBuilder——让子级可以基于父级的尺寸重新调整其布局。
//SingleChildScrollView——为单一的子级添加滚动。通常配合 Row 或 Column 进行使用。
// SizedBox( 可以添加宽高 当 Text 在 40 和 41 之间变化时，将文本放在 SizedBox 中并设置其宽度可防止出现明显的「跳跃」，因为这些值具有不同的宽度。
//
//多子级 (Multi child)
//Column、Row 和 Flex—— 在同一水平线或垂直线上放置所有子级。 Column 和 Row 都继承了 Flex widget。
//CustomMultiChildLayout—— 在布局过程中使用代理方法对多个子级进行定位。
//Flow——相对于 CustomMultiChildLayout 更高效的布局方式。在绘制过程中使用代理方法对多个子级进行定位。
//ListView、GridView 和 CustomScrollView—— 为所有子级增加滚动支持。
//Stack——基于 Stack 的边界对多个子级进行放置和定位。与 CSS 中的 position: fixed 功能类似。
//Table——使用经典的表格布局算法，可以组合多列和多行。
//Wrap——将子级顺序显示在多行或多列内。


//状态管理
//1 自己管理状态。
//2 父控件管理 ，变量在父控件中，  当检测到点击时，它会通知父 widget，调用 setState 来管理

// final bool active;  直接在 Widget 中，State中可以引用到
// final ValueChanged<bool> onChanged;

//ElevatedButton、TextButton 和 CupertinoButton。

//widgets 的点击加入涟漪效果 , InkWell widget 来实现这个功能

//============================图片加载===========================
//常见的资源类型包括静态数据（例如 JSON 文件），配置文件，图标和图片（JPEG，WebP，GIF，动画 WebP / GIF，PNG，BMP 和 WBMP）。
// flutter:
// assets:
// - directory/
// - directory/subdirectory/


//主资源默认对应于 1.0 倍的分辨率图片
// .../my_icon.png       (mdpi baseline)
// .../1.5x/my_icon.png  (hdpi)
// .../2.0x/my_icon.png  (xhdpi)
// .../3.0x/my_icon.png  (xxhdpi)
// .../4.0x/my_icon.png  (xxxhdpi)


//Image.network('https://picsum.photos/250?image=9'),

// cached_network_image
//CachedNetworkImage(
//   placeholder: (context, url) => const CircularProgressIndicator(),
//   imageUrl: 'https://picsum.photos/250?image=9',
// ),

//在 iOS 上，video_player 使用 AVPlayer 进行播放控制。在 Android 上，使用的是 ExoPlayer。

//===================导航=======================
// onPressed: () {
// Navigator.of(context).push(
// MaterialPageRoute(
// builder: (context) => const SongScreen(song: song),
// ),
// );
// },
// child: Text(song.name),

//// Navigate back to the first screen by popping the current route
//   // off the stack.
//   Navigator.pop(context);
//在 Android 开发中，Activity 相当于“路由”，在 iOS 开发中，ViewController 相当于“路由”。在 Flutter 中，“路由”也是一个 widget。

//传递参数，就直接在构造方法里传。
//或者   final todo = ModalRoute.of(context)!.settings.arguments as Todo;
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const DetailScreen(),
// // Pass the arguments as part of the RouteSettings. The
// // DetailScreen reads the arguments from these settings.
// settings: RouteSettings(
// arguments: todos[index],
// ),
// )

//接收返回数据
// Navigator.pop(context, 'Nope.');

// A method that launches the SelectionScreen and awaits the result from
// Navigator.pop.
// Future<void> _navigateAndDisplaySelection(BuildContext context) async {
//   // Navigator.push returns a Future that completes after calling
//   // Navigator.pop on the Selection Screen.
//   final result = await Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const SelectionScreen()),
//   );
//
//   // When a BuildContext is used from a StatefulWidget, the mounted property
//   // must be checked after an asynchronous gap.
//   if (!mounted) return;
//
//   // After the Selection Screen returns a result, hide any previous snackbars
//   // and show the new result.
//   ScaffoldMessenger.of(context)
//     ..removeCurrentSnackBar()
//     ..showSnackBar(SnackBar(content: Text('$result')));
// }

