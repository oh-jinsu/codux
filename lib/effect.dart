part of "codux.dart";

abstract class Effect extends _EventListener with _CoduxApi {
  final Map<Type, dynamic> _manifest = {};

  Effect() {
    _subscription = _channel.listen((event) {
      _dispatch(event);
    });
  }

  @override
  void _dispatch(Event event) {
    final function = _manifest[event.runtimeType];

    if (function == null) {
      return;
    }

    function(event);
  }

  void on<K extends Event>(void Function(K event) function) {
    _manifest[K] = function;
  }
}
