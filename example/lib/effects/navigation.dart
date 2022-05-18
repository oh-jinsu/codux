import 'package:codux/codux.dart';
import 'package:example/events/events.dart';
import 'package:flutter/widgets.dart';

class NavigationEffect extends Effect {
  NavigationEffect() {
    on<Pushed>((event) {
      Navigator.of(requireContext()).pushNamed(
        event.name,
        arguments: event.arguments,
      );
    });
    on<Replaced>((event) {
      Navigator.of(requireContext()).pushReplacementNamed(
        event.name,
        arguments: event.arguments,
      );
    });
    on<Popped>((event) {
      Navigator.of(requireContext()).pop();
    });
  }
}
