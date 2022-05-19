part of '../codux.dart';

class StoreCurrent<T> {
  final T? _state;

  bool get hasState => _state != null;

  T get state => _state!;

  const StoreCurrent(T? state) : _state = state;
}
