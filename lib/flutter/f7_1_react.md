
======FutureBuilder和 Provider
FutureBuilder和Provider是Flutter中用于不同目的的两个概念，它们在应用的状态管理和数据流处理中扮演着不同的角色。
FutureBuilder 异步处理刷新ui  （异步操作库）
Provider widget树之间传递数据 （状态管理库）

FutureBuilder是一个Flutter的Widget，它根据与Future的交互来构建自己的UI。它主要用于异步操作，比如网络请求或数据库查询。当你有一个返回Future的异步操作，并且你想在操作完成时更新UI，FutureBuilder就非常有用。

- 用途：处理单个异步操作的结果，并根据这个异步操作的状态（等待、完成、错误）来构建UI。
- 工作方式：你提供一个Future给FutureBuilder，并提供一个builder函数。这个builder函数根据Future的状态（等待、完成、错误）返回不同的Widget。
  Provider

Provider是一个流行的状态管理库，它使用了Flutter的InheritedWidget来在Widget树中传递数据。Provider旨在使状态的管理和组件之间的通信变得更简单、更高效。

- 用途：在应用的不同部分之间共享数据和状态。它不仅限于异步数据，也适用于任何需要跨多个Widget共享的数据。
- 工作方式：你在应用的顶层提供一个状态或数据对象，然后在Widget树的任何地方，你都可以读取或监听这个状态的变化。当状态改变时，所有使用这个状态的Widget都会自动重建。
  区别

- 目的不同：FutureBuilder主要用于处理单个异步操作并根据操作结果更新UI，而Provider用于在应用的不同部分之间共享数据和状态(当然异步处理完通知肯定也行)。
- 使用场景不同：如果你只是需要处理一个异步操作并在完成时更新UI，使用FutureBuilder就足够了。如果你需要在多个Widget之间共享数据或状态，并且希望当数据改变时能够自动更新UI，那么Provider会是更好的选择。
- 工作原理不同：FutureBuilder依赖于Future的状态来构建UI，而Provider通过InheritedWidget在Widget树中传递和监听数据或状态的变化。

总的来说，FutureBuilder和Provider服务于Flutter应用中不同的需求，它们可以单独使用，也可以结合使用来构建高效、可维护的应用。

================ChangeNotifierProvider
Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ //这样Model内容改版后，调用notify，child就会重新刷新了
        ChangeNotifierProvider(create: (context) => Model extends ChangeNotifier),
      ],
      child: const Widget(),
    );
}

或者子widget也可以获取到model
Provider.of<CounterModel>(context, listen: false).increment()

=========Consumer
final counter = Provider.of<CounterModel>(context, listen: false);
也行，但是有一种情况，就是widget 创建了provider，但是也要消费它
@override
/// Widget build(BuildContext context) {
///   return ChangeNotifierProvider(
///     create: (_) => Foo(),
///     child: Text(Provider.of<Foo>(context).value),// 
   throw a [ProviderNotFoundException], 因为自能子widget用
///   );
/// }
//改成这样
/// @override
/// Widget build(BuildContext context) {
///   return ChangeNotifierProvider(
///     create: (_) => Foo(),
///     child: Consumer<Foo>(
///       builder: (_, foo, __) => Text(foo.value),
///     },
///   );
/// }
2.第二种情况
///  @override
///  Widget build(BuildContext context) {
///    return FooWidget(
///      child: BarWidget(
///        bar: Provider.of<Bar>(context),
///      ),
///    );
///  }
、、上面的会都刷新，下面的只是BarWidget刷新 如果bar有变化
///  @override
///  Widget build(BuildContext context) {
///    return FooWidget(
///      child: Consumer<Bar>(
///        builder: (_, bar, __) => BarWidget(bar: bar),
///      ),
///    );
///  }

这个builder就是要渲染的widget。

* [Selector], a [Consumer] that can filter updates.

==============BuildContext
BuildContext 是 Flutter 中一个非常核心的概念，它代表了小部件树中的位置。
每一个小部件都有一个与之关联的 BuildContext，这个上下文对象描述了小部件在整个小部件树中的位置。
通过 BuildContext，小部件可以访问它们的父级、兄弟级和子级小部件，以及各种继承的数据。
1使用 Theme.of(context) 来获取当前主题数据，或 MediaQuery.of(context) 来获取媒体查询数据等。
2导航：使用 Navigator.of(context) 可以进行页面的导航操作

==========数据传递
跳转 Provider(create: (context) => entity, child: const Screen())
var entity = Provider.of<data>(context);//initState后

======路由页
就是一个新的页面。
一个完整的路由页可能会包含导航栏、抽屉菜单(Drawer)以及底部 Tab 导航菜单等。如果每个路由页面都需要开发者自己手动去实现这些，这会是一件非常麻烦且无聊的事
Scaffold 是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面

=======数据共享
InheritedWidget 提供一种在 widget 树中从上到下共享数据的方式
从下到上或者横向等。Flutter 提供了一个 ValueListenableBuilder 组件，
跨组件共享的状态 ，Provider

===================Redux
原文链接：https://blog.csdn.net/Coo123_/article/details/135246411
Redux
Redux 的概念是状态管理，那在已有 state 的基础上，为什么还需要 Redux ？
因为使用 Redux 的好处是：共享状态和单一数据。
试想一下，App内有多个地方使用到登陆用户的数据，这时候如果某处对用户数据做了修改，各个页面的同步更新会是一件麻烦的事情。

但是引入 Redux 后，某个页面修改了当前用户信息，所有绑定了 Redux 的控件，将由 Redux 自动同步刷新。
See！这在一定程度节省了我们的工作量，并且单一数据源在某些场景下也方便管理。同理我们后面所说的 主题 和 多语言 切换也是如此。


=========Bloc
BLoC的主要功能是将业务逻辑与UI分离，从而使得应用程序更易于维护和扩展
其实也是后面处理业务逻辑，前方更新，解耦， 和 ChangeNotifier 那种一个作用。



==========FutureBuilder
接收一个 Future async方法，然后刷新。
@override
Widget build(BuildContext context) {
var entity = Provider.of<CourseListDataList>(context);
 return FutureBuilder<CourseContentEntity>(
        future:  _homeViewModel.getData(entity),
        builder: (context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            if (snapshot.data?.data != null) {
              child = buildListView(snapshot.data?.data);
            } else {
              child = Text("暂无数据");
            }
          } else if (snapshot.hasError) {
            child = Text('${snapshot.error}');
          } else {
            child = Text("加载中...");
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: child,
          );
        });
}


class ViewModel {
Future<CourseContentEntity> getData(CourseListDataList entity) async {
try {
var map = {
'courseId': "${entity.courseId}",
};
var response = await HttpUtil.getInstance().post(ApiService.getCourseContent, params: map);
var data = CourseContentEntity.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
}

}

















