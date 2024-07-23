
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

============网络请求后刷新ui实现的几种方法
1.=============================FutureBuilder
FutureBuilder(
future: fetchSomeData(), // 这是一个返回 Future 的函数
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return CircularProgressIndicator(); // 加载中显示
} else if (snapshot.hasError) {
return Text('Error: ${snapshot.error}'); // 错误处理
} else {
return Text('Data: ${snapshot.data}'); // 显示数据
}
},
)


2.==========================Provider

class DataModel with ChangeNotifier {
String _data;

String get data => _data;

void fetchData() async {
_data = await fetchSomeData();
notifyListeners(); // 通知监听者数据已更新
}
}

// 在 UI 中
Consumer<DataModel>(
builder: (context, model, child) {
return Text(model.data);
},
)

3.==================Riverpod: 这是一个相对较新的状态管理库，由 Provider 的作者开发，提供了更多的灵活性和功能。

4.================setState于小型或简单的应用，你可以使用 Flutter 的基本 setState 方法来更新 UI
void _fetchData() async {
var data = await fetchSomeData();
setState(() {
_data = data;
});
}

5 使用 Stream 和 StreamBuilder
StreamBuilder(
stream: streamOfData(), // 这是一个 Stream
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return CircularProgressIndicator();
} else if (snapshot.hasError) {
return Text('Error: ${snapshot.error}');
} else {
return ListView.builder(
itemCount: snapshot.data.length,
itemBuilder: (context, index) => ListTile(
title: Text(snapshot.data[index]),
),
);
}
},
)

6======================= BLoC / Flutter Bloc

class DataBloc extends Bloc<DataEvent, DataState> {
DataBloc() : super(DataInitial()) {
on<FetchData>((event, emit) async {
emit(DataLoading());
try {
final data = await NetworkService.fetchData();
emit(DataLoaded(data));
} catch (e) {
emit(DataError(e.toString()));
}
});
}
}

// 在 UI 中使用
BlocBuilder<DataBloc, DataState>(
builder: (context, state) {
if (state is DataLoading) {
return CircularProgressIndicator();
} else if (state is DataLoaded) {
return Text(state.data);
} else if (state is DataError) {
return Text(state.message);
}
return Container(); // 初始状态或其他状态
},
)

7========================GetX
GetX 是一个轻量级的库，用于状态管理、依赖注入和路由管理。它支持响应式和非响应式状态管理。

8======================Redux
Redux 是一种流行的状态管理模式



==========FutureBuilder +async 网络请求 使用方法
接收一个 Future async 方法，然后刷新。
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


================ChangeNotifier  ChangeNotifierProvider Consumer 来实现网络请求
ChangeNotifier Model 的角色
Consumer  View的角色 Consumer监听Model发出的notify
ChangeNotifierProvider Model和Consumer关联。
Provider 子widget获取到Model
   Provider.of<CounterModel>(context, listen: false).increment()


class CounterModel extends ChangeNotifier {
int _count = 0;

    int get count => _count;

    void increment() {
        _count++;
        notifyListeners();
    }
}

void main() {
runApp(
ChangeNotifierProvider(
create: (context) => CounterModel(),
child: MyApp(),
),
);
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: CounterPage(),
);
}
}

class CounterPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Counter")),
body: Center(
child: Consumer<CounterModel>( //======== Consumer监听CounterModel发出的notify
builder: (context, counter, child) => Text( //=========这里传入的是一个函数，counter就是那个model，从里面获取entity，然后根据entity返回数据
'Count: ${counter.count}',
style: Theme.of(context).textTheme.headline4,
),
),
),
floatingActionButton: FloatingActionButton(
onPressed: () => Provider.of<CounterModel>(context, listen: false).increment(),//========获取model,调用getData方法。
tooltip: 'Increment',
child: Icon(Icons.add),
),
);
}
}

==============Consumer 中的方法，这就是Consumer代码，很简单，其实就是Provider.of<T>(context)
final Widget Function(
BuildContext context,
T value,
Widget? child,
) builder;//定义了一个 builder 函数，需要你自己实现，T就是通知你的model，model中定义了entity，重新专享

@override
Widget buildWithChild(BuildContext context, Widget? child) {
return builder(
context,
Provider.of<T>(context), //
child,
);
}



=============================Provider封装

===================BaseModel
import 'package:flutter/material.dart';
class BaseModel extends ChangeNotifier {
bool _isLoading = false;
String _error = '';

bool get isLoading => _isLoading;
String get error => _error;

void setLoading(bool loading) {
_isLoading = loading;
notifyListeners();
}

void setError(String error) {
_error = error;
notifyListeners();
}

Future<void> fetchData() async {
try {
setLoading(true);
// 模拟网络请求
await Future.delayed(Duration(seconds: 2));
// 假设这里是你的数据处理逻辑
setLoading(false);
} catch (e) {
setError(e.toString());
setLoading(false);
}
}
}


==================BaseWidget
class BaseWidget<T extends BaseModel> extends StatefulWidget {
final Widget Function(BuildContext context, T model, Widget? child) builder;
final T model;
final Widget? child;

BaseWidget({Key? key, required this.builder, required this.model, this.child}) : super(key: key);

@override
_BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseModel> extends State<BaseWidget<T>> {
T get model => widget.model;

@override
void initState() {
super.initState();
model.fetchData(); // 自动加载数据
}

@override
Widget build(BuildContext context) {
return ChangeNotifierProvider<T>(
create: (context) => model,
child: Consumer<T>(
builder: widget.builder,
child: widget.child,
),
);
}
}
=======================使用
class MyPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return BaseWidget<BaseModel>(
model: BaseModel(),
builder: (context, model, child) {
if (model.isLoading) {
return CircularProgressIndicator();
}
if (model.error.isNotEmpty) {
return Text('Error: ${model.error}');
}
return Center(
child: Text('Data loaded successfully!'),
);
},
);
}
}




