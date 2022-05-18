import 'package:codux/codux.dart';

class Pushed extends Event {
  final String name;
  final Map<String, dynamic>? arguments;

  const Pushed(
    this.name, {
    this.arguments,
  });
}

class Replaced extends Event {
  final String name;
  final Map<String, dynamic>? arguments;

  const Replaced(
    this.name, {
    this.arguments,
  });
}

class Popped extends Event {
  final dynamic result;

  const Popped([
    this.result,
  ]);
}

class Increment extends Event {
  const Increment();
}

class Decrement extends Event {
  const Decrement();
}
