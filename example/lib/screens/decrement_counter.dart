import "package:codux/codux.dart";
import 'package:example/events/events.dart';
import 'package:example/store/counter.dart';
import 'package:flutter/material.dart';

class DecrementCounter extends Component {
  const DecrementCounter({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        dispatch(const Popped());
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
                    const Text("Decrement counter"),
                    Text(snapshot.data.toString()),
                    TextButton(
                      onPressed: () {
                        dispatch(const Decrement());
                      },
                      child: const Text("decrement"),
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
