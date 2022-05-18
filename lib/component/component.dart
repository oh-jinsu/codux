part of '../codux.dart';

abstract class Component extends Lifecycle with _CoduxApi {
  const Component({Key? key}) : super(key: key);

  @override
  @mustCallSuper
  void onCreated(BuildContext context) {
    _constructStores();

    _constructEffects();

    super.onCreated(context);
  }

  @override
  @mustCallSuper
  void onDestroyed(BuildContext context) {
    _cleanEffects();

    _cleanStores();

    super.onDestroyed(context);
  }

  @protected
  void useStore(
    Store Function() constructor, {
    Type? constructAt,
    Type? destroyAt,
  }) {
    final registry = _Registry<Store>(
      constructor,
      from: constructAt ?? runtimeType,
      to: destroyAt ?? runtimeType,
    );

    _storeManifest.registerConstructor(
      constructAt ?? runtimeType,
      registry,
    );
  }

  @protected
  void useEffect(
    Effect Function() constructor, {
    Type? from,
    Type? to,
  }) {
    final registry = _Registry<Effect>(
      constructor,
      from: from ?? runtimeType,
      to: to ?? runtimeType,
    );

    _effectManifest.registerConstructor(
      from ?? runtimeType,
      registry,
    );
  }

  void _constructStores() {
    final registries = _storeManifest.findBoundRegistry(runtimeType);

    if (registries == null) {
      return;
    }

    for (final registry in registries) {
      final store = registry.constructor();

      _storeManifest.addShortcut(store);

      _storeManifest.registerDestructor(registry.to, store);
    }
  }

  void _constructEffects() {
    final registries = _effectManifest.findBoundRegistry(runtimeType);

    if (registries == null) {
      return;
    }

    for (final registry in registries) {
      final effect = registry.constructor();

      _effectManifest.registerDestructor(registry.to, effect);
    }
  }

  void _cleanStores() {
    final stores = _storeManifest.findDestructionRegistries(runtimeType);

    if (stores == null) {
      return;
    }

    for (final store in stores) {
      _storeManifest.removeShortcut(store.runtimeType);

      store._dispose();
    }

    _storeManifest.cleanupDestructorsBelongsTo(runtimeType);
  }

  void _cleanEffects() {
    final effects = _effectManifest.findDestructionRegistries(runtimeType);

    if (effects == null) {
      return;
    }

    for (final effect in effects) {
      effect._dispose();
    }

    _effectManifest.cleanupDestructorsBelongsTo(runtimeType);
  }
}
