import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'decision_input_page.dart';
import '../widgets/complication_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to ThinkAgain!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DecisionInputPage()),
                );
              },
              child: Text('Start Overthinking'),
            ),
            ComplicationSlider(),
          ],
        ),
      ),
    );
  }
}
