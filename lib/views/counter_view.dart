// ignore_for_file: unused_element

import 'package:flutter/material.dart';

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