======================================提供get的好处
在Flutter中，使用ScrollController get scrollController => _scrollController;这种方式提供对私有变量_scrollController的访问，是一种常见的封装和数据隐藏的做法。这种做法有几个好处：
1. 封装：
   通过提供一个公共的getter方法而不是直接暴露变量，你可以控制类的内部表示方式，同时对外提供一个稳定的接口。这意味着你可以在不影响类的使用者的情况下，自由地改变变量的内部实现。
2. 只读访问：
   使用getter提供对变量的访问，可以确保外部代码不能修改这个变量，这是实现只读属性的一种方式。在这个例子中，外部代码可以获取_scrollController的引用，但不能将_scrollController设置为另一个对象。
3. 未来的灵活性：
   如果将来你需要在获取_scrollController时添加逻辑（例如，懒加载、日志记录、验证等），使用getter会更加方便。你可以在getter中添加这些逻辑，而不需要修改所有直接访问该变量的代码。
4. 保护内部状态：
   通过限制对内部变量的直接访问，你可以防止外部代码以意外的方式改变对象的内部状态，这有助于维护对象的完整性和一致性。


==============stf widget调用 内部方法
可以 XXWidget({Key? key}) : super(key: GlobalKey<xxState>());
然后  (key as GlobalKey<xxState>?)?.currentState?.xx();



==========================changenotifer释放
如果你使用 Provider 来管理 ChangeNotifier，则不需要手动调用 dispose。Provider 会自动处理 ChangeNotifier 的生命周期。
ChangeNotifierProvider(
create: (context) => MyModel(),
child: MyApp(),
)

如果你是new 的MyModel，没有赋值给ChangeNotifierProvider，那么就需要
@override
void dispose() {
_model.dispose(); // 手动调用 dispose 方法
super.dispose();
}

======================setState刷新问题
StatefulWidget1-》StatefulWidget2
StatefulWidget1刷新，StatefulWidget2 会重新走构造方法，但是不会重新initState
StatefulWidget 的设计原则是封装自己的状态。这意味着组件的显示是基于其内部状态，而不仅仅是基于传入的参数（props）。
如果这些内部状态没有在外部数据变化时更新，那么组件的显示不会反映这些变化。

didUpdateWidget 就会被调用
当与 State 对象关联的 StatefulWidget 接收到新的配置信息时：这通常发生在父组件重建并传递新的 props 给子组件时。
即使是相同类型的 Widget，只要父组件传递给子组件的构造参数发生变化，didUpdateWidget 就会被调用。
didUpdateWidget 主要用于以下几种场景：
响应 props 的变化：如果 StatefulWidget 依赖于外部传入的数据（通过构造函数传入），并且这些数据有可能在 widget 的生命周期中发生变化，你可以在 didUpdateWidget 中根据新的 props 更新内部状态或执行其他操作。
资源管理：如果你的 widget 依赖于一些需要手动管理的资源（如订阅、定时器、网络请求等），并且这些资源的配置依赖于外部传入的参数，你可以在 didUpdateWidget 中根据参数的变化来重新配置这些资源。
优化性能：通过比较新旧 widget 的差异，你可以决定是否需要执行某些计算密集型的操作或资源重载，从而优化应用性能。

=============还是得看文档
If the parent widget rebuilds and requests that this location in the tree update to display a new widget with the same runtimeType and Widget.key, 
the framework will update the widget property of this State object to refer to the new widget and then call this method with the previous widget as an argument.

The framework always calls build after calling didUpdateWidget, which means any calls to setState in didUpdateWidget are redundant.
（所以不需要调用setState ，调用了鸟毛用没有）
所有didUpdateWidget 是用来注册反注册的。还有在initState中赋值，不太行。
In initState, subscribe to the object.
In didUpdateWidget unsubscribe from the old object and subscribe to the new one if the updated widget configuration requires replacing the object.
In dispose, unsubscribe from the object.



调用 setState 会触发当前组件的重建（即重新调用 build 方法），但这并不意味着所有的子孙组件都会重新渲染。Flutter 的渲染机制非常高效，它会尽量避免不必要的重建和重绘。
例如会复用const的子组件



============Listview不让item被回收
class KeepAliveListItem extends StatefulWidget {
final String imageUrl;

KeepAliveListItem({required this.imageUrl});

@override
_KeepAliveListItemState createState() => _KeepAliveListItemState();
}

class _KeepAliveListItemState extends State<KeepAliveListItem> with AutomaticKeepAliveClientMixin {
@override
Widget build(BuildContext context) {
super.build(context); // 需要调用 super.build
return Container(
height: 200,
child: CachedNetworkImage(
imageUrl: widget.imageUrl,
fit: BoxFit.cover,
placeholder: (context, url) => CircularProgressIndicator(),
errorWidget: (context, url, error) => Icon(Icons.error),
),
);
}

@override
bool get wantKeepAlive => true; // 保持活跃状态，不被回收
}


===============列表的状态管理================
播放状态，播放进度
一个item，对应一个entity ，然后每个 都有个 isPlaying
model中有个list<entity>，第一个播放记录 lastIndex
然后点击别的item，把lastIndex停止，这个index 播放，然后刷新列表。
ui上，判断isPlaying，如果true就播放动画，false就停止。









