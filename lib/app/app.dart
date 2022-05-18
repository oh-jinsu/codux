part of "../codux.dart";

final _channel = PublishSubject<Event>();

final _storeManifest = _StoreManifest();

final _effectManifest = _EffectManifest();
