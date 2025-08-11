
# Flutter Animated Widgets

This Flutter project demonstrates multiple **AnimatedSwitcher** use cases, including:

1. **Counter App** – Increment/decrement counter with animated value changes.
2. **Theme Toggle** – Switch between light and dark themes with icon rotation animation.
3. **Auth View** – Toggle between Login and Register forms with sliding & fading animations.

---

## 📂 Features

### 1. CounterView

- A simple counter starting at `2`.
- **AnimatedSwitcher** + `ScaleTransition` used to animate number changes.
- Two buttons for increment (`+`) and decrement (`-`).

```dart
AnimatedSwitcher(
  duration: Duration(milliseconds: 200),
  transitionBuilder: (child, animation) {
    return ScaleTransition(scale: animation, child: child);
  },
  child: Text(
    '$counter',
    key: ValueKey<int>(counter),
    style: TextStyle(fontSize: 30),
  ),
)
````

---

### 2. ThemeToggle

- Toggle light/dark mode by **tapping anywhere on screen**.
- Background color and icon change based on theme.
- **AnimatedSwitcher** + `RotationTransition` for icon rotation.

```dart
AnimatedSwitcher(
  duration: Duration(milliseconds: 200),
  transitionBuilder: (child, animation) {
    return RotationTransition(turns: animation, child: child);
  },
  child: Icon(
    size: 50,
    color: isDark ? Colors.white : Colors.black,
    isDark ? Icons.dark_mode : Icons.light_mode,
    key: ValueKey(isDark),
  ),
)
```

---

### 3. AuthView (Login & Register)

- **AnimatedSwitcher** + `FadeTransition` + `SlideTransition` for smooth form switching.
- Login form:

  - Email and password fields with validation.
- Register form:

  - Username, email, and password fields with validation.
- Toggle between forms using a button (`onToggle` callback).

```dart
AnimatedSwitcher(
  duration: Duration(milliseconds: 200),
  transitionBuilder: (child, animation) {
    final beginOffset = isForward ? Offset(1, 0) : Offset(-1, 0);
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: animation.drive(
          Tween(begin: beginOffset, end: Offset.zero),
        ),
        child: child,
      ),
    );
  },
  child: showLogin
      ? LoginView(onToggle: toggleLogin)
      : RegisterView(onToggle: toggleLogin),
)
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An IDE like VS Code or Android Studio.

### Run the project

```bash
flutter pub get
flutter run
```

---

## 📌 Key Widgets & Concepts Used

- **AnimatedSwitcher** for smooth widget transitions.
- **ScaleTransition**, **RotationTransition**, **FadeTransition**, and **SlideTransition** for animations.
- **Form** and **TextFormField** with validators for input handling.
- **StatefulWidget** and `setState()` for UI updates.

---

## 🖼 Demo Flow

1. **CounterView** – Animated number scaling on increment/decrement.
2. **ThemeToggle** – Animated theme change with icon rotation.
3. **AuthView** – Slide & fade between Login and Register forms.

---

## 📄 License

This project is open-source and free to use for educational purposes.

```

If you want, I can also **add screenshots and GIF previews** inside the README so it looks more professional and ready for GitHub.  
Do you want me to prepare that?
```
