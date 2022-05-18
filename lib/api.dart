part of "codux.dart";

mixin _CoduxApi {
  @protected
  T find<T extends Store>() {
    final result = _storeManifest.findShortcut(T);

    assert(result != null, "$T is not found");

    return result as T;
  }

  @protected
  void dispatch(Event event) {
    _channel.add(event);
  }
}
