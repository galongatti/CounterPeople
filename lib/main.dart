import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/imagemFundo.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Not cleared" : "Cleared",
              style: TextStyle(
                  fontSize: 28,
                  color: isFull
                      ? const Color.fromARGB(255, 236, 3, 3)
                      : Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "$count",
                  style: TextStyle(
                      fontSize: 40,
                      color: isFull
                          ? const Color.fromARGB(255, 236, 3, 3)
                          : Colors.white,
                      fontWeight: FontWeight.w400),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextButton(
                        onPressed: isEmpty ? null : decrement,
                        child: const Text(
                          "Leave",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: isEmpty
                                ? const Color.fromARGB(255, 134, 130, 130)
                                : const Color.fromARGB(255, 236, 3, 3),
                            padding: const EdgeInsets.all(12),
                            fixedSize: const Size(100, 100),
                            primary: const Color.fromARGB(255, 56, 46, 46),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))))),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      "Enter",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? const Color.fromARGB(255, 134, 130, 130)
                            : const Color.fromARGB(255, 45, 167, 22),
                        padding: const EdgeInsets.all(12),
                        fixedSize: const Size(100, 100),
                        primary: const Color.fromARGB(255, 56, 46, 46),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
