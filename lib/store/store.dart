part of '../codux.dart';

class Store<T> extends _EventListener {
  late final BehaviorSubject<T> _subject;

  Stream<T> get stream => _subject;

  final Map<Type, dynamic> _reducerManifest = {};

  Store({T? initialState}) {
    _initializeSubject(initialState);
    _subscribe();
  }

  void _initializeSubject(T? initialState) {
    _subject = initialState == null
        ? BehaviorSubject<T>()
        : BehaviorSubject<T>.seeded(initialState);
  }

  @protected
  void on<K extends Event>(
      T Function(StoreCurrent<T> current, K event) reducer) {
    _reducerManifest[K] = reducer;
  }

  @override
  void _dispatch(Event event) {
    final reducer = _reducerManifest[event.runtimeType];

    if (reducer == null) {
      return;
    }

    final result = reducer(StoreCurrent(_subject.valueOrNull), event);

    _subject.add(result);
  }

  @override
  void _dispose() {
    super._dispose();

    _subject.close();
  }
}
