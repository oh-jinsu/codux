import "package:codux/codux.dart";
import 'package:example/events/events.dart';

class CounterStore extends Store<int> {
  CounterStore() : super(const InitialState(0)) {
    on<Increment>((event) {
      return state + 1;
    });
    on<Decrement>((event) {
      return state - 1;
    });
  }
}
