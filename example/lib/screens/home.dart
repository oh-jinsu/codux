import 'package:codux/codux.dart';
import 'package:example/events/events.dart';
import 'package:flutter/material.dart';

class HomeScreen extends Component {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        dispatch(const Pushed("/section1"));
      },
      child: Scaffold(
        body: Center(
          child: Text(toString()),
        ),
      ),
    );
  }
}
