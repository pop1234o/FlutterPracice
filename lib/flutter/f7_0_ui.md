

//https://docs.flutter.cn/get-started/flutter-for/android-devs android开发者的flutter指南
flutter app 就是widget，
1.学习dart语法
2.然后你就去学习各个widget，就和Android四大组件+各种控件一样，然后各个组件属性，用法 ，然后ui层就搞定了
3.然后就是项目架构了，比如包目录怎么分。 项目的模式，mvvm实现。（去看看开源项目，demo，人家架构，怎么初始化，怎么网络请求渲染数据）
异步网络请求，异步的处理，event传递刷新，
然后去封装一些base（baseui，控件，），util（网络请求，图片请求封装，log，event）。
然后去搞动画，事件处理，自定义组件

https://docs.flutter.cn/ui/layout/tutorial 布局示例


//============tab 文字最后渐隐，是因为text设置不对导致，fade，看源码

//===================居中 ：Center，Container ，Align，Row,Column

//==============padding Padding 控件 ，使用SizedBox控件添加外边距 .使用Column和Row的mainAxisAlignment和crossAxisAlignment属性
//margin padding，都用container包裹一下.  使用Expanded和Flexible控件控制间距
// 在Row或Column布局中，Expanded和Flexible控件可以用来控制子控件如何占用额外的空间，间接影响到间距。
//GestureDetector 点击事件， Container添加背景颜色，
//这是因为在Flutter的渲染系统中，透明的控件默认是不接受触摸事件的 ,Colors.transparent,

//初始化时候能用static 方法，不能用成员方法

//匿名函数 两种写法。胖箭头没有花括号。(page) => page   (page) { return page; }



//项目结构
//flutter_project/
// |- android/ # 包含特定于Android平台的代码
// |- ios/ # 包含特定于iOS平台的代码
// |- lib/
//    |- main.dart # 应用的入口文件
//    |- src/
//       |- models/ # 定义应用中使用的数据模型
//       |- views/ # 或screens/，包含应用的所有界面
//          |- home/
//             |- home_screen.dart
//             |- home_viewmodel.dart
//          |- detail/
//             |- detail_screen.dart
//             |- detail_viewmodel.dart
//       |- widgets/ # 应用中复用的小部件
//          |- custom_button.dart
//          |- custom_textfield.dart
//       |- services/ # 提供网络请求、数据库访问等服务
//          |- api_service.dart
//          |- db_service.dart
//       |- utils/ # 包含各种实用工具类和函数
//          |- constants.dart # 定义全局常量
//          |- theme.dart # 应用的主题数据
//    |- routes.dart # 定义应用的路由
// |- test/ # 包含所有的测试代码
// |- pubspec.yaml # Flutter项目配置文件


//==常用布局


1. Column 和 Row： linearlayout
- 使用场景：当你需要在垂直方向（Column）或水平方向（Row）上排列子Widget时使用。
- 特性：可以控制子Widget的排列方式（如开始、结束、中心对齐），以及它们之间的间距。

2. Stack+Positioned： relativelayout
- 使用场景：用于重叠Widget。当你需要让一个Widget覆盖在另一个Widget上时，使用Stack。
- 特性：子Widget可以根据距离Stack边缘的距离来定位，也可以使用 Positioned Widget来精确控制位置。


3. Container： 
- 使用场景：当你需要对单个Widget进行布局以及装饰（如背景色、边框、阴影等）时使用。
- 特性：可以设置宽度、高度、边距、内边距、装饰等属性。

4. GridView：
- 使用场景：用于创建网格布局。当你需要以二维网格的方式展示一系列的Widget时，如图片画廊。
- 特性：可以指定网格的列数，以及每个网格的大小。

5. ListView：
- 使用场景：用于创建一个滚动的线性列表。当你有一系列需要在垂直或水平方向上展示的Widget时使用。
- 特性：支持懒加载，即只渲染屏幕上可见的Widget，适用于展示长列表。

6. Flex 和 Expanded：
- 使用场景：Flex是Row和Column的底层实现，用于更复杂的布局场景。Expanded用于让子Widget按比例扩展占用空间。
- 特性：Flex允许子Widget有不同的弹性系数（flex factor），Expanded使得其子Widget能够填充未被其他子Widget占用的空间。

