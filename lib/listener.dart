part of 'codux.dart';

abstract class _EventListener {
  late final StreamSubscription _subscription;

  void _subscribe() {
    _subscription = _channel.listen((event) {
      _dispatch(event);
    });
  }

  void _dispatch(Event event);

  @mustCallSuper
  void _dispose() {
    onDispose();

    _subscription.cancel();
  }

  @protected
  void onDispose() {}
}
