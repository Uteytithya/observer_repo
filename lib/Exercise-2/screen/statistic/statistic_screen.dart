import 'package:flutter/material.dart';
import 'package:observer_repo/Exercise-2/provider/count_notifier.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(
              builder: (context, counter, child) => Text(
                'Red Taps: ${counter.redCount}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Consumer<CounterModel>(
              builder: (context, counter, child) => Text(
                'Blue Taps: ${counter.blueCount}',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

