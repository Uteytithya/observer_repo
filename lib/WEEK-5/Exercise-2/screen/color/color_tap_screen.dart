import 'package:flutter/material.dart';
import 'package:observer_repo/WEEK-5/Exercise-2/model/card_type.dart';
import 'package:observer_repo/WEEK-5/Exercise-2/provider/count_notifier.dart';
import 'package:observer_repo/WEEK-5/Exercise-2/screen/color/widget/color_tap.dart';
import 'package:provider/provider.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          Consumer<CounterModel>(
            builder: (context, counter, child) => ColorTap(
              type: CardType.red,
              tapCount: counter.redCount,
              onTap: counter.redIncrement,
            ),
          ),
          Consumer<CounterModel>(
            builder: (context, counter, child) => ColorTap(
              type: CardType.blue,
              tapCount: counter.blueCount,
              onTap: counter.blueIncrement,
            ),
          ),
        ],
      ),
    );
  }
}
