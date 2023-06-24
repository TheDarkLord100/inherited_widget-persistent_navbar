import 'package:flutter/material.dart';
import 'package:navbar/counter.dart';
import 'package:navbar/extensions.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    String screen = ['Notification', 'Cart', 'Favourite'].elementAt(index);
    final countState = CountState.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$screen Screen').padding(10),
          ElevatedButton(
                  onPressed: countState.addCounter,
                  child: const Icon(Icons.add))
              .padding(10),
          ElevatedButton(
                  onPressed: countState.removeCounter,
                  child: const Icon(Icons.remove))
              .padding(10),
        ],
      ).wrapCenter(),
    );
  }
}
