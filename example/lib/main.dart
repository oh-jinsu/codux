import 'package:codux/codux.dart';
import 'package:example/effects/navigation.dart';
import 'package:example/screens/home.dart';
import 'package:example/screens/welcome.dart';
import 'package:example/screens/incremenent_counter.dart';
import 'package:example/screens/decrement_counter.dart';
import 'package:example/screens/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends Component {
  const MyApp({super.key});

  @override
  void onCreated(BuildContext context) {
    useEffect(() => NavigationEffect());

    super.onCreated(context);
  }

  @override
  Widget render(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      onGenerateRoute: (settings) {
        final name = settings.name;

        if (name == "/splash") {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        }

        if (name == "/home") {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }

        if (name == "/section1") {
          return MaterialPageRoute(
            builder: (context) => const Welcome(),
          );
        }

        if (name == "/section2") {
          return MaterialPageRoute(
            builder: (context) => const IncrementCounter(),
          );
        }

        if (name == "/section3") {
          return MaterialPageRoute(
            builder: (context) => const DecrementCounter(),
          );
        }

        return null;
      },
    );
  }
}
