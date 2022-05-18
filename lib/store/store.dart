part of '../codux.dart';

class Store<T> extends _EventListener {
  late final BehaviorSubject<T> _subject;

  bool get hasState => _subject.hasValue;

  T get state => _subject.value;

  Stream<T> get stream => _subject.stream;

  final Map<Type, dynamic> _reducerManifest = {};

  Store(InitialState<T>? initialState) {
    _initializeSubject(initialState);
    _subscribe();
  }

  void _initializeSubject(InitialState<T>? initialState) {
    _subject = initialState == null
        ? BehaviorSubject<T>()
        : BehaviorSubject<T>.seeded(initialState.value);
  }

  @protected
  void on<K extends Event>(T Function(K event) reducer) {
    _reducerManifest[K] = reducer;
  }

  @override
  void _dispatch(Event event) {
    final reducer = _reducerManifest[event.runtimeType];

    if (reducer == null) {
      return;
    }

    final result = reducer(event);

    _subject.add(result);
  }

  @override
  void _dispose() {
    super._dispose();

    _subject.close();
  }
}
