import "package:codux/codux.dart";
import 'package:example/events/events.dart';
import 'package:example/screens/incremenent_counter.dart';
import 'package:example/screens/decrement_counter.dart';
import 'package:example/store/counter.dart';
import 'package:flutter/material.dart';

class Welcome extends Component {
  const Welcome({Key? key}) : super(key: key);

  @override
  void onCreated(BuildContext context) {
    useStore(
      () => CounterStore(),
      from: IncrementCounter,
      until: DecrementCounter,
    );

    super.onCreated(context);
  }

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        dispatch(const Replaced("/section2"));
      },
      child: const Scaffold(
        body: Center(child: Text("Welcome!\nLet's play with counter")),
      ),
    );
  }
}
