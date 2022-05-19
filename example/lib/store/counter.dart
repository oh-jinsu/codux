import "package:codux/codux.dart";
import 'package:example/events/events.dart';

class CounterStore extends Store<int> {
  CounterStore() : super(initialState: 0) {
    on<Increment>((current, event) {
      return current.state + 1;
    });
    on<Decrement>((current, event) {
      return current.state - 1;
    });
  }
}
