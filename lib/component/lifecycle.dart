part of '../codux.dart';

abstract class Lifecycle extends StatelessWidget {
  const Lifecycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Lifecycle(
      inheritedContext: context,
      label: toString(),
      renderer: render,
      onCreate: onCreated,
      onStart: onStarted,
      onDestroy: onDestroyed,
    );
  }

  @protected
  void onCreated(BuildContext context) {}

  @protected
  void onStarted(BuildContext context) {}

  @protected
  void onDestroyed(BuildContext context) {}

  @protected
  Widget render(BuildContext context);
}

class _Lifecycle extends StatefulWidget {
  final BuildContext inheritedContext;
  final String label;
  final Widget Function(BuildContext) renderer;
  final void Function(BuildContext) onCreate;
  final void Function(BuildContext) onStart;
  final void Function(BuildContext) onDestroy;

  const _Lifecycle({
    Key? key,
    required this.inheritedContext,
    required this.label,
    required this.renderer,
    required this.onCreate,
    required this.onStart,
    required this.onDestroy,
  }) : super(key: key);

  @override
  State<_Lifecycle> createState() => _ControllerState();
}

class _ControllerState extends State<_Lifecycle> {
  @override
  void initState() {
    widget.onCreate(context);

    _contextQueue.addLast(context);

    super.initState();
  }

  @override
  void dispose() {
    widget.onDestroy(context);

    _contextQueue.remove(context);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => widget.onStart(context));

    return widget.renderer(context);
  }
}
