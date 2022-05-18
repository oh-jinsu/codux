import 'package:codux/codux.dart';
import 'package:example/events/events.dart';
import 'package:flutter/material.dart';

class SplashScreen extends Component {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        dispatch(const Replaced("/home"));
      },
      child: Scaffold(
        body: Center(
          child: Text(toString()),
        ),
      ),
    );
  }
}
