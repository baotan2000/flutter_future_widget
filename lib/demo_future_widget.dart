import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoFututeWidget extends StatefulWidget {
  const DemoFututeWidget({super.key});

  @override
  State<DemoFututeWidget> createState() => _DemoFututeWidgetState();
}

class _DemoFututeWidgetState extends State<DemoFututeWidget> {
  Future<int?> randomNumber() {
    Completer<int?> completer = Completer();

    Future.delayed(Duration(seconds: 2), () {
      var number = Random().nextInt(1000);
      if (number % 2 == 0) {
        completer.complete(number);
      } else {
        completer.complete(null);
      }
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
          child: FutureBuilder<int?>(
            future: randomNumber(),
            initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("None ${snapshot.data.toString()}");
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  return Text("Active ${snapshot.data.toString()}");
              }
            },
          ),
        ),
      ),
    );
  }
}
