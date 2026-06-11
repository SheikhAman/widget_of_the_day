# 🧩 Flutter Widget Lifecycle

> A beginner-friendly guide to understanding how Flutter widgets are born, updated, and destroyed.

---

## What is Widget Lifecycle?

Every widget in Flutter goes through a **lifecycle** — a series of stages from the moment it appears on screen to when it's removed. Understanding this helps you write better, more efficient Flutter apps.

Flutter has **two types of widgets**, and each has its own lifecycle:

---

## 1. 🪨 Stateless Widget

A Stateless widget is **read-only** — its data never changes after it's built.

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('I never change!');
  }
}
```

**Key characteristics:**

- The `build()` method runs **only once**
- To show new data, Flutter must **destroy the widget and recreate it** with different values
- Great for static UI elements like labels, icons, or layout wrappers

**Think of it like a printed photo** — once printed, it doesn't change. You'd need to print a new photo to show something different.

---

## 2. 🔄 Stateful Widget

A Stateful widget **can change over time** — it holds data that can update while the app is running.

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
```

**Key characteristics:**

- Calls `setState()` to trigger a **rebuild** of the UI
- Holds a `State` object that persists between rebuilds
- Used for interactive elements like forms, animations, or counters

**Think of it like a whiteboard** — you can erase and rewrite it as many times as you need.

---

## 📋 Stateful Widget Lifecycle Methods

When a Stateful widget is created, Flutter calls these methods in order:

### `initState()`

```dart
@override
void initState() {
  super.initState(); // Always call this first!

  // Your setup code here
  fetchDataFromApi();
  listenToStream();
}
```

- Called **once** when the widget is first inserted into the widget tree
- The right place to do **one-time setup**: fetching data, subscribing to streams, initializing controllers
- Always call `super.initState()` at the very beginning

> ⚠️ Don't try to access the widget's `context` here for navigation or dialogs — it's too early.

---

### `build()`

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Text('Hello, $username!'),
    ),
  );
}
```

- Called **every time** the widget needs to redraw — on first load, and after every `setState()` call
- Should be **fast and free of side effects** — no API calls or heavy logic here
- Returns the widget tree that Flutter renders on screen

> 💡 Keep `build()` simple and pure. Put logic in separate methods or `initState()`.

---

### `setState()`

```dart
void _incrementCounter() {
  setState(() {
    count += 1; // Update your state inside here
  });
}
```

- Not a lifecycle method itself, but how you **trigger a rebuild**
- Wrap your state changes inside `setState(() { ... })` to tell Flutter to redraw the widget
- Only the **current widget** is rebuilt, not the whole app

---

### `dispose()`

```dart
@override
void dispose() {
  myController.dispose(); // Free up resources
  myStreamSubscription.cancel();

  super.dispose(); // Always call this last!
}
```

- Called **once** when the widget is permanently removed from the widget tree
- The right place to **clean up**: dispose controllers, cancel subscriptions, release resources
- Always call `super.dispose()` at the very end

> ⚠️ Forgetting to call `dispose()` can cause **memory leaks** in your app!

---

## 🗺️ Lifecycle at a Glance

```
Widget Created
      │
      ▼
 initState()      ← Runs once. Set up your resources here.
      │
      ▼
   build()        ← Runs every time setState() is called.
      │
   setState()
      │
      ▼
   build()        ← Redraws the UI with new state.
      │
      ▼
  dispose()       ← Runs once. Clean up your resources here.
      │
      ▼
Widget Destroyed
```

---

## 🧠 Quick Reference

| Method | When it runs | Use it for |
|---|---|---|
| `initState()` | Once, on creation | Setup: fetch data, subscribe to streams |
| `build()` | On creation + every `setState()` | Return your widget tree |
| `setState()` | When you want to update UI | Trigger a rebuild with new data |
| `dispose()` | Once, on removal | Cleanup: dispose controllers, cancel streams |

---

## 💡 Tips for Beginners

- **Start with StatelessWidget** when possible — simpler and more performant
- **Move to StatefulWidget** only when you need the UI to react to changes
- Always pair resource creation in `initState()` with cleanup in `dispose()`
- Never put heavy logic or API calls inside `build()` — it runs frequently!

---

*Happy Fluttering! 🐦*