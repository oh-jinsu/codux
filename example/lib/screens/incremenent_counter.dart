import "package:codux/codux.dart";
import 'package:example/events/events.dart';
import 'package:example/store/counter.dart';
import 'package:flutter/material.dart';

class IncrementCounter extends Component {
  const IncrementCounter({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        dispatch(const Replaced("/section3"));
      },
      child: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: find<CounterStore>().stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Increment Counter"),
                    Text(snapshot.data.toString()),
                    TextButton(
                      onPressed: () {
                        dispatch(
                          const Increment(),
                        );
                      },
                      child: const Text("increment"),
                    ),
                  ],
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
