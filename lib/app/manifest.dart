part of "../codux.dart";

class _StoreManifest extends _Manifest<Store> {
  final Map<Type, Store> _shortcuts = {};

  void addShortcut(Store store) {
    _shortcuts[store.runtimeType] = store;
  }

  void removeShortcut(Type key) {
    _shortcuts.remove(key);
  }

  Store? findShortcut(Type key) {
    return _shortcuts[key];
  }
}

class _EffectManifest extends _Manifest<Effect> {}

class _Manifest<T> {
  final Map<Type, Map<String, _Registry<T>>> _boundRegistries = {};

  final Map<Type, List<T>> _destructionRegistries = {};

  Iterable<_Registry<T>>? findBoundRegistry(Type key) {
    return _boundRegistries[key]?.values;
  }

  Iterable<T>? findDestructionRegistries(Type key) {
    return _destructionRegistries[key];
  }

  void registerConstructor(Type key, _Registry<T> registry) {
    if (_boundRegistries[key] == null) {
      _boundRegistries[key] = {};
    }

    _boundRegistries[key]![registry.constructor.runtimeType.toString()] =
        registry;
  }

  void registerDestructor(Type key, T store) {
    if (_destructionRegistries[key] == null) {
      _destructionRegistries[key] = [];
    }

    _destructionRegistries[key]!.add(store);
  }

  void cleanupDestructorsBelongsTo(Type key) {
    _destructionRegistries.remove(key);
  }
}
