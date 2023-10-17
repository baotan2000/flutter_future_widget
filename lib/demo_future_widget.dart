import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoFututeWidget extends StatefulWidget {
  const DemoFututeWidget({super.key});

  @override
  State<DemoFututeWidget> createState() => _DemoFututeWidgetState();
}

class _DemoFututeWidgetState extends State<DemoFututeWidget> {
  Future<int> randomNumber() {
    Completer<int> completer = Completer();

    Future.delayed(Duration(seconds: 2), () {
      completer.complete(Random().nextInt(1000));
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Future Widget"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<int>(
            future: randomNumber(),
            initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return InkWell(
                onTap: () {
                  setState(() {});
                },
                child: Text(
                  (snapshot.data ?? 0).toString(),
                  style: TextStyle(fontSize: 40),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
