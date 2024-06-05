

### 万物widget
https://book.flutterchina.club/chapter2/flutter_widget_intro.html#_2-2-3-flutter%E4%B8%AD%E7%9A%84%E5%9B%9B%E6%A3%B5%E6%A0%91

widget树-》映射出Element树-》renderObject树 =》layout树

Image中的RawImage ,Text中RichText才是真正渲染的东西。

Element这个纽带将Widget和RenderObject关联起来

每个Element都对应一个RenderObject


### UI框架
Android SDK（View体系） =>  Android操作系统的图形渲染库（OpenGL）=> CPU => Gpu =>屏幕
IOS UIKit =>  IOS操作系统的图形库 （Metal） 

我们flutter代码 =》 flutter sdk => 各个操作系统的图形库（一开始都是OpenGL）

### of
of(context) //获取xx的实例  


### BuildContext
StatelessWidget和StatefulWidget的build方法都会传一个BuildContext对象：
Widget build(BuildContext context) {}

BuildContext 就是widget对应的Element

### 为什么用响应式
这是因为响应式的思想本身是很棒的


### RenderObject子类
Flutter框架提供了一个 RenderBox 和一个 RenderSliver类，它们都是继承自 RenderObject
提供了坐标系，布局约束协议，子节点模型


### ===================== Flutter启动流程和渲染管线
void main() => runApp(MyApp());
参数app是一个 widget，它是 Flutter 应用启动后要展示的第一个组件。

void runApp(Widget app) {
WidgetsFlutterBinding.ensureInitialized()
..attachRootWidget(app)
..scheduleWarmUpFrame();
}

Window的官方解释：
The most basic interface to the host operating system's user interface.
Window 正是 Flutter Framework 连接宿主操作系统的接口。