7. Wrap：
- 使用场景：当Row或Column中的内容超出屏幕范围时，使用Wrap可以自动转到新的行或列。
- 特性：类似于Row或Column，但是可以自动在水平或垂直方向上“换行”。

8. Padding：
- 使用场景：当你需要给Widget添加内边距时使用。
- 特性：可以控制上、下、左、右的内边距。

9. Align 和 Center：
- 使用场景：当你需要控制子Widget的对齐方式时使用。Center是Align的一个特例，用于将子Widget居中。
- 特性：Align允许你基于其父Widget的四角定位子Widget，Center则是快速居中子Widget的方式。

这些布局Widget是构建Flutter UI的基石，通过组合使用这些Widget，你可以实现几乎任何布局设计。




======路由
void main() {
runApp(MaterialApp(
home: const MyAppHome(), // Becomes the route named '/'.
routes: <String, WidgetBuilder>{
'/a': (context) => const MyPage(title: 'page A'),
'/b': (context) => const MyPage(title: 'page B'),
'/c': (context) => const MyPage(title: 'page C'),
},
));
}
Navigator.of(context).pushNamed('/b'); //或者直接push widget

====pading
虽然Container可以完成Padding的所有工作，但Padding作为一个专一的Widget存在，
是为了提高代码的清晰度、可读性和在某些情况下的性能。
在实际开发中，选择使用哪一个取决于具体的需求和上下文。如果你的Widget仅需要内边距，推荐使用Padding以保持代码的简洁和明确性。

======如何设置margin
Container(
margin: EdgeInsets.all(20.0), // 所有方向均为20.0
child: Text('Hello World'),
)

Padding(
padding: EdgeInsets.all(20.0), // 作为外边距
child: Container(
child: Text('Hello World'),
),
)

SizedBox(
width: 100,
height: 100,
child: Container(
margin: EdgeInsets.all(10), // 内部Container的外边距
child: Text('Hello World'),
),
)

Row(
children: <Widget>[
Padding(
padding: EdgeInsets.all(8.0),
child: Text('Item 1'),
),
Padding(
padding: EdgeInsets.all(8.0),
child: Text('Item 2'),
),
],
)

====组合控件
控件封装起来，都继承StatelessWidget ，比如一个icon+文字，就这样自定义一个即可，  class ButtonWithText extends StatelessWidget {}
然后可以在构造函数传入状态，内部根据状态来展示不同样式。

把页面分为几个部分，每个部分都封装起来

==========一个容器中，根据不同状态展示不同控件，这个怎么实现比较优雅
1.用visibility，根据状态来展示 ,Stack
2.用 true ? widget1  : widget2 
3.封装一个状态模式

=====在Row中设置每个控件的间距，可以通过插入SizedBox或者使用Spacer来实现

====flutter项目中，如果一个页面控件太多了，导致一个dart文件代码太多，该怎么办呢
分割页面业务，多个widget。

=====在Flutter中，Stack的宽度和高度通常由其内部的子Widget决定
Container,SizedBox Positioned Align

====图片点击实现
GestureDetector + Image
InkWell + Image
IconButton 

===在Stack中使用Center对Image进行居中时，如果直接将Image放在Center中可能不会生效，
这是因为Image的实际大小可能受到图片内容的影响。为了确保Image能够正确居中，你可以先将Image放入一个固定大小的Container中，
然后再用Center对这个Container进行居中。这样可以确保无论Image的实际大小如何，它都会被正确地居中显示


====const
1不变的UI：在Flutter中，许多UI组件是不会改变的，比如颜色、文本样式等。使用const来创建这些组件可以提高性能。 
2配置和常量：任何不需要在运行时改变的值，都应该考虑使用const来定义。

====声明式 UI
https://flutter.cn/docs/get-started/flutter-for/declarative
重新构建新的ui，而不是命令式的去修改属性

=====定义函数
final Widget Function(
BuildContext context,
T value,
Widget? child,
) builder;

定义了一个叫builder的函数变量。

==========快捷键
stless 或 stful 




========知识点
Column （ Expanded（ListView） ， button)这样就是上下排列

ListView :padding: EdgeInsets.zero,   可以置顶
shrinkWrap: true,


