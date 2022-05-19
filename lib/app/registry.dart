part of "../codux.dart";

class _Registry<T> {
  final Type from;
  final Type until;
  final T Function() constructor;

  const _Registry(
    this.constructor, {
    required this.from,
    required this.until,
  });
}
