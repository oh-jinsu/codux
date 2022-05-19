Codux is a state management library inspired by Redux.

## Features

### Declare your various events.

You can list all the events that will happen in your app.

### Implement your tiny store.

You can store the current state of a particular model separately.

### Intercept the side effects.

You should finish all the job with side effects before changing the state.

### Keep your stores and effects for a certain period.

You can also specify when your stores and effects is constructed and destoryed.

## Getting started

```
flutter pub add codux
```

## Usage

### Declare your various events.
```dart
class Increment implements Event<void> {
  const Increment();
}
```

### Implement your tiny store.

```dart
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
```

### Intercept the side effects.
```dart
class FindMoviesEffect extends Effect {
  FindMoviesEffect() {
    on<FindMovies>((current, event) {
      Client.get("/movies").then((data) {
        dispatch(MoviesFound(data));
      });
    });
  }
}
```

### Keep your stores and effects for a certain period.

```dart
class MovieListPage extends Component {
  const MovieListPage({super.key});

  @override
  void onCreated(BuildContext context) {
    useStore(() => MovieListStore());
    useEffect(() => FindMoviesEffect());

    super.onCreated(context);
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: find<MovieListStore>().stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (final element in snapshot.data)
                  MovieListTile(element)
              ]
            );
          }
        },
      ),
    );
  }
}
```