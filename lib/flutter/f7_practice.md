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

1. Column 和 Row：
- 使用场景：当你需要在垂直方向（Column）或水平方向（Row）上排列子Widget时使用。
- 特性：可以控制子Widget的排列方式（如开始、结束、中心对齐），以及它们之间的间距。

2. Stack：
- 使用场景：用于重叠Widget。当你需要让一个Widget覆盖在另一个Widget上时，使用Stack。
- 特性：子Widget可以根据距离Stack边缘的距离来定位，也可以使用Positioned Widget来精确控制位置。

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


====pading
虽然Container可以完成Padding的所有工作，但Padding作为一个专一的Widget存在，
是为了提高代码的清晰度、可读性和在某些情况下的性能。
在实际开发中，选择使用哪一个取决于具体的需求和上下文。如果你的Widget仅需要内边距，推荐使用Padding以保持代码的简洁和明确性。

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

======FutureBuilder和Provider
FutureBuilder和Provider是Flutter中用于不同目的的两个概念，它们在应用的状态管理和数据流处理中扮演着不同的角色。
FutureBuilder

FutureBuilder是一个Flutter的Widget，它根据与Future的交互来构建自己的UI。它主要用于异步操作，比如网络请求或数据库查询。当你有一个返回Future的异步操作，并且你想在操作完成时更新UI，FutureBuilder就非常有用。

- 用途：处理单个异步操作的结果，并根据这个异步操作的状态（等待、完成、错误）来构建UI。
- 工作方式：你提供一个Future给FutureBuilder，并提供一个builder函数。这个builder函数根据Future的状态（等待、完成、错误）返回不同的Widget。
  Provider

Provider是一个流行的状态管理库，它使用了Flutter的InheritedWidget来在Widget树中传递数据。Provider旨在使状态的管理和组件之间的通信变得更简单、更高效。

- 用途：在应用的不同部分之间共享数据和状态。它不仅限于异步数据，也适用于任何需要跨多个Widget共享的数据。
- 工作方式：你在应用的顶层提供一个状态或数据对象，然后在Widget树的任何地方，你都可以读取或监听这个状态的变化。当状态改变时，所有使用这个状态的Widget都会自动重建。
  区别

- 目的不同：FutureBuilder主要用于处理单个异步操作并根据操作结果更新UI，而Provider用于在应用的不同部分之间共享数据和状态。
- 使用场景不同：如果你只是需要处理一个异步操作并在完成时更新UI，使用FutureBuilder就足够了。如果你需要在多个Widget之间共享数据或状态，并且希望当数据改变时能够自动更新UI，那么Provider会是更好的选择。
- 工作原理不同：FutureBuilder依赖于Future的状态来构建UI，而Provider通过InheritedWidget在Widget树中传递和监听数据或状态的变化。

总的来说，FutureBuilder和Provider服务于Flutter应用中不同的需求，它们可以单独使用，也可以结合使用来构建高效、可维护的应用。


==========数据传递
跳转 Provider(create: (context) => entity, child: const Screen())
var entity = Provider.of<data>(context);//initState后































