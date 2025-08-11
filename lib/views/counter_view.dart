// ignore_for_file: unused_element

import 'package:flutter/material.dart';

// todo counter app
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 2;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                decrement();
              },
              child: Icon(Icons.remove, size: 30),
            ),
            // todo
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
            ),
            // todo
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

// _____________ todo theme toggle

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool isDark = false;

  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: GestureDetector(
        onTap: changeTheme,
        child: Center(
          // todo
          child: AnimatedSwitcher(
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
          ),
        ),
      ),
    );
  }
}
