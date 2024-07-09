
Either the assertion indicates an error in the framework itself, or we should provide substantially more information in this error message to help you determine and fix the underlying cause.
In either case, please report this assertion by filing a bug on GitHub:
https://github.com/flutter/flutter/issues/new?template=2_bug.yml

The relevant error-causing widget was:
Stack Stack:file:///Users/pop/AndroidStudioProjects/moment-app/lib/widget/common/vip_dialog.dart:16:24
When the exception was thrown, this was the stack:
#2      RenderBox.size (package:flutter/src/rendering/box.dart:2165:12)
#3      RenderStack.layoutPositionedChild (package:flutter/src/rendering/stack.dart:516:46)
#4      RenderStack.performLayout (package:flutter/src/rendering/stack.dart:614:30)
#5      RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#6      RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#7      RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#8      RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#9      RenderCustomPaint.performLayout (package:flutter/src/rendering/custom_paint.dart:569:11)
#10     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#11     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#12     _RenderCustomClip.performLayout (package:flutter/src/rendering/proxy_box.dart:1426:11)
#13     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#14     RenderConstrainedBox.performLayout (package:flutter/src/rendering/proxy_box.dart:280:14)
#15     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#16     RenderPositionedBox.performLayout (package:flutter/src/rendering/shifted_box.dart:456:14)
#17     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#18     RenderPadding.performLayout (package:flutter/src/rendering/shifted_box.dart:239:12)
#19     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#20     RenderPadding.performLayout (package:flutter/src/rendering/shifted_box.dart:239:12)
#21     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#22     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#23     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#24     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#25     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#26     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#27     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#28     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#29     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#30     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#31     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#32     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#33     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#34     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#35     RenderOffstage.performLayout (package:flutter/src/rendering/proxy_box.dart:3712:13)
#36     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#37     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#38     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#39     _RenderTheaterMixin.layoutChild (package:flutter/src/widgets/overlay.dart:974:13)
#40     _RenderTheater.performLayout (package:flutter/src/widgets/overlay.dart:1288:9)
#41     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#42     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#43     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#44     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#45     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#46     RenderProxyBoxMixin.performLayout (package:flutter/src/rendering/proxy_box.dart:105:21)
#47     RenderObject.layout (package:flutter/src/rendering/object.dart:2577:7)
#48     ChildLayoutHelper.layoutChild (package:flutter/src/rendering/layout_helper.dart:52:11)
#49     RenderStack._computeSize (package:flutter/src/rendering/stack.dart:574:43)
#50     RenderStack.performLayout (package:flutter/src/rendering/stack.dart:601:12)
#51     RenderObject._layoutWithoutResize (package:flutter/src/rendering/object.dart:2416:7)
#52     PipelineOwner.flushLayout (package:flutter/src/rendering/object.dart:1051:18)
#53     PipelineOwner.flushLayout (package:flutter/src/rendering/object.dart:1064:15)
#54     RendererBinding.drawFrame (package:flutter/src/rendering/binding.dart:577:23)
#55     WidgetsBinding.drawFrame (package:flutter/src/widgets/binding.dart:1138:13)
#56     RendererBinding._handlePersistentFrameCallback (package:flutter/src/rendering/binding.dart:443:5)
#57     SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1392:15)
#58     SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:1313:9)
#59     SchedulerBinding._handleDrawFrame (package:flutter/src/scheduler/binding.dart:1171:5)
#60     _invoke (dart:ui/hooks.dart:312:13)
#61     PlatformDispatcher._drawFrame (dart:ui/platform_dispatcher.dart:419:5)
#62     _drawFrame (dart:ui/hooks.dart:283:31)
(elided 2 frames from class _AssertionError)
The following RenderObject was being processed when the exception was fired: RenderStack#7fb4f relayoutBoundary=up5 NEEDS-LAYOUT NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
...  parentData: <none> (can use size)
...  constraints: BoxConstraints(280.0<=w<=360.0, 0.0<=h<=710.0)
...  size: Size(360.0, 710.0)
...  alignment: AlignmentDirectional.topStart
...  textDirection: ltr
...  fit: loose
RenderObject: RenderStack#7fb4f relayoutBoundary=up5 NEEDS-LAYOUT NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
parentData: <none> (can use size)
constraints: BoxConstraints(280.0<=w<=360.0, 0.0<=h<=710.0)
size: Size(360.0, 710.0)
alignment: AlignmentDirectional.topStart
textDirection: ltr
fit: loose
...  child 1: RenderConstrainedBox#9722f relayoutBoundary=up6 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
...    parentData: top=38.0; offset=Offset(0.0, 0.0) (can use size)
...    constraints: BoxConstraints(unconstrained)
...    size: MISSING
...    additionalConstraints: BoxConstraints(0.0<=w<=Infinity, h=200.0)
...    child: RenderDecoratedBox#abf8a relayoutBoundary=up7 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
...      parentData: <none> (can use size)
...      constraints: BoxConstraints(0.0<=w<=Infinity, h=200.0)
...      size: MISSING
...      decoration: BoxDecoration
...        borderRadius: BorderRadius.circular(12.0)
...        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xfff6eaa9), Color(0xfffffbe4)], tileMode: TileMode.clamp)
...      configuration: ImageConfiguration(bundle: PlatformAssetBundle#b4eff(), devicePixelRatio: 3.0, locale: en_US, textDirection: TextDirection.ltr, platform: android)
...      child: RenderPadding#47a86 relayoutBoundary=up8 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
...        parentData: <none> (can use size)
...        constraints: BoxConstraints(0.0<=w<=Infinity, h=200.0)
...        size: MISSING
...        padding: EdgeInsets.zero
...        textDirection: ltr
...        child: RenderFlex#a6a42 relayoutBoundary=up9 NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
...          parentData: offset=Offset(0.0, 0.0) (can use size)
...          constraints: BoxConstraints(0.0<=w<=Infinity, h=200.0)
...          size: MISSING
...          direction: vertical
...          mainAxisAlignment: start
...          mainAxisSize: max
...          crossAxisAlignment: center
...          verticalDirection: down
====================================================================================================

======== Exception caught by rendering library =====================================================
The following assertion was thrown during paint():
RenderBox was not laid out: RenderDecoratedBox#abf8a relayoutBoundary=up7
'package:flutter/src/rendering/box.dart':
Failed assertion: line 2165 pos 12: 'hasSize'

=====
这个错误通常是因为在 Flutter 的布局过程中，某个 RenderBox 没有正确地完成布局就尝试进行绘制了。在你的代码中，RenderDecoratedBox 和它的子组件没有被正确地布局。这通常是因为给这些组件的约束不正确或者缺失。
在你的 Stack 中使用了 Positioned 来定位一个 Container，但是可能没有给这个 Container 提供正确的宽度约束。由于 Stack 允许其子组件超出其自身大小，如果不显式设置子组件的宽度，它们可能会尝试去匹配一个无限大的宽度，这会导致布局问题。
=====解决方法，设置显式设置 Container 的宽度，或者使用其他的布局策略来确保 Container 和其内部的组件都有合适的大小和约束。这里是一个可能的修改
Positioned(
top: 38,
left: 0, // 显式设置左边距
right: 0, // 显式设置右边距，确保Container有限制的宽度
child: Container(
height: 200,

===================Stack如何设置高度，或者包裹内容
在 Flutter 中，Stack 组件本身不提供直接设置高度或自动包裹其子组件高度的属性。Stack 默认会尽可能填充其父组件提供的空间。如果你想让 Stack 的大小根据其子组件来确定，你可以使用几种方法来实现：
1. 使用 IntrinsicHeight 组件： 这个组件会调整其子组件的高度，使其适应子组件的实际高度。但是请注意，IntrinsicHeight 可能会带来较高的性能成本，因为它需要先测量子组件的大小。
2. 使用 Wrap 组件： 如果 Stack 的子组件不需要重叠，可以使用 Wrap 来代替 Stack，因为 Wrap 会自动根据子组件的大小来调整自身的大小。
3. 手动设置高度： 如果你知道子组件的高度，可以通过设置 Container 或者 SizedBox 来手动指定 Stack 的高度。
   下面是一个使用 IntrinsicHeight 来使 Stack 包裹内容的示例：

class MyStackWidget extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Center(
child: IntrinsicHeight(
child: Stack(
children: <Widget>[
Positioned(
top: 0,
left: 0,
child: Container(
width: 100,
height: 100,
color: Colors.red,
),
),
Positioned(
bottom: 0,
right: 0,
child: Container(
width: 100,
height: 150,
color: Colors.blue,
),
),
],
),
),
);
}
}
在这个例子中，Stack 会根据其最高的子组件（蓝色容器，高度为 150）来设置其高度。这种方法适用于子组件大小固定且已知的情况。如果子组件大小动态变化，使用 IntrinsicHeight 可能会导致性能问题，这时候可能需要考虑其他布局策略。



================
The ownership chain for the RenderObject that received the incompatible parent data was:
Semantics ← Image ← Positioned ← ClipRRect ← Stack ← Consumer<QuesPracticeResultViewModel> ← _InheritedProviderScope<QuesPracticeResultViewModel?> ← ChangeNotifierProvider<QuesPracticeResultViewModel> ← BaseConsumerView<QuesPracticeResultViewModel> ← KeyedSubtree-[GlobalKey#f5c72] ← ⋯
When the exception was thrown, this was the stack:
#0      RenderObjectElement._updateParentData.<anonymous closure> (package:flutter/src/widgets/framework.dart:6545:11)
#1      RenderObjectElement._updateParentData (package:flutter/src/widgets/framework.dart:6562:6)
#2      ParentDataElement._applyParentData.applyParentDataToChild (package:flutter/src/widgets/framework.dart:5863:15)
#3      ParentDataElement._applyParentData.applyParentDataToChild (package:flutter/src/widgets/framework.dart:5865:9)
#4      ParentDataElement._applyParentData (package:flutter/src/widgets/framework.dart:5869:7)
#5      ParentDataElement.notifyClients (package:flutter/src/widgets/framework.dart:5913:5)
#6      ProxyElement.updated (package:flutter/src/widgets/framework.dart:5826:5)
#7      ProxyElement.update (package:flutter/src/widgets/framework.dart:5815:5)
#8      Element.updateChild (package:flutter/src/widgets/framework.dart:3827:15)
#9      SingleChildRenderObjectElement.update (package:flutter/src/widgets/framework.dart:6776:14)
#10     Element.updateChild (package:flutter/src/widgets/framework.dart:3827:15)
#11     Element.updateChildren (package:flutter/src/widgets/framework.dart:3976:32)
#12     MultiChildRenderObjectElement.update (package:flutter/src/widgets/framework.dart:6929:17)
#13     Element.updateChild (package:flutter/src/widgets/framework.dart:3827:15)
#14     ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5512:16)
#15     Element.rebuild (package:flutter/src/widgets/framework.dart:5203:7)
#16     BuildOwner.buildScope (package:flutter/src/widgets/framework.dart:2905:19)
#17     WidgetsBinding.drawFrame (package:flutter/src/widgets/binding.dart:1136:21)
#18     RendererBinding._handlePersistentFrameCallback (package:flutter/src/rendering/binding.dart:443:5)
#19     SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1392:15)
#20     SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:1313:9)
#21     SchedulerBinding._handleDrawFrame (package:flutter/src/scheduler/binding.dart:1171:5)
#22     _invoke (dart:ui/hooks.dart:312:13)
#23     PlatformDispatcher._drawFrame (dart:ui/platform_dispatcher.dart:419:5)
#24     _drawFrame (dart:ui/hooks.dart:283:31)

您遇到的错误是由于 Positioned widget 的父 widget 不是 Stack。在 Flutter 中，Positioned widget 必须作为 Stack widget 的直接子 widget 使用，因为 Positioned 需要 Stack 来正确地定位其子 widget。
错误信息中的 "incompatible parent data" 表示 Positioned widget 的父数据不兼容，这通常是因为它被放置在非 Stack widget 下导致的。
要解决这个问题，请确保 Positioned widget 直接包含在一个 Stack widget 中。这里是一个简单的例子来说明如何正确使用 Positioned：















